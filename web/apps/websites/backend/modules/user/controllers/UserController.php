<?php
/**
 * Created by PhpStorm.
 * User: huynguyen
 * Date: 10/8/14
 * Time: 9:28 PM
 */

namespace Backend\Modules\User\Controllers;

use Phalcon\Mvc\View;

use Phalcon\Paginator\Adapter\QueryBuilder as Paginator;
use Library\Pagination\Pager as Pager;
use Phalcon\Mvc\Model\Message as Message;
use Models\User;
use Models\GroupUser;
use Models\Package;
use Backend\Modules\User\Forms\EditUserForm;
use Backend\Modules\User\Forms\AddUserForm;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class UserController extends \BackendController
{
    public function indexAction(){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        try {
            $identity = $this->auth->getIdentity();
            if (!$identity) {
                return $this->response->redirect($this->getBackendUrl() . '/login');
            }
        } catch (\Exception $e) {
            $this->flash->error($e->getMessage());
        }

        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'Models\User.id',
            'Models\User.department_id',
            'Models\User.email',
            'Models\User.fullname',
            'Models\User.address',
            'Models\User.mobile',
            'Models\User.package_id',
            'Models\User.avatar',
            'Models\User.status',
            'Models\User.created_at',
            'Models\User.group_id',
            'G.name group_name',
            'D.name department_name'
        ))
        ->from('Models\User')
        ->join('Models\GroupUser', 'G.id = Models\User.group_id','G')
        ->join('Models\Department', 'D.id = Models\User.department_id','D')
        ->where('Models\User.id != 1');
        $data = $data->getQuery()->execute();

        $currentPage = abs($this->request->getQuery('page', 'int', 1));
        if ($currentPage == 0) {
            $currentPage = 1;
        }
        $paginator = new PaginatorModel(
            [
                "data" => $data,
                "limit" => 10000,
                "page" => $currentPage,
            ]
        );
        $this->view->package = Package::find();
        $this->view->form = new EditUserForm();
        $this->view->page = $paginator->getPaginate();
    }

    public function getuserAction(){
        $this->view->disable();
        $allUser = User::find([
            'limit' => 10000,
            'offset' => 10,
        ]);

        $count = $allUser->count();
        if ($count) {
            $count + 10;
        }
        $this->response->setStatusCode(200, 'OK');
        $this->response->setJsonContent([
            "recordsTotal" => $count,
            "recordsFiltered" => $count,
            'data' => $allUser->toArray()
        ]);
        $this->response->send();
    }

    public function addAction(){
        if ($this->request->isAjax() && $this->request->isPost()) {
            $userObj = new User();
            $user = new EditUserForm();
            $post = $this->request->getPost();
            $error = [];
            $checkMail = User::findFirstByEmail($post['email']);
            $checkPhone = User::findFirstByMobile($post['mobile']);
            if($checkMail){
                array_push($error, 'Địa chỉ email đã tồn tại');
            }
            if($checkPhone){
                array_push($error, 'Số điện thoại đã tồn tại');
            }

            if(!empty($error)){
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            }

            if(empty($post['package_id'])){
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Lỗi chọn loại dịch vụ'],
                ]);
                return $this->response->send();
            }
            $user->bind($post, $userObj);
            if (!$user->isValid()) {
                $error = [];
                foreach ($user->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            }
            // var_dump($post); die;
            $userObj->package_id = json_encode($post['package_id']);
            $userObj->password = $this->security->hash($post['password']);
            $userObj->created_at = date("Y-m-d H:i:s");
            if (!$userObj->save()) {
                $error = [];
                foreach ($userObj->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            } else {
                $this->helper->write_log(1, 1, 'Thêm tài khoản có ID: <strong class="text-success">'.$userObj->id.'</strong>' , json_encode($userObj->toArray()));
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent([
                    'user' => $userObj->toArray()
                ]);
                return $this->response->send();
            }
        }
    }

    public function editAction($id = null){
        if ($this->request->isAjax() && $this->request->isPost()) {
            $user = User::findFirstById($id);
            $edit = new EditUserForm();
            if (!$user) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Not find user'],
                ]);
                return $this->response->send();
            }
            $saveUser = $user;
            $post = $this->request->getPost();
            $error = [];
            $checkMail = User::findFirst([
                "email = :email: AND id != :id:",
                "bind"  => [
                    'id'    => $user->id,
                    'email' => $post['email']
                ]
            ]);

            $checkPhone = User::findFirst([
                "mobile= :mobile: AND id != :id:",
                "bind"  => [
                    'id'    => $user->id,
                    'mobile' => $post['mobile']
                ]
            ]);

            if($checkMail){
                array_push($error, 'Địa chỉ email đã tồn tại');
            }
            if($checkPhone){
                array_push($error, 'Số điện thoại đã tồn tại');
            }
            if(!empty($error)){
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            }
            if(empty($post['package_id'])){
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Lỗi chọn loại dịch vụ'],
                ]);
                return $this->response->send();
            }
            
            $edit->bind($post, $user);            
            if (!$edit->isValid()) {
                $error = [];
                foreach ($edit->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            } else {
                $user->package_id = json_encode($post['package_id']);
                if (!$user->save()) {
                    $error = [];
                    foreach ($user->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $this->helper->write_log(2, 1, 'Cập nhật tài khoản có ID: <strong class="text-info">'.$user->id.'</strong>' , json_encode($saveUser->toArray()));
                    $userObj = $this->session->get('auth-identity');
                    $userObj['package_id'] = $user->package_id;
                    $this->session->set('auth-identity',$userObj);
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'user' => $user->toArray()
                    ]);
                    return $this->response->send();
                }
            }
        } 
    }

    public function logoutAction(){
        $this->auth->remove();
        unset($_SESSION['login']);
        unset($_SESSION['permission']);
        unset($_SESSION['private']);
        $this->session->destroy();
        return $this->response->redirect('/');
    }

    public function profileAction(){
        if($this->request->isAjax() && $this->request->isPost()){
            $post = $this->request->getPost();
            $id =  $post['id'];
            $user = User::findFirstById($id);
            $saveUser = $user;
            $edit = new EditUserForm();
            if (!$user) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Not find user'],
                ]);
                return $this->response->send();
            }
           
            $edit->bind($post, $user);

            if (!$edit->isValid()) {
                $error = [];
                foreach ($edit->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            } else {
                $user->package_id = json_encode($post['package_id']);
                if (!$user->save()) {
                    $error = [];
                    foreach ($user->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $this->helper->write_log(2, 1, 'Thay đổi thông tin tài khoản có ID: <strong class="text-info">'.$userObj->id.'</strong>' , json_encode($saveUser->toArray()));
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'user' => $user->toArray()
                    ]);
                    return $this->response->send();
                }
            }
        }else{
            $userObj = User::findFirst($this->auth->getIdentity()['id']);
            $this->view->user  = $userObj;
            $this->view->form = new EditUserForm($userObj);
        }

    }

    public function changepasswordAction(){
        $this->view->disable();
        $post = $this->request->getPost();
        $id = $post['id'];
        $user = User::findFirstById($id);
        if ($this->request->isAjax() && $this->request->isPost()) {
            if (!$user) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Not find user'],
                ]);
                return $this->response->send();
            }
            
            if ($this->security->checkHash($post['passwordOld'], $user->password)) {
                $saveUser = $user;
                $user->updated_at = date("Y-m-d H:i:s");
                $user->password = $this->security->hash($post['password']);
                if (!$user->save()) {
                    $error = [];
                    foreach ($user->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $this->helper->write_log(2, 1, 'Thay đổi mật khẩu tài khoản có ID: <strong class="text-info">'.$userObj->id.'</strong>' , json_encode($saveUser->toArray()));
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'user' => $user->toArray()
                    ]);
                    return $this->response->send();
                }
            }else{
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Mật khẩu hiện tại không đúng'],
                ]);
                return $this->response->send();
            }
        }
    }

    public function avatarAction($id = null){
        $this->view->disable();
        if ($this->request->isAjax() && $this->request->isPost()) {
            $user = User::findFirst($id);
            if (!$user) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Không tìm thấy tài khoản này'],
                ]);
                return $this->response->send();
            }
            $post = $this->request->getPost();
            $user->updated_at = date("Y-m-d H:i:s");
            if ($this->request->hasFiles() == true) {
                foreach ($this->request->getUploadedFiles() as $file){
                    if($file->getSize()){
                        $now = strtotime("now");
                        $file->moveTo(BASE_DIR.'/public_html/files/avatar/'.$now.'_'.$file->getName());
                        if($user->avatar){
                            unlink(BASE_DIR.'/public_html/files/avatar/'.$user->avatar);
                        }
                        $user->avatar = $now.'_'.$file->getName();
                    }
                }
            }
            if (!$user->save()) {
                $error = [];
                foreach ($user->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            } else {
                $this->response->setStatusCode(200, 'OK');
                $userObj = $this->session->get('auth-identity');
                $userObj['avatar'] = $user->avatar;
                $this->session->set('auth-identity',$userObj);
                $this->response->setJsonContent([
                    'avatar' => [$user->avatar],
                ]);
                return $this->response->send();
            }
            
        } 
    }

    public function deleteAction(){
        if ($this->request->isPost()) {
            if ($this->request->isAjax()) {
                $this->view->disable();
                $id = (int)$this->request->getPost('id');
                if ($user = User::findFirstById($id)) {
                    $saveUser = $user;
                    if ($user->delete()) {
                        $this->helper->write_log(3, 1, 'Xóa tài khoản có ID: <strong class="text-danger">'.$saveUser->id.'</strong>' , json_encode($saveUser->toArray()));
                        $this->response->setStatusCode(200, 'Deleted');
                        return $this->response->setJsonContent(['status' => 200]);
                    } else {
                        $this->response->setStatusCode(500, 'Failed');
                        return $this->response->setJsonContent(['status' => 500]);
                    }
                } else {
                    $this->response->setStatusCode(404, 'Not find user');
                    return $this->response->setJsonContent(['status' => 404]);
                }
            } else {
                return $this->response->setStatusCode(403, ' Forbidden');
            }
        }
    }
}