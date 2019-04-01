<?php

namespace Backend\Modules\Account\Controllers;
use Models\Users;

use Phalcon\Mvc\View;
use Backend\Modules\Account\Forms\LoginForm;

class AccountController extends \Phalcon\Mvc\Controller
{
    public function loginAction()
    {
        // var_dump($_SESSION); die;
        if(!empty($this->session->get('user_id'))){
            return $this->response->redirect("/admin");
        }
        $post = [];
        if ($this->request->isPost()) {
            $post = [
                'username' => $this->request->getPost('username'),
                'password'  => $this->request->getPost('password'),
            ];
            if ($this->security->checkToken()) {
                if($this->session->has("captcha")){
                    if($this->request->getPost("captcha") === $this->session->get("captcha")) {
                        $user = Users::findFirstUsername($this->request->getPost('username'));
                        if ($user) {
                            $password = $this->request->getPost('password');
                            if ($this->security->checkHash($password,$user->password)) {
                                $department_mg = json_decode($user->department_mg);
                                $this->session->set("user_id", $user->id);
                                $this->session->set("username", $user->username);
                                $this->session->set("name", $user->name);
                                $this->session->set("role", (int)$user->role);
                                $this->session->set("department_mg", $department_mg ? $department_mg : []);
                                $this->session->set("department_id", (int)$user->department_id);
                                // $this->logs->write_log(4, 1, 'Tài khoản đã đăng nhập',null,$this->session->get("user_id"));
                                return $this->response->redirect("/admin");
                            }else{
                                $this->flashSession->error('Mật khẩu không chính xác');
                            }
                        }else{
                            $this->flashSession->error('Tài khoản không tồn tại');
                        }
                    }else{
                        $this->flashSession->error('Mã xác thực không chính xác');
                    }
                }else{
                    $this->flashSession->error('Token không chính xác');
                }                
            }
        } 
        $form = new LoginForm((object)$post);
        $this->view->setRenderLevel(
            View::LEVEL_ACTION_VIEW
        );
        $this->view->form = $form;
    }

    public function captchaAction()
    {
        $this->view->disable();
        $cdata = 'captcha';
        if ($this->session->has($cdata)) {
            $this->session->remove($cdata);
        }
        $num_chars = 6;
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
        $font_path = BASE_DIR . '/public_html/captcha/fonts/segoeprb.ttf';
        $text = $captcha_text;
        imagettftext($jpg_image, 40, 0, 60, 50, $white, $font_path, $text);
        header("Content-type: image/png");
        imagepng($jpg_image);
        imagedestroy($jpg_image);
    }

    public function logoutAction()
    {
        $this->session->destroy();
        $this->response->redirect("/admin/account/login");
    }
}
