<?php
namespace Backend\Modules\Users\Controllers;

use Backend\Modules\Users\Forms\ChangePWForm;
use Backend\Modules\Users\Forms\ProfileForm;
use Models\Users;

class ProfileController extends \BackendController
{

    public function indexAction()
    {
        
        $error = [];
        $id = $this->session->get('user_id');
        if ($profile = Users::findFirstId($id)) {
            if ($this->request->isPost()) {
                if ($this->security->checkToken()) { 
                    $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
                    $save = $profile;
                    $form = new ProfileForm();

                    $post = [
                        'name' => $this->request->getPost('name',['string','trim']),
                        'email' => $this->request->getPost('email',['string','trim']),
                        'phone' => $this->request->getPost('phone',['string','trim']),
                    ];

                    $checkMail = Users::findFirst([
                        "email = :email: AND id != :id:",
                        "bind" => [
                            "email" => $post['email'],
                            "id" => $profile->id,
                        ],
                    ]);

                    $checkPhone = Users::findFirst([
                        "phone = :phone: AND id != :id:",
                        "bind" => [
                            "phone" => $post['phone'],
                            "id" => $profile->id,
                        ],
                    ]);

                    if ($checkMail) {
                        array_push($error, "E-mail đã tồn tại");
                    }
                    
                    if ($checkPhone) {
                        array_push($error, "Số điện thoại đã tồn tại");
                    }

                    $form->bind($post, $profile);
                    if (!$form->isValid()) {
                        foreach ($form->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }

                    if (!count($error)) {
                        if (!$profile->save()) {
                            if ($this->request->isAjax()) {
                                $error = [];
                                foreach ($profile->getMessages() as $message) {
                                    array_push($error, $message->getMessage());
                                }
                                $data['error'] = $error;
                                $this->response->setStatusCode(400, 'error');
                                $this->response->setJsonContent($data);
                                return $this->response->send();
                            } else {
                                foreach ($profile->getMessages() as $message) {
                                    $this->flash->error($message);
                                }
                            }
                        } else {
                            if ($this->request->isAjax()) {
                                $data['data'] = $profile->toArray();
                                $this->response->setStatusCode(200, 'OK');
                                $this->response->setJsonContent($data);
                                return $this->response->send();
                            } else {
                                $this->logs->write_log(2, 1, 'Cập nhật tài khoản ID: ' . $save->id, json_encode($save->toArray()), $this->session->get("user_id"));
                                $this->flashSession->success("Cập nhật tài khoản thành công");
                                return $this->response->redirect(BACKEND_URL.'/profile');
                            }
                        }
                    }else{
                        if ($this->request->isAjax()) {
                            $data['error'] = $error;
                            $this->response->setStatusCode(400, 'error');
                            $this->response->setJsonContent($data);
                            return $this->response->send();
                        } else {
                            foreach ($error as $value) {
                                $this->flashSession->error($value . ". ");
                            }
                        }
                    }
                    
                }else{
                    if ($this->request->isAjax()) {
                        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
                        $data['error'] = ['Token không chính xác'];
                        $this->response->setStatusCode(400, 'error');
                        $this->response->setJsonContent($data);
                        return $this->response->send();
                    } else {
                        $this->flashSession->error("Token không chính xác");
                    }
                }
            }
            $this->view->form = new ProfileForm($profile);
            $this->view->formPW = new ChangePWForm();
        } else {
            array_push($error, "Tài khoản không tồn tại");
            if ($this->request->isAjax()) {
                $data['error'] = $error;
                $this->response->setStatusCode(400, 'error');
                $this->response->setJsonContent($data);
                return $this->response->send();
            } else {
                foreach ($error as $value) {
                    $this->flashSession->error($value . ". ");
                }
                return $this->response->redirect(BACKEND_URL.'/profile');
            }
        }
    }

    public function changepwAction()
    {
        $error = [];
        if ($profile = Users::findFirstId($this->session->get("user_id"))) {
            if ($this->request->isPost()) {
                if ($this->security->checkToken()) {
                    $user_id = $this->session->get("user_id");
                    $profile = Users::findFirstId($user_id);
                    if (!$profile) {
                        array_push($error, "Tài khoản không tồn tại");
                        if ($this->request->isAjax()) {
                            $data['error'] = $error;
                            $this->response->setStatusCode(400, 'error');
                            $this->response->setJsonContent($data);
                            return $this->response->send();
                        } else {
                            foreach ($error as $value) {
                                $this->flashSession->error($value . ". ");
                            }
                            return $this->response->redirect(BACKEND_URL.'/profile');
                        }
                    } else {
                            $password = $this->request->getPost('oldPassword',['string','trim']);
                            $newpassword = $this->request->getPost('password',['string','trim']);
                            if ($this->security->checkHash($password, $profile->password)) {
                                $profile->password = $this->security->hash($newpassword);
                                if (!$profile->update()) {
                                    $this->flashSession->error("Đổi mật khẩu thất bại.");
                                    return $this->response->redirect('/profile/changepassword');
                                } else {
                                    $this->flashSession->success("Đổi mật khẩu thành công.");
                                    return $this->response->redirect(BACKEND_URL.'/profile/changepw');
                                }
                            } else {
                                $this->flashSession->error("Mật khẩu hiện tại không chính xác.");
                                return $this->response->redirect(BACKEND_URL.'/profile/changepw');
                            }
    
                    }
                }else {
                    if ($this->request->isAjax()) {
                        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
                        $data['error'] = ['Token không chính xác'];
                        $this->response->setStatusCode(400, 'error');
                        $this->response->setJsonContent($data);
                        return $this->response->send();
                    } else {
                        $this->flashSession->error("Token không chính xác");
                    }
                }
            }

            $form = new ProfileForm($profile);
            $this->view->form = $form;
            $this->view->formPW = new ChangePWForm();
        }
    }
}
