<?php

namespace Frontend\Modules\Physics\Controllers;

use Library\Helper\Helper;

use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\QueryBuilder as Paginator;
use Phalcon\Mvc\Model\Query;
use Phalcon\Mvc\View;

use Models\Client;
use Models\Department;
use Models\Support;
use Models\Package;
use Models\User;
use Models\Notification;
use Models\GenaralSetting;
use Frontend\Modules\Physics\Forms\RegisterForm;
use Frontend\Modules\Physics\Forms\SupportForm;

class AccountController extends \FrontendController{
    public function indexAction(){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $emailAddress = $this->session->get('emailAddress');
        if($client = Client::findFirstByEmail($emailAddress)){
            $this->view->client = $client;
            $new_comment = Notification::find(['view = 0 AND type_user= 2 AND user_id ='.$client->id]);
            $this->view->count_support = Support::count(['client_id='.$client->id]);
            $this->view->count_support_done = Support::count(['status = 2 AND client_id='.$client->id,]);
            $this->view->count_support_notdoing = Support::count(['status != 2 AND client_id='.$client->id]);
            $this->view->new_comment = $new_comment;
            $this->view->count_comment_new = $new_comment->count();
        }else{
            return $this->response->redirect('/');
        }
    }

    public function changelqAction($id = 1){
        $this->view->disable();
        $this->session->set('language',$id);    
    }

