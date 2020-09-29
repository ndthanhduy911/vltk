<?php
namespace Backend\Modules\Users\Controllers;
use Backend\Modules\Users\Forms\UserForm;

class UsersController  extends \BackendController {

    public function indexAction(){
        $this->view->form = new UserForm();
        $this->get_js_css();
    }

    public function updateAction($id = null){
        if($id){
            $user = \Users::findFirstId($id);
            $user->updated_at = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
        }else{
            $user = new \Users();
            $title = 'Thêm mới';
            $user->created_at = date('Y-m-d H:i:s');
            $user->updated_at = $user->created_at;
        }

        if($user){
            $form = new UserForm($user);
            if ($this->request->isPost()) {
                if ($this->security->checkToken()) {
                    $error = [];
                    $post = [
                        'name' => $this->request->getPost('name',['string','trim']),
                        'email' => $this->request->getPost('email',['string','trim']),
                        'phone' => $this->request->getPost('phone',['string','trim']),
                        'status' => $this->request->getPost('status',['int','trim']),
                        'role' => $this->request->getPost('role',['int','trim']),
                        'username' => $this->request->getPost('username',['string','trim']),
                        'dept_id' => $this->request->getPost('dept_id',['int','trim']),
                        'password' => $user->password ? $user->password : $this->security->hash($this->request->getPost('password',['string','trim'])),
                    ];

                    if((int)$id === 1){
                        $post['dept_id'] = 1;
                        $post['role'] = 1;
                        $post['status'] = 1;
                        $post['username'] = 'admin';
                    }
    
                    $checkUsename = \Users::findFirst([
                        "username = :username: AND id != :id:",
                        "bind" => [
                            "username" => $post['username'],
                            'id'    => $id,
                        ]
                    ]);
    
                    $checkEmail = \Users::findFirst([
                        "email = :email: AND id != :id:",
                        "bind" => [
                            "email" => $post['email'],
                            'id'    => $id,
                        ]
                    ]);
    
                    $checkPhone = \Users::findFirst([
                        "phone = :phone: AND id != :id:",
                        "bind" => [
                            "phone" => $post['phone'],
                            'id'    => $id,
                        ]
                    ]);
    
                    if($checkUsename){
                        array_push($error, 'Tài khoản đã được sử dụng.');
                    }
                    if($checkEmail){
                        $this->flash->error('E-mail đã được sử dụng.');
                    }
                    if($checkPhone){
                        array_push($error, 'Số điện thoại đã được sử dụng.');
                    }
    
                    $form->bind($post, $user);
                    if (!$form->isValid()) {
                        foreach ($form->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
    
                    if(count($error)) {
                        $this->flashSession->error(implode(', ', $error));
                    }else{
                        $user->dept_mg = json_encode([$user->dept_id]);
                        if (!$user->save()) {
                            foreach ($user->getMessages() as $message) {
                                $this->flashSession->error($message);
                            }
                        } else {
                            // $this->logs->write_log(2, 1, 'Cập nhật tài khoản ID: '.$save->id,json_encode($save->toArray()),$this->session->get("user_id"));
                            $this->flashSession->success($title." thành công.");
                            return $this->response->redirect(WEB_ADMIN_URL.'/users/update/'.$user->id);
                        }
                    }
                }
            }
            $this->view->form = $form;
            $this->view->user = $user;
            $this->view->title = $title;
        }else{
            $this->flashSession->error('Không tìm thấy tài khoản này');
            return $this->response->redirect(WEB_ADMIN_URL.'/users');
        }



        $this->get_js_css();
    }


    public function changepwAction($id = null){
        if ($this->request->isPost()) {
            
            if($this->security->checkToken()) {
                if($user = \Users::findFirstId($id)){
                    $form = new UserForm();
                    $password = $this->request->getPost('password',['string','trim']);
                    if(!$this->rmt->checkDeptId($user->dept_id, $this->session->get('dept_mg'))){
                        $this->flash->error('Khu vực/ Bộ môn không cho phép.');
                        return $this->response->redirect('/users/edit/'.$id);
                    }
                    $post = [
                        'name' => $user->name,
                        'email' => $user->email,
                        'phone' => $user->phone,
                        'status' => $user->status,
                        'role' => $user->role,
                        'username' => $user->username,
                        'dept_id' => $user->dept_id,
                        'password' => $password,
                    ];
                    $form->bind($post, $user);
                    if (!$form->isValid()) {
                        foreach ($form->getMessages() as $message) {                            
                            $this->flashSession->error($message->getMessage());
                        }
                        return $this->response->redirect(WEB_ADMIN_URL.'/users/update/'.$id);
                    }else{
                        $user->password = $this->security->hash($password);
                        if (!$user->save()) {
                            foreach ($user->getMessages() as $message) {
                                $this->flashSession->error($message->getMessage());
                            }
                            return $this->response->redirect(WEB_ADMIN_URL.'/users/update/'.$id);
                        } else {
                            // $this->logs->write_log(2, 1, 'Đã thay đổi mật khẩu','',$this->session->get("user_id"));
                            $this->flashSession->success("Thay đổi mật khẩu thành công.");
                            return $this->response->redirect(WEB_ADMIN_URL.'/users/update/'.$id);
                        }
                    }

                    
                }else{
                    $this->flashSession->error("Không tìm thấy tài khoản.");
                }

            }else{
                $this->flashSession->error("Token không chính xác.");
            }

        }else{
            return $this->response->redirect(WEB_ADMIN_URL.'/users');
        }
    }

    public function deleteAction($id = null){
        $user = \Users::findFirstId($id);
        if ($user !== false && (int)$id !== 1) {
            if (!$user->delete()) {
                if ($this->request->isAjax()) {
                    foreach ($user->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $data['error'] = $error;
                    $this->response->setStatusCode(400, 'error');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    foreach ($user->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                    return $this->response->redirect(WEB_ADMIN_URL.'/users');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $user->toArray();
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                    // $this->flashSession->success("Xóa tài khoản thành công");
                    return $this->response->redirect(WEB_ADMIN_URL.'/users');
                }

            }
        }
    }

    // ============================
    // API
    // ============================

    public function getdataAction(){
        $this->view->disable();
        if ($this->request->isAjax()) {
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'u.id',
                'u.name',
                'u.username',
                'u.email',
                'u.phone',
                'u.status',
                'u.avatar',
                'u.role',
                'u.dept_id',
                'dl.name dept_name',
                'r.name role_name',
            ))
            ->from(['u'=>'Users'])
            ->where("u.id != 1");
            if($this->session->get('user_id') != 1){
                $data = $data->andWhere("u.dept_id IN (".implode(',',$this->session->get('dept_mg')).")");
            }
            $data = $data->leftJoin('DepartmentsLang', "dl.dept_id = u.dept_id AND dl.lang_id = 1",'dl')
            ->leftJoin('Roles', 'r.id = u.role','r')
            ->orderBy('u.name ASC');

            $search = 'u.name LIKE :search:';
            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent($this->ssp->data_output($this->request->get(), $data,$search));
            return $this->response->send();
        }
    }


    // ================================
    // FUNCTION
    // ================================

    private function get_js_css (){
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/users.js');
    }
}