<?php
namespace Backend\Modules\Users\Controllers;
use Models\Users;
use Models\Roles;
use Models\Departments;
use Backend\Modules\Users\Forms\UserForm;

class UsersController  extends \BackendController {

    public function indexAction(){
        $this->view->form = new UserForm();
        $this->get_js_css();
    }

    public function getdataAction(){
        $npUsers = Users::getNamepace();
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            $npUsers.'.id',
            $npUsers.'.name',
            $npUsers.'.username',
            $npUsers.'.email',
            $npUsers.'.phone',
            $npUsers.'.status',
            $npUsers.'.avatar',
            $npUsers.'.role',
            $npUsers.'.department_id',
            'D.name dept_name',
            'R.name role_name',
        ))
        ->from($npUsers)
        ->join('Models\Departments', 'D.id = '.$npUsers.'.department_id','D')
        ->join(Roles::getNamepace(), 'R.id = '.$npUsers.'.role','R')
        ->orderBy($npUsers.'.name DESC')
        ->where("1 = 1");
        // if($this->session->get('role') !== 1){
        //     $data = $data->andWhere("department_id IN (".implode(',',$this->session->get('department_mg')).")");
        // }

        $search = $npUsers.'.name LIKE :search:';
        $this->response->setStatusCode(200, 'OK');
        $this->response->setJsonContent($this->ssp->data_output($this->request->get(), $data,$search));
        return $this->response->send();
    }

    public function addAction(){
        $form = new UserForm();
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                // $post = $this->request->getPost();
                // $password = $this->request->getPost('password');
                $form_checked = $this->request->getPost('department_mg') ;
                $form_checked = is_array($form_checked) ? $form_checked : [];
                // $check = Users::findFirstId($this->session->get("user_id"));
                // if ($this->security->checkHash($password,$check->password)) {
                    
                    //Kiem tra khu vuc
                    if(!$this->rmt->checkDeptList($form_checked, $this->session->get('department_mg'))){
                        $this->flashSession->error('Đơn vị/ phòng ban không cho phép.');
                        return $this->response->redirect('/users/add');
                    }

                    $post = [
                        'name'  => $this->request->getPost('name'),
                        'username' => $this->request->getPost('username'),
                        'email'  => $this->request->getPost('email'),
                        'phone' => $this->request->getPost('phone'),
                        'role'  => $this->request->getPost('role'),
                        'status'    => $this->request->getPost('status'),
                        'department_id' => $this->request->getPost('department_id'),
                    ];

                    $user = new Users();
                    $post['password'] = $this->security->hash($this->request->getPost('addpassword'));
                    $form->bind($post, $user);
                    if (!$form->isValid()) {
                        $error = [];
                        foreach ($form->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                        $this->flashSession->error(implode(', ', $error));
                    }

                    $checkUsename = Users::findFirst([
                        "username = :username: AND status != 4",
                        "bind" => [
                            "username" => $this->request->getPost('username'),
                        ]
                    ]);
                    $checkMail = Users::findFirst([
                        "email = :email: AND status != 4",
                        "bind" => [
                            "email" => $this->request->getPost('email'),
                        ]
                    ]);
                    $checkPhone = Users::findFirst([
                        "phone = :phone: AND status != 4",
                        "bind" => [
                            "phone" => $this->request->getPost('phone'),
                        ]
                    ]);

                    if($checkUsename){
                        $this->flashSession->error('username đã được sử dụng.');
                    }else if($checkMail){
                        $this->flashSession->error('email đã được sử dụng.');
                    }else if($checkPhone){
                        $this->flashSession->error('Số điện thoại đã được sử dụng.');
                    }else{
                        $user->department_mg = json_encode($form_checked);
                        if (!$user->save()) {
                            foreach ($user->getMessages() as $message) {
                                $this->flash->error($message);
                            }
                        } else {
                            $this->logs->write_log(1, 1, 'Thêm tài khoản ID: '.$user->id,json_encode($user->toArray()),$this->session->get("user_id"));
                            $this->flashSession->success("Thêm tài khoản thành công.");
                            return $this->response->redirect('/users/add');
                        }
                    }
                // }else{
                //     $this->flash->error('Mật khẩu không chính xác.');
                // }
            }else{
                $this->flashSession->error('Token không chính xác.');
            }
        }
        $this->view->form = $form;

        $this->get_js_css();
    }

    public function editAction($id = null){
        $user = Users::findFirstId($id);
        $form_checked = [];
        if ($this->session->get('role') !== 1) {
            if(!in_array($user->department_id, $this->session->get('department_mg'))){
                $this->flashSession->error("Không tìm thấy dữ liệu");
                return $this->response->redirect('users');
            }
        }
        if($user){
            $form_checked = json_decode($user->department_mg);
            $form_checked = $form_checked ? $form_checked : [];
            $form = new UserForm($user);
            if ($this->request->isPost()) {
                if ($this->security->checkToken()) {
                    $save = $user;
                    $post = [
                        'name' => $this->request->getPost('name'),
                        'email' => $this->request->getPost('email'),
                        'phone' => $this->request->getPost('phone'),
                        'status' => $this->request->getPost('status'),
                        'avatar' => $this->request->getPost('avatar'),
                        'role' => $this->request->getPost('role'),
                        'username' => $this->request->getPost('username'),
                        'department_id' => $this->request->getPost('department_id'),
                    ];

                    $form_checked = $this->request->getPost('department_mg');
                    $form_checked = is_array($form_checked) ? $form_checked : [];
                    
                    //Kiem tra khu vuc
                    if(!$this->rmt->checkDeptList($form_checked, $this->session->get('department_mg'))){
                        $this->flash->error('Đơn vị/ phòng ban không cho phép.');
                        return $this->response->redirect('/users/edit/'.$id);
                    }

                    $checkUsename = Users::findFirst([
                        "username = :username: AND id != :id:",
                        "bind" => [
                            "username" => $post['username'],
                            'id'    => $id,
                        ]
                    ]);

                    $checkMail = Users::findFirst([
                        "email = :email: AND id != :id:",
                        "bind" => [
                            "email" => $post['email'],
                            'id'    => $id,
                        ]
                    ]);

                    $checkPhone = Users::findFirst([
                        "phone = :phone: AND id != :id:",
                        "bind" => [
                            "phone" => $post['phone'],
                            'id'    => $id,
                        ]
                    ]);

                    $form->bind($post, $user);
                    if (!$form->isValid()) {
                        $error = [];
                        foreach ($form->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                        $this->flashSession->error(implode(', ', $error));
                    }

                    if($checkUsename){
                        $this->flash->error('Tài khoản đã được sử dụng.');
                    }else if($checkMail){
                        $this->flash->error('E-mail đã được sử dụng.');
                    }else if($checkPhone){
                        $this->flash->error('Số điện thoại đã được sử dụng.');
                    }else{
                        $user->department_mg = json_encode($form_checked);
                        $user->updated_at = date('YYYY-MM-DD H:i:s');
                        if (!$user->save()) {
                            foreach ($user->getMessages() as $message) {
                                $this->flashSession->error($message);
                            }
                        } else {
                            $this->logs->write_log(2, 1, 'Cập nhật tài khoản ID: '.$save->id,json_encode($save->toArray()),$this->session->get("user_id"));
                            $this->flashSession->success("Cập nhật tài khoản thành công.");
                            return $this->response->redirect('/users/edit/'.$id);
                        }
                    }
                    
                }
            }
            $form_check_dept = Departments::getAllListDept();
            $this->view->form_check_dept = $form_check_dept;
            $this->view->form_checked = $form_checked;
            $this->view->id = $id;
            $this->view->form = $form;
        }else{
            $this->flashSession->error("Không tìm thấy tài khoản.");
            return $this->response->redirect('users');
        }
        $this->get_js_css();
    }

    public function changepwAction($id = null){
        if ($this->request->isPost()) {
            $user = Users::findFirstId($id);
            if($user){
                $form = new UserForm($user);
                if($this->security->checkToken()) {
                    $password = $this->request->getPost('password');
                    $check = Users::findFirstId($this->session->get("user_id"));
                    if ($this->security->checkHash($password,$check->password)) {
                        if(!$this->rmt->checkDeptId($user->department_id, $this->session->get('department_mg'))){
                            $this->flash->error('Khu vực/ Đơn vị không cho phép.');
                            return $this->response->redirect('/users/edit/'.$id);
                        }
                        $user->password = $this->security->hash($this->request->getPost('addpassword'));
                        if (!$user->save()) {
                            foreach ($user->getMessages() as $message) {
                                $this->flash->error($message);
                            }
                        } else {
                            $this->logs->write_log(2, 1, 'Đã thay đổi mật khẩu','',$this->session->get("user_id"));
                            $this->flashSession->success("Thay đổi mật khẩu thành công.");
                            return $this->response->redirect('/users/edit/'.$id);
                        }
                        
                    }
                }else{
                    $this->flashSession->error("Xác thực không chính xác.");
                    return $this->response->redirect('/users/edit/'.$id);
                }
            }else{
                $this->flashSession->error("Không tìm thấy tài khoản.");
                return $this->response->redirect('/users');
            }
        }else{
            return $this->response->redirect('/users');
        }
    }

    public function deleteAction(){
        if ($this->request->isPost()) {
            $password = $this->request->getPost('password');
            $usr = Users::findFirstId($this->session->get("user_id"));
            $id = $this->request->getPost('id');
            if ($this->security->checkHash($password,$usr->password)) {
                $user = Users::findFirst(array(
                    "conditions" => "id = :id: AND id != 1 AND status != 4",
                    "bind" => array("id" => $id)
                ));

                if (!$user) {
                    $this->flash->error("Không tìm thấy tài khoản");
                    return $this->response->redirect('users');
                }else{
                    if(!$this->rmt->checkDeptId($user->department_id, $this->session->get('department_mg'))){
                        $this->flash->error('Khu vực/ Đơn vị không cho phép.');
                        return $this->response->redirect('/users');
                    }
                    $save = $user;
                    $user->status = 4;
                    if (!$user->save()) {
                        foreach ($user->getMessages() as $message) {
                            $this->flash->error($message);
                        }
                        return $this->response->redirect('users');
                    }else{
                        $this->logs->write_log(3, 1, 'Xóa tài khoản',json_encode($save),$this->session->get("user_id"));
                        $this->flashSession->success("Xóa tài khoản thành công");
                        return $this->response->redirect('users');
                    }
                }
            }else{
                $this->flashSession->error("Mật khẩu không chính xác");
                return $this->response->redirect('users');
            }
        }
    }

    public function checkAction(){
        if ($this->request->isPost()) {
            $this->view->disable();
            $password = $this->request->getPost('password');
            $user = Users::findFirstId($this->session->get("user_id"));
            if ($this->security->checkHash($password,$user->password)) {
                $this->response->setStatusCode(200, "Password success");
                $this->response->setJsonContent([
                    'status' => 'OK',
                ]);
                $this->response->send();
            }else{
                $this->response->setStatusCode(400, "Password failed");
                $this->response->setJsonContent([
                    'status' => 'Failed',
                ]);
                $this->response->send();
            }
        }
    }

    private function get_js_css (){
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/users.js');
    }
}