<?php
namespace Backend\Modules\Dashboard\Controllers;

use Library\Common;
use Library\Helper\Helper;

use Phalcon\Mvc\View;

use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\QueryBuilder as Paginator;
use Library\Pagination\Pager as Pager;

use Models\GenaralSetting;
use Models\Package;
use Models\Faq;

use Backend\Modules\Dashboard\Forms\SettingForm;
use Backend\Modules\Dashboard\Forms\EditFaqForm;

class SettingController  extends \BackendController
{
    public function indexAction(){
        if($this->request->getQuery('single')){
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $array = [];
        $array['login_title'] = GenaralSetting::getNameField('login_title')->value;
        $this->view->setingLogin = new SettingForm((object)$array);
    }

    public function editAction(){
        if($this->request->isAjax()){
            $this->view->disable();
            $post = $this->request->getPost();
            foreach ($post as $key => $value) {
                if($genaral = GenaralSetting::getNameField($key)){
                    $genaral->value = $value;
                    $genaral->save();
                }
            }
            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent([
                'status' => 200
            ]);
            return $this->response->send();
        }else{
            return $this->response->redirect('/adcp/setting');
        }
        
    }

    public function faqAction(){
        if($this->request->getQuery('single')){
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'Models\Faq.id',
            'Models\Faq.ask',
            'Models\Faq.answer',
            'Models\Faq.package_id',
            'Models\Faq.location',
            'Models\Faq.status',
            'P.name package_name',
        ))
        ->from('Models\Faq')
        ->join('Models\Package', 'P.id = Models\Faq.package_id','P')
        ->where('1=1');
        $data = $data->getQuery()->execute();
        $currentPage = abs($this->request->getQuery('page', 'int', 1));
        if ($currentPage == 0) {
            $currentPage = 1;
        }

        $paginator = new PaginatorModel(
            [
                "data" => $data,
                "limit" => 10000000,
                "page" => $currentPage,
            ]
        );
        $this->view->form = new EditFaqForm();
        $this->view->page = $paginator->getPaginate();
    }

    public function addfaqAction(){
        if ($this->request->isAjax() && $this->request->isPost()) {
            $this->view->disable();
            $faqObj = new Faq();
            $faq = new EditFaqForm();
            $post = $this->request->getPost();
            $faq->bind($post, $faqObj);
            if (!$faq->isValid()) {
                $error = [];
                foreach ($faq->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            }
            if (!$faqObj->save()) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $faqObj->getMessages()
                ]);
                return $this->response->send();
            } else {
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent([
                    'faq' => $faqObj->toArray()
                ]);
                return $this->response->send();
            }
        }else{
            return $this->response->redirect('/setting/faq');
        }
    }

    public function editfaqAction($id = null){
        if ($this->request->isAjax() && $this->request->isPost()) {
            $this->view->disable();
            $faq = Faq::findFirstById($id);
            $edit = new EditFaqForm();
            if (!$faq) {
                $this->response->setStatusCode(404, 'Error');
                $this->response->setJsonContent([
                    'error' => ['Not find faq'],
                ]);
                return $this->response->send();
            }
            $post = $this->request->getPost();
            $edit->bind($post, $faq);
            if (!$edit->isValid()) {
                $error = [];
                foreach ($edit->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(404, 'Error');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            } else {
                if (!$faq->save()) {
                    
                    $error = [];
                    foreach ($faq->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(404, 'Error');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'faq' => $faq->toArray()
                    ]);
                    return $this->response->send();
                }
            }
        }
    }

    public function deletefaqAction(){
        if ($this->request->isAjax()) {
            $this->view->disable();
            $id = (int)$this->request->getPost('id');
            if ($faq = Faq::findFirstById($id)) {
                $file = $faq->file;
                if ($faq->delete()) {
                    $this->response->setStatusCode(200, 'Deleted');
                    return $this->response->setJsonContent(['status' => 200]);
                } else {
                    $this->response->setStatusCode(500, 'Failed');
                    return $this->response->setJsonContent(['status' => 500]);
                }
            } else {
                $this->response->setStatusCode(404, 'Không tìm thấy câu hỏi');
                return $this->response->setJsonContent(['status' => 404]);
            }
        } else {
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }
}
