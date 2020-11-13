<?php

use Phalcon\Paginator\Adapter\Model as Paginator;
use Library\Forms\SearchForm;

class RolesController extends ControllerBase
{
    public function initialize()
    {
        if ($this->session->has("user_id")) {
        } else {
            $this->response->redirect("account");
        }
    }

    public function indexAction(){
        
    }

    // public function permissionAction(){
        
    // }

    /**
     * Delete a manager
     *
     * @param string $code
     */
    // public function deleteAction(){
        
    //     if ($this->request->isPost()) {
    //         $password = $this->request->getPost('password');
    //         $user = Users::findFirstId($this->session->get("user_id"));
    //         if ($user && $user->role==1) {
    //             if ($this->security->checkHash($password,$user->password)) {
    //                 try {
    //                     $arrDelete = Roles::find("id IN (".$this->request->getPost('id').")");
    //                     $saveDelete = $arrDelete->toArray();
    //                     $arrDelete->delete();
    //                 } catch (Exception $exception) {
    //                     $this->flashSession->error('Vai trò này đang được sử dụng');
    //                     return $this->response->redirect('roles');
    //                 } finally {
    //                     if(!$exception){
    //                         $count = count($saveDelete);
    //                         if($count == 1){
    //                             foreach ($saveDelete as $save) {
    //                                 History::saveHistory([
    //                                     'code' => $save['code'],
    //                                     'type' => 1,
    //                                     'user' => $this->session->get("user"),
    //                                     'title' => "Vai trò <strong class='text-danger'>".$save['name']."</strong> đã được xóa",
    //                                     'datetime' => date("Y-m-d H:i:s"),
    //                                 ]);
    //                             }
    //                             $this->flashSession->success("Vai trò đã được xóa.");
    //                             return $this->response->redirect('roles');
    //                         }else{
    //                             foreach ($saveDelete as $save) {
    //                                 History::saveHistory([
    //                                     'code' => $save['code'],
    //                                     'type' => 1,
    //                                     'user' => $this->session->get("user"),
    //                                     'title' => "Vai trò <strong class='text-danger'>".$save['name']."</strong> đã được xóa",
    //                                     'datetime' => date("Y-m-d H:i:s"),
    //                                 ]);
    //                             }
    //                             $this->flashSession->success($count.' vai trò đã được xóa');
    //                             return $this->response->redirect('roles');
    //                         }
    //                     }
    //                 }
    //             }else{
    //                 $this->flashSession->error("Mật khẩu không chính xác");
    //                 return $this->response->redirect('roles');
    //             }
    //         }else{
    //             $this->flashSession->error("Bạn không có quyền xóa");
    //             return $this->response->redirect('roles');
    //         }
    //     }
    // }

    /**
     * Edit a manager
     *
     * @param string $code
     *
     */
    // public function editAction($id=null){
        
    //     $roles = Roles::findFirstId($id);
    //     if ($roles) {
    //         if ($this->request->isPost()) {
    //             $password = $this->request->getPost('password');
    //             $user = Users::findFirstId($this->session->get("user_id"));
    //             if ($this->security->checkHash($password,$user->password)) {
    //                 $check = Roles::find([
    //                     "code = :code: AND id != :id:",
    //                     "bind" => [
    //                         "code" => $this->request->getPost('code'),
    //                         "id" => $id
    //                     ]
    //                 ])->count();
    //                 if($check){
    //                     $this->flashSession->error("Mã nhóm tài sản ".$check->code." đã tồn tại");
    //                     return $this->response->redirect('/roles/edit/'.$id);
    //                 }
    //                 $roles->name = $this->request->getPost("name");
    //                 $roles->code = $this->request->getPost("code");
    //                 if (!$roles->save()) {
    //                     foreach ($roles->getMessages() as $message) {
    //                         $this->flash->error($message);
    //                     }
    //                 } else {
    //                     History::saveHistory([
    //                         'code' => $property->code,
    //                         'type' => 2,
    //                         'user' => $this->session->get("user"),
    //                         'title' => "Vai trò <strong class='text-primary'>".$property->name."</strong> đã được cập nhật",
    //                         'datetime' => date("Y-m-d H:i:s"),
    //                     ]);
    //                     $this->flashSession->success("Cập nhật thành công");
    //                     return $this->response->redirect('/roles/edit/'.$id);
    //                 }
    //             }else{
    //                 $this->flashSession->error("Mật khẩu không chính xác");
    //                 return $this->response->redirect('/roles/edit/'.$id);
    //             }
    //         }

    //         $form = new RolesForm($roles);
    //         $this->view->form = $form;
    //     } else {
    //         $this->flashSession->error("Không tìm thấy dữ liệu");
    //         return $this->response->redirect('/roles');
    //     }
    // }

    /**
     * Creates a new nhacungcap
     */
    // public function addAction(){
        
    //     if ($this->request->isPost()){
    //         $password = $this->request->getPost('password');
    //         $user = Users::findFirstId($this->session->get("user_id"));
    //         if ($this->security->checkHash($password,$user->password)) {
    //             $check = Roles::findFirstByCode($this->request->getPost('code'));
    //             if($check){
    //                 $this->flashSession->error("Mã nhóm ".$check->code." đã tồn tại");
    //                 return $this->response->redirect('/roles/add/');
    //             }else{
    //                 $roles = new Roles();
    //                 $roles->assign(array(
    //                     'name' => $this->request->getPost('name'),
    //                     'code' => $this->request->getPost('code'),
    //                 ));
    //                 if (!$roles->save()) {
    //                     foreach ($roles->getMessages() as $message) {
    //                         $this->flash->error($message);
    //                     }
    //                 } else {
    //                     History::saveHistory([
    //                         'code' => $property->code,
    //                         'type' => 3,
    //                         'user' => $this->session->get("user"),
    //                         'title' => "Vai trò <strong class='text-success'>".$property->name."</strong> đã được thêm",
    //                         'datetime' => date("Y-m-d H:i:s"),
    //                     ]);
    //                     $this->flashSession->success("Tạo nhóm tài sản thành công");
    //                     return $this->response->redirect('/roles/add');
    //                 }
    //             }
    //         }else{
    //             $this->flashSession->error("Mật khẩu không chính xác");
    //             return $this->response->redirect('/roles/add/');
    //         }
    //     }else{
    //         $this->view->form = $form = new RolesForm();
    //     }
    // }

}
