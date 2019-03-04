<?php

namespace Backend\Modules\Dashboard\Controllers;

use Library\Common;
use Library\Helper\Helper;

use Phalcon\Paginator\Adapter\QueryBuilder as Paginator;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Mvc\View;

use Models\Emails;
use Models\User;
use Models\GenaralSetting;
use Backend\Modules\Dashboard\Forms\EditSettingEmailForm;

class EmailSMSController extends \BackendController
{
    public function indexAction(){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'Models\Emails.id',
                'Models\Emails.type',
                'Models\Emails.person_from',
                'Models\Emails.person_to',
                'Models\Emails.title',
                'Models\Emails.content',
                'Models\Emails.status',
                'Models\Emails.created_at',
            ))
            ->from('Models\Emails')
            ->where('1=1')
            ->orderBy('Models\Emails.created_at DESC');
        $data = $data->getQuery()->execute();
        $email_setting = json_decode(GenaralSetting::findFirstByName('email_setting')->value);
        $this->view->users = User::find()->toArray();
        $this->view->emailsms = $data;
        $this->view->formEmail = new EditSettingEmailForm($email_setting);
        $this->view->users_selected = $email_setting->users;
    }

    public function viewAction($id = null){
        $log = Emails::findFirstById($id);
        if ($this->request->isAjax() && $this->request->isPost()) {
            if (!$log) {
                $this->response->setStatusCode(404, 'Error');
                $this->response->setJsonContent([
                    'error' => ['Not find log'],
                ]);
                return $this->response->send();
            }else{
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent([
                    'sms' => $log->toArray()
                ]);
                return $this->response->send();
            }
        }
    }

    public function deleteAction(){
        if ($this->request->isAjax()) {
            $this->view->disable();
            $id = (int)$this->request->getPost('id');
            if ($emailsms = Emails::findFirstById($id)) {
                if ($emailsms->delete()) {
                    $this->response->setStatusCode(200, 'Deleted');
                    return $this->response->setJsonContent(['status' => 200]);
                } else {
                    $this->response->setStatusCode(500, 'Failed');
                    return $this->response->setJsonContent(['status' => 500]);
                }
            } else {
                $this->response->setStatusCode(404, 'Not find pack$emailsms');
                return $this->response->setJsonContent(['status' => 404]);
            }
        } else {
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }

    public function emailsettingAction(){
        if ($this->request->isAjax() && $this->request->isPost()) {
            $email_setting = GenaralSetting::findFirstByName('email_setting');
            if (!$email_setting) {
                $this->response->setStatusCode(404, 'Error');
                $this->response->setJsonContent([
                    'error' => ['Không tìm thấy thiết lập này'],
                ]);
                return $this->response->send();
            }else{
                $data = $this->request->getPost();
                $email_setting->value = json_encode($data);
                if($email_setting->save()){
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'email_setting' => $email_setting->toArray()
                    ]);
                    return $this->response->send();
                }else{
                    $error = [];
                    foreach ($email_setting->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                }

            }
        }
    }

    public function sendemailAction(){
        if ($this->request->isAjax() && $this->request->isPost()) {
            $post = $this->request->getPost();
            // var_dump($post);
            // die;
            $this->helper->send_email($post['client_name'],$post['client_email'],$post['title'],$post['body']);
        }
    }
    public function sendpoliemailAction(){
        if ($this->request->isAjax() && $this->request->isPost()) {
            $this->view->disable();
            if($userObj = $this->auth->getIdentity()){
                $post = $this->request->getPost();
                foreach ($post['users'] as $key => $id) {
                    $user = User::findFirstById($id);
                    $this->helper->send_email($user->fullname,$user->email,$post['title'],$post['body']);
                }
            }
        }
    }
}
