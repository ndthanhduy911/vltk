<?php
namespace Backend\Modules\Users\Controllers;
use Models\Users;
use Models\Roles;
use Backend\Modules\Users\Forms\UserForm;

class UsersController  extends \BackendController {

    public function indexAction(){
        $this->view->form = new UserForm();
    }

    public function getdataAction(){
        $npUsers = Users::getNamepace();
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            $npUsers.'.id',
            $npUsers.'.name',
            $npUsers.'.username',
            $npUsers.'.mail',
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
        $form = new CreateUserForm();
        $form_checked = [];
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $post = $this->request->getPost();
                $password = $this->request->getPost('password');
                $form_checked = $this->request->getPost('department_mg') ;
                $form_checked = is_array($form_checked) ? $form_checked : [];
                $check = Users::findFirstId($this->session->get("user_id"));
                if ($this->security->checkHash($password,$check->password)) {
                    
                    //Kiem tra khu vuc
                    if(!$this->rmt->checkDeptList($form_checked, $this->session->get('department_mg'))){
                        $this->flashSession->error('Khu vực/ Đơn vị không cho phép.');
                        return $this->response->redirect('/users/add');
                    }

                    $user = new Users();
                    $post['password'] = $this->security->hash($this->request->getPost('addpassword'));
                    $form->bind($post,$user);
                    if (!$form->isValid()) {
                        $error = [];
                        foreach ($form->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                        $this->flashSession->error(implode(', ', $error));
                        return $this->response->redirect('properties/edit/' . $id);
                    }

                    $checkUsename = Users::findFirst([
                        "username = :username: AND status != 4",
                        "bind" => [
                            "username" => $this->request->getPost('username'),
                        ]
                    ]);
                    $checkMail = Users::findFirst([
                        "mail = :mail: AND status != 4",
                        "bind" => [
                            "mail" => $this->request->getPost('mail'),
                        ]
                    ]);
                    $checkPhone = Users::findFirst([
                        "phone = :phone: AND status != 4",
                        "bind" => [
                            "phone" => $this->request->getPost('phone'),
                        ]
                    ]);

                    if($checkUsename){
                        $this->flash->error('username đã được sử dụng.');
                    }else if($checkMail){
                        $this->flash->error('email đã được sử dụng.');
                    }else if($checkMail){
                        $this->flash->error('Số điện thoại đã được sử dụng.');
                    }else{
                        $user->created_at = date("Y-m-d H:i:s");
                        $user->updated_at = $user->created_at;
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
                }
            }
        }
        
        $form_check_dept = Departments::getAllListDept();
        $this->view->form_check_dept = $form_check_dept;
        $this->view->form_checked = $form_checked;
        $this->view->form = $form;
    }

    public function editAction($id = null){
        $user = Users::findFirstId($id);
        $form_checked = [];
        if($user){
            $form_checked = json_decode($user->department_mg);
            $form_checked = $form_checked ? $form_checked : [];
            $form = new CreateUserForm($user);
            if ($this->request->isPost()) {
                if ($this->security->checkToken()) {
                    $save = $user;
                    $post = [
                        'name' => $this->request->getPost('name'),
                        'mail' => $this->request->getPost('mail'),
                        'phone' => $this->request->getPost('phone'),
                        'updated_at' => $this->request->getPost('name'),
                        'status' => $this->request->getPost('status'),
                        'avatar' => $this->request->getPost('avatar'),
                        'password' => $this->request->getPost('password'),
                        'role' => $this->request->getPost('role'),
                        'username' => $this->request->getPost('username'),
                    ];
                    $password = $post['password'];
                    $check = Users::findFirstId($this->session->get("user_id"));
                    if ($this->security->checkHash($password,$check->password)) {
                        $form_checked = $this->request->getPost('department_mg');
                        $form_checked = is_array($form_checked) ? $form_checked : [];
                        
                        //Kiem tra khu vuc
                        if(!$this->rmt->checkDeptList($form_checked, $this->session->get('department_mg'))){
                            $this->flash->error('Khu vực/ Đơn vị không cho phép.');
                            return $this->response->redirect('/users/edit/'.$id);
                        }

                        $user->assign(array(
                            'name' => $post['name'],
                            'mail' => $post['mail'],
                            'phone' => $post['phone'],
                            'updated_at' => $post['name'],
                            'status' => $post['status'],
                            'avatar' => $post['avatar'],
                            'role'  => $post['role'],
                            'username'  => $post['username'],
                        ));

                        $checkUsename = Users::findFirst([
                            "username = :username: AND id != :id: AND status != 4",
                            "bind" => [
                                "username" => $post['username'],
                                'id'    => $id,
                            ]
                        ]);

                        $checkMail = Users::findFirst([
                            "mail = :mail: AND id != :id: AND status != 4",
                            "bind" => [
                                "mail" => $post['mail'],
                                'id'    => $id,
                            ]
                        ]);

                        $checkPhone = Users::findFirst([
                            "phone = :phone: AND id != :id: AND status != 4",
                            "bind" => [
                                "phone" => $post['phone'],
                                'id'    => $id,
                            ]
                        ]);

                        if($checkUsename){
                            $this->flash->error('username đã được sử dụng.');
                        }else if($checkMail){
                            $this->flash->error('mail đã được sử dụng.');
                        }else if($checkMail){
                            $this->flash->error('Số điện thoại đã được sử dụng.');
                        }else{
                            $user->department_mg = json_encode($form_checked);
                            $user->updated_at = date('YYYY-MM-DD H:i:s');
                            if (!$user->save()) {
                                foreach ($user->getMessages() as $message) {
                                    $this->flash->error($message);
                                }
                            } else {
                                $this->logs->write_log(2, 1, 'Cập nhật tài khoản ID: '.$save->id,json_encode($save->toArray()),$this->session->get("user_id"));
                                $this->flashSession->success("Cập nhật tài khoản thành công.");
                                return $this->response->redirect('/users/edit/'.$id);
                            }
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
            return $this->response->redirect('/users');
        }

    }

    public function changepwAction($id = null){
        if ($this->request->isPost()) {
            $user = Users::findFirstId($id);
            if($user){
                $form = new CreateUserForm($user);
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
}