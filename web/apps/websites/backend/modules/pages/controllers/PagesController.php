<?php
namespace Backend\Modules\Pages\Controllers;
use Models\Pages;
use Backend\Modules\Pages\Forms\PagesForm;

class PagesController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function getdataAction(){
        if($this->request->isAjax()){
            $npPages = Pages::getNamepace();
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                $npPages.'.id',
                $npPages.'.title',
                $npPages.'.slug',
                $npPages.'.attribute_id',
                $npPages.'.content',
                $npPages.'.status',
                $npPages.'.except',
                $npPages.'.dept_id',
                $npPages.'.created_at',
                'D.name dept_name',
                'U.name author_name',
            ))
            ->from($npPages)
            ->join('Models\Departments', 'D.id = '.$npPages.'.dept_id','D')
            ->join('Models\Users', 'U.id = '.$npPages.'.author','U')
            ->orderBy($npPages.'.title DESC')
            ->where("1 = 1");
            // if($this->session->get('role') !== 1){
            //     $data = $data->andWhere("dept_id IN (".implode(',',$this->session->get('dept_mg')).")");
            // }
    
            $search = $npPages.'.title LIKE :search:';
            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent($this->ssp->data_output($this->request->get(), $data,$search));
            return $this->response->send();
        }else{
            $this->response->setStatusCode(403, 'Failed');
            $this->response->setJsonContent(['Truy cập không được phép']);
            return $this->response->send();
        }
    }

    public function updateAction($id = null){
        if($id){
            $page = Pages::findFirstId($id);
            $page->updated_at = date('Y-m-d H:i:s');
        }else{
            $page = new Pages();
            $page->created_at = date('Y-m-d H:i:s');
            $page->updated_at = $page->created_at;
        }

        $form = new PagesForm($page);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
                $error = [];
                $post = [
                    'title' => $this->request->getPost('title'),
                    'slug' => $this->request->getPost('slug'),
                    'attribute_id' => $this->request->getPost('attribute_id'),
                    'content' => $this->request->getPost('content'),
                    'status' => $this->request->getPost('status'),
                    'except' => $this->request->getPost('except'),
                    'author' => $this->session->get('user_id'),
                    'dept_id' => $this->session->get('dept_id'),
                ];

                $form->bind($post, $page);
                if (!$form->isValid()) {
                    foreach ($form->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                if (!count($error)) {
                    if (!$page->save()) {
                        if ($this->request->isAjax()) {
                            foreach ($page->getMessages() as $message) {
                                array_push($error, $message->getMessage());
                            }
                            $data['error'] = $error;
                            $this->response->setStatusCode(400, 'error');
                            $this->response->setJsonContent($data);
                            return $this->response->send();
                        } else {
                            foreach ($page->getMessages() as $message) {
                                $this->flashSession->error($message);
                            }
                        }
                    } else {
                        if ($this->request->isAjax()) {
                            $data['data'] = $page->toArray();
                            $this->response->setStatusCode(200, 'OK');
                            $this->response->setJsonContent($data);
                            return $this->response->send();
                        } else {
                            // $this->logs->write_log(1, 1, 'Thêm dây chuyền ID: ' . $page->id, json_encode($page->toArray()), $this->session->get("user_id"));
                            $this->flashSession->success("Cập nhật thành công");
                            // return $this->response->redirect('page');
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
        $this->view->form = $form;
        $this->view->page = $page;
    }

    public function deleteAction($id = null){

        if ($page = Pages::findFirstId($id)) {
            $page->status = 4;
            if (!$page->save()) {
                foreach ($page->getMessages() as $message) {
                    $this->flashSession->error($message);
                }
                return $this->response->redirect('page');
            }else{
                // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                $this->flashSession->success("Xóa trang thành công");
                return $this->response->redirect('pages');
            }
        }else{

        }
        
    }

    private function get_js_css (){
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/pages.js');
    }
}