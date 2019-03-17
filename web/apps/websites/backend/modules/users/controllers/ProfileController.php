<?php
namespace Backend\Modules\Users\Controllers;

use Backend\Modules\Users\Forms\ChangePWForm;
use Backend\Modules\Users\Forms\ProfileForm;
use Models\Users;

class ProfileController extends \BackendController
{

    public function indexAction()
    {
        if ($profile = Users::findFirstId($this->session->get("profile_id"))) {
            if ($this->request->isPost()) {
                $password = $this->request->getPost('password');
                $check = Users::findFirstId($this->session->get("profile_id"));
                if ($this->security->checkHash($password, $check->password)) {
                    $checkMail = Users::findFirst([
                        "mail = :mail: AND id != :id: AND status != 4",
                        "bind" => [
                            "mail" => $this->request->getPost('mail'),
                            "id" => $profile->id,
                        ],
                    ]);
                    $checkPhone = Users::findFirst([
                        "phone = :phone: AND id != :id: AND status != 4",
                        "bind" => [
                            "phone" => $this->request->getPost('phone'),
                            "id" => $profile->id,
                        ],
                    ]);
                    if ($checkMail) {
                        $this->flash->error('Địa chỉ mail đã được sử dụng.');
                    } else if ($checkPhone) {
                        $this->flash->error('Số điện thoại đã được sử dụng.');
                    }
                    $profile->name = $this->request->getPost('name');
                    $profile->phone = $this->request->getPost('phone');
                    $profile->mail = $this->request->getPost('mail');
                    if (!$profile->save()) {
                        foreach ($profile->getMessages() as $message) {
                            $this->flashSession->error($message);
                        }
                    } else {
                        $this->flashSession->success("Cập nhật thành công");
                        return $this->response->redirect(BACKEND_URL . '/profile');
                    }
                }
            }
            $form = new ProfileForm($profile);
            $this->view->form = $form;
            $this->view->formPW = new ChangePWForm();
        } else {
            return $this->response->redirect('/');
        }
    }

    public function changepasswordAction()
    {
        if ($profile = Users::findFirstId($this->session->get("profile_id"))) {
            if ($this->request->isPost()) {
                $profile_id = $this->session->get("profile_id");
                $password = $this->request->getPost('oldPassword');
                $newpassword = $this->request->getPost('password');

                $profile = Users::findFirstId($profile_id);
                if (!$profile) {
                    $this->flashSession->error("Không tìm thấy tài khoản này.");
                    return $this->response->redirect(BACKEND_URL.'/profile/changepassword');
                } else {
                    if ($this->security->checkHash($password, $profile->password)) {
                        $profile->password = $this->security->hash($newpassword);
                        if (!$profile->update()) {
                            $this->flashSession->error("Đổi mật khẩu thất bại.");
                            return $this->response->redirect('/profile/changepassword');
                        } else {
                            $this->flashSession->success("Đổi mật khẩu thành công.");
                            return $this->response->redirect(BACKEND_URL.'/profile/changepassword');
                        }
                    } else {
                        $this->flashSession->error("Mật khẩu hiện tại không chính xác.");
                        return $this->response->redirect(BACKEND_URL.'/profile/changepassword');
                    }
                }
            }

            $form = new ProfileForm($profile);
            $this->view->form = $form;
            $this->view->formPW = new ChangePWForm();
            
        }
    }
}