    public function loginAction(){
        if($this->session->has("emailAddress")){
            return $this->response->redirect('/');
        }elseif($this->auth->isUserSignedIn()){
            return $this->response->redirect('/adcp/');
        }else{
            if ($this->request->isAjax() && $this->request->isPost()) {
                $this->view->disable();
                if($this->session->get('captcha_login_client') === $this->request->getPost('captcha')){
                    $email    = $this->request->getPost("email");
                    $password = $this->request->getPost("password");
                    $client = Client::findFirstByEmail($email);
                    $user = User::findFirstByEmail($email);
                    if ($client) {
                        if ($this->security->checkHash($password, $client->password)) {
                            $this->session->set("emailAddress", $client->email);
                            $this->session->set("fullName", $client->name);
                            $this->session->set("avatar", $client->avatar);
                            $this->session->set("user_id", $client->id);
                            $this->session->set("package_id", $client->package_id);

                            $this->session->set("language", 1);
                            // if(!$this->cookies->get('language')){
                            //     $this->cookies->set("language", 1);
                            // }
                            
                            $this->response->setStatusCode(200, 'OK'); 
                            $this->response->setJsonContent([
                                'client_id' => $client->id,
                            ]);
                            $this->helper->write_log(4, 2, 'Tài khoản đã đăng nhập',null,$this->session->get("user_id"));
                            return $this->response->send();
                        }else{
                            $this->response->setStatusCode(500, 'Failed');
                            $this->response->setJsonContent([
                                'error' => ['Mật khẩu hoặc Email không chính xác'],
                            ]);
                            return $this->response->send();
                        }
                    }elseif($user && $this->auth->check(array(
                    'email' => $this->request->getPost('email'),
                    'password' => $this->request->getPost('password'),
                    ))){
                        $this->response->setJsonContent([
                            'client_id' => 'admin',
                        ]);
                        $this->helper->write_log(4, 1, 'Tài khoản đã đăng nhập',null);
                        $_SESSION['login'] = "OK";
                        return $this->response->send();
                    } else {
                        $this->response->setStatusCode(500, 'Failed');
                        $this->response->setJsonContent([
                            'error' => ['Mật khẩu hoặc Email không chính xác'],
                        ]);
                        return $this->response->send();
                    }    
                }else{
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => ['Mã xác thực không chính xác'],
                        'captcha' =>$this->session->get('captcha_login_client'),
                    ]);
                    return $this->response->send();
                }
           
            }else{
                $this->view->setRenderLevel(
                    View::LEVEL_ACTION_VIEW
                );
                $emailAddress = $this->session->get('emailAddress');
                $this->view->form = new RegisterForm();
                $this->view->login_title = GenaralSetting::getNameField('login_title')->value;                
                if(empty(!$emailAddress)){
                    return $this->response->redirect("/account/");
                }
            }   
        }
    }

    public function logoutAction(){
        $this->session->destroy();
        return $this->response->redirect('/');
    }

    public function editAction($id = null){
        $this->view->disable();
        $client = Client::findFirstById($id);
        if ($this->request->isAjax() && $this->request->isPost()) {
            if (!$client) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Not find client'],
                ]);
                return $this->response->send();
            }
            $post = $this->request->getPost();
            $edit = new RegisterForm();
            $edit->bind($post, $client);
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
                $client->updated_at = date("Y-m-d H:i:s");
                if (!$client->save()) {
                    $error = [];
                    foreach ($client->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'client' => $client->toArray()
                    ]);
                    return $this->response->send();
                }
            }
        } else {
        }

    }

    public function profileAction(){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }   
        if($client = Client::findFirstByEmail($this->session->get('emailAddress'))){
            $this->view->client = $client;
            $this->view->department = Department::findFirstById($client->department_id);
            $this->view->user = User::find()->toArray();
            $this->view->form = new RegisterForm($client);
        }else{
            return $this->response->redirect('/');
        }
    }

    public function getuserAction($id = null){
        
        if ($this->request->isAjax()) {
            $this->view->disable();
            $user = User::findFirstById($id);
            if (!$user) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Not find user'],
                ]);
                return $this->response->send();
            }
            $user->password = '';
            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent([
                'user' => $user->toArray()
            ]);
            return $this->response->send();
        }else{
            
        } 
    }

    public function getalluserAction(){
        $this->view->disable();
        if ($this->request->isAjax()) {
            $user = User::find(['columns' => 'id, fullname, mobile, email']);
            if (!$user->count()) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Not find user'],
                ]);
                return $this->response->send();
            }
            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent([
                'user' => $user->toArray()
            ]);
            return $this->response->send();
        } 
    }

    public function changepasswordAction($id = null){
        $this->view->disable();
        $client = Client::findFirstById($id);
        if ($this->request->isAjax() && $this->request->isPost()) {
            if (!$client) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Not find client'],
                ]);
                return $this->response->send();
            }
            $post = $this->request->getPost();
            if ($this->security->checkHash($post['passwordOld'], $client->password)) {
                $client->updated_at = date("Y-m-d H:i:s");
                $client->password = $this->security->hash($post['password']);
                if (!$client->save()) {
                    $error = [];
                    foreach ($client->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $this->helper->write_log(2, 2, 'Thay đổi mật khẩu',null,$this->session->get("user_id"));
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'client' => $client->toArray()
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
            $client = Client::findFirst($id);
            if (!$client) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Không tìm thấy tài khoản này'],
                ]);
                return $this->response->send();
            }
            $post = $this->request->getPost();
            $client->updated_at = date("Y-m-d H:i:s");
            if ($this->request->hasFiles() == true) {
                foreach ($this->request->getUploadedFiles() as $file){
                    if($file->getSize()){
                        $now = strtotime("now");
                        $file->moveTo(BASE_DIR.'/public_html/files/avatar/'.$now.'_'.$file->getName());
                        if($client->avatar){
                            unlink(BASE_DIR.'/public_html/files/avatar/'.$client->avatar);
                        }
                        $client->avatar = $now.'_'.$file->getName();
                    }
                }
            }
            if (!$client->save()) {
                $error = [];
                foreach ($client->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            } else {
                $this->helper->write_log(2, 2, 'Thay đổi hình đại diện',json_encode(array($client->avatar)),$this->session->get("user_id"));
                $this->response->setStatusCode(200, 'OK');
                $this->session->set('avatar',$client->avatar);
                $this->response->setJsonContent([
                    'avatar' => [$client->avatar],
                ]);
                return $this->response->send();
            }
            
        } 
    }

    public function checkallnoitifyAction($id = null){
        $this->view->disable();
        if ($this->request->isAjax()){
            if((int)$id === (int)$this->session->get('user_id')){
                $query = $this->modelsManager->executeQuery(
                    "UPDATE Models\Notification SET Models\Notification.view = 1 WHERE Models\Notification.user_id=".$id." AND Models\Notification.type_user=2"
                );
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent(['OK']);
                return $this->response->send();
            }
            
        }else{
            return $this->response->redirect('/');
        }
    }
}