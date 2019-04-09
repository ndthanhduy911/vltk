<?php
namespace Backend\Modules\Pages\Controllers;
use Models\Pages;
use Backend\Modules\Pages\Forms\PagesForm;

class PagesController  extends \BackendController {

    public function indexAction(){
        // $this->view->form = new UserForm();
    }

    public function getdataAction(){
        $npPages = Pages::getNamepace();
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            $npPages.'.id',
            $npPages.'.name',
            $npPages.'.username',
            $npPages.'.mail',
            $npPages.'.phone',
            $npPages.'.status',
            $npPages.'.avatar',
            $npPages.'.role',
            $npPages.'.department_id',
            'D.name dept_name',
            'R.name role_name',
        ))
        ->from($npPages)
        ->join('Models\Departments', 'D.id = '.$npPages.'.department_id','D')
        ->join(Roles::getNamepace(), 'R.id = '.$npPages.'.role','R')
        ->orderBy($npPages.'.name DESC')
        ->where("1 = 1");
        // if($this->session->get('role') !== 1){
        //     $data = $data->andWhere("department_id IN (".implode(',',$this->session->get('department_mg')).")");
        // }

        $search = $npPages.'.name LIKE :search:';
        $this->response->setStatusCode(200, 'OK');
        $this->response->setJsonContent($this->ssp->data_output($this->request->get(), $data,$search));
        return $this->response->send();
    }

    public function addAction(){
        $form = new PagesForm();
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $post = $this->request->getPost();
                $password = $this->request->getPost('password');
                $form_checked = $this->request->getPost('department_mg') ;
                $form_checked = is_array($form_checked) ? $form_checked : [];
                $check = Pages::findFirstId($this->session->get("user_id"));
                if ($this->security->checkHash($password,$check->password)) {
                    
                    //Kiem tra khu vuc
                    if(!$this->rmt->checkDeptList($form_checked, $this->session->get('department_mg'))){
                        $this->flashSession->error('Khu vực/ Đơn vị không cho phép.');
                        return $this->response->redirect('/users/add');
                    }

                    $post = new Pages();
                    $post['password'] = $this->security->hash($this->request->getPost('addpassword'));
                    $form->bind($post,$post);
                    if (!$form->isValid()) {
                        $error = [];
                        foreach ($form->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                        $this->flashSession->error(implode(', ', $error));
                    }

                    $checkUsename = Pages::findFirst([
                        "username = :username: AND status != 4",
                        "bind" => [
                            "username" => $this->request->getPost('username'),
                        ]
                    ]);
                    $checkMail = Pages::findFirst([
                        "mail = :mail: AND status != 4",
                        "bind" => [
                            "mail" => $this->request->getPost('mail'),
                        ]
                    ]);
                    $checkPhone = Pages::findFirst([
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
                        $post->created_at = date("Y-m-d H:i:s");
                        $post->updated_at = $post->created_at;
                        $post->department_mg = json_encode($form_checked);
                        if (!$post->save()) {
                            foreach ($post->getMessages() as $message) {
                                $this->flash->error($message);
                            }
                        } else {
                            $this->logs->write_log(1, 1, 'Thêm tài khoản ID: '.$post->id,json_encode($post->toArray()),$this->session->get("user_id"));
                            $this->flashSession->success("Thêm tài khoản thành công.");
                            return $this->response->redirect('/users/add');
                        }
                    }
                }
            }
        }
        $this->view->form = $form;

        $this->get_js_css();
    }

    public function editAction($id = null){
        $post = Pages::findFirstId($id);
        $form_checked = [];
        if($post){
            $form_checked = json_decode($post->department_mg);
            $form_checked = $form_checked ? $form_checked : [];
            $form = new PagesForm($post);
            if ($this->request->isPost()) {
                if ($this->security->checkToken()) {
                    $save = $post;
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
                    $check = Pages::findFirstId($this->session->get("user_id"));
                    if ($this->security->checkHash($password,$check->password)) {
                        $form_checked = $this->request->getPost('department_mg');
                        $form_checked = is_array($form_checked) ? $form_checked : [];
                        
                        //Kiem tra khu vuc
                        if(!$this->rmt->checkDeptList($form_checked, $this->session->get('department_mg'))){
                            $this->flash->error('Khu vực/ Đơn vị không cho phép.');
                            return $this->response->redirect('/users/edit/'.$id);
                        }

                        $post->assign(array(
                            'name' => $post['name'],
                            'mail' => $post['mail'],
                            'phone' => $post['phone'],
                            'updated_at' => $post['name'],
                            'status' => $post['status'],
                            'avatar' => $post['avatar'],
                            'role'  => $post['role'],
                            'username'  => $post['username'],
                        ));

                        $checkUsename = Pages::findFirst([
                            "username = :username: AND id != :id: AND status != 4",
                            "bind" => [
                                "username" => $post['username'],
                                'id'    => $id,
                            ]
                        ]);

                        $checkMail = Pages::findFirst([
                            "mail = :mail: AND id != :id: AND status != 4",
                            "bind" => [
                                "mail" => $post['mail'],
                                'id'    => $id,
                            ]
                        ]);

                        $checkPhone = Pages::findFirst([
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
                            $post->department_mg = json_encode($form_checked);
                            $post->updated_at = date('YYYY-MM-DD H:i:s');
                            if (!$post->save()) {
                                foreach ($post->getMessages() as $message) {
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

    public function deleteAction(){
        if ($this->request->isPost()) {
            $password = $this->request->getPost('password');
            $usr = Pages::findFirstId($this->session->get("user_id"));
            $id = $this->request->getPost('id');
            if ($this->security->checkHash($password,$usr->password)) {
                $post = Pages::findFirst(array(
                    "conditions" => "id = :id: AND id != 1 AND status != 4",
                    "bind" => array("id" => $id)
                ));

                if (!$post) {
                    $this->flash->error("Không tìm thấy tài khoản");
                    return $this->response->redirect('users');
                }else{
                    if(!$this->rmt->checkDeptId($post->department_id, $this->session->get('department_mg'))){
                        $this->flash->error('Khu vực/ Đơn vị không cho phép.');
                        return $this->response->redirect('/users');
                    }
                    $save = $post;
                    $post->status = 4;
                    if (!$post->save()) {
                        foreach ($post->getMessages() as $message) {
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

    private function get_js_css (){
        // And some local JavaScript resources
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/posts.js');
    }
}