<?php

namespace Backend\Modules\Account\Controllers;
use Phalcon\Mvc\View;
use Backend\Modules\Account\Forms\LoginForm;

class AccountController extends \Phalcon\Mvc\Controller
{
    public function loginAction(){
        $this->view->setRenderLevel(
            View::LEVEL_ACTION_VIEW
        );
        if ($this->session->has("userid") && $this->session->has("roleid")) { 
            return $this->response->redirect(WEB_ADMIN_URI);
        } else {
            $form = new LoginForm();
            if ($this->request->isPost()) {
                $post = [
                    'username' => $this->request->getPost('username',['striptags', 'trim']),
                    'password' => $this->request->getPost('password',['string', 'trim'])
                ];
                try {
                    $this->db->begin();
                    if (!$this->security->checkToken()) {
                        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
                        $data['error'] = ['Token không chính xác'];
                        throw new \Exception("Token không hợp lệ");
                    }
                    $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
                    if(!$this->session->has("captcha")){
                        throw new \Exception("Mã xác thực không tồn tại");
                    }
                    $captcha = $this->request->getPost("captcha",['striptags', 'trim']);
                    if($captcha !== $this->session->get("captcha")) {
                        throw new \Exception("Mã xác thực không chính xác");
                    }
                    if (!$user = \User::findFirstUsernameLogin($post['username'],"id, username, password, roleid, fullname, avatar, deptid")) {
                        throw new \Exception("Tài khoản không tồn tại");
                    }
                    if (!$this->security->checkHash($post['password'], $user->password)) {
                        throw new \Exception("Mật khẩu không chính xác");
                    }
                    $this->session->set("userid", $user->id);
                    $this->session->set("deptid", $user->deptid);
                    $this->session->set("username", $user->username);
                    $this->session->set("fullname", $user->fullname);
                    $this->session->set("roleid", (int)$user->roleid);
                    $this->session->set("avatar", $user->avatar);
                    
                    \Online::login($user->id);
                    \Logs::saveLogs($this, 4, 'Đăng nhập vào hệ thống');
                    $this->db->commit();
                    if($this->request->isAjax()){
                        $this->helper->responseJson($this, $data);
                    }else{
                        return $this->response->redirect(WEB_ADMIN_URI);
                    }
                } catch (\Throwable $e) {
                    $this->db->rollback();
                    if($this->request->isAjax()){
                        $data['error'] = [$e->getMessage()];
                        $this->helper->responseJson($this, $data);
                    }else{
                        $this->flashSession->warning($e->getMessage());
                        $form = new LoginForm((object)$post);
                    }
                }

            }
            $this->view->form = $form;
        } 
    }

     public function logoutAction()
    {
        // Destroy the whole session
        $this->session->destroy();
        $this->response->redirect(WEB_ADMIN_URI);
    }

    public function captchaAction()
    {
        $this->view->disable();
        $cdata = 'captcha';
        if ($this->session->has($cdata)) {
            $this->session->remove($cdata);
        }
        $num_chars = 4;
        $characters = array_merge(range(1, 9));
        shuffle($characters);
        $captcha_text = "";
        for ($i = 0; $i < $num_chars; $i++) {
            $c = $characters[rand(0, count($characters) - 1)];
            $captcha_text .= $c;
        }
        $this->session->set($cdata, $captcha_text);
        $jpg_image = imagecreatefrompng('captcha/img/cbg2.png');
        $white = imagecolorallocate($jpg_image, 244, 67, 54);
        $font_path = PUBLIC_DIR . '/captcha/fonts/segoeprb.ttf';
        $text = $captcha_text;
        imagettftext($jpg_image, 30, 0, 130, 40, $white, $font_path, $text);
        header("Content-type: image/png");
        imagepng($jpg_image);
        imagedestroy($jpg_image);
    }
}
