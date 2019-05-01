<?php
namespace Backend\Modules\Posts\Controllers;
use Models\Categories;
use Backend\Modules\Posts\Forms\CategoriesForm;

class CategoriesController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function getdataAction(){
        if($this->request->isAjax()){
            $npCat = Categories::getNamepace();
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                $npCat.'.id',
                $npCat.'.name',
                $npCat.'.slug',
                $npCat.'.description',
                $npCat.'.status',
                $npCat.'.created_at',
                'U.name author_name',
            ))
            ->from($npCat)
            ->join('Models\Users', 'U.id = '.$npCat.'.author','U')
            ->orderBy($npCat.'.name DESC')
            ->where("1 = 1");
            // if($this->session->get('role') !== 1){
            //     $data = $data->andWhere("dept_id IN (".implode(',',$this->session->get('dept_mg')).")");
            // }
    
            $search = $npCat.'.name LIKE :search:';
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
            $post = Categories::findFirstId($id);
            $post->updated_at = date('Y-m-d H:i:s');
        }else{
            $post = new Categories();
            $post->created_at = date('Y-m-d H:i:s');
            $post->updated_at = $post->created_at;
        }

        $form = new CategoriesForm($post);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
                $error = [];
                $req = [
                    'title' => $this->request->getPost('title'),
                    'slug' => $this->request->getPost('slug'),
                    'cat_id' => $this->request->getPost('cat_id'),
                    'content' => $this->request->getPost('content'),
                    'status' => $this->request->getPost('status'),
                    'except' => $this->request->getPost('except'),
                    'author' => $this->session->get('user_id'),
                    'dept_id' => $this->session->get('dept_id'),
                ];

                $form->bind($req, $post);
                if (!$form->isValid()) {
                    foreach ($form->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                if (!count($error)) {
                    if (!$post->save()) {
                        if ($this->request->isAjax()) {
                            foreach ($post->getMessages() as $message) {
                                array_push($error, $message->getMessage());
                            }
                            $data['error'] = $error;
                            $this->response->setStatusCode(400, 'error');
                            $this->response->setJsonContent($data);
                            return $this->response->send();
                        } else {
                            foreach ($post->getMessages() as $message) {
                                $this->flashSession->error($message);
                            }
                        }
                    } else {
                        if ($this->request->isAjax()) {
                            $data['data'] = $post->toArray();
                            $this->response->setStatusCode(200, 'OK');
                            $this->response->setJsonContent($data);
                            return $this->response->send();
                        } else {
                            // $this->logs->write_log(1, 1, 'Thêm dây chuyền ID: ' . $post->id, json_encode($post->toArray()), $this->session->get("user_id"));
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
        $this->view->cat = $post;
    }

    public function deleteAction($id = null){

        if ($post = Categories::findFirstId($id)) {
            $post->status = 4;
            if (!$post->save()) {
                foreach ($post->getMessages() as $message) {
                    $this->flashSession->error($message);
                }
                return $this->response->redirect('page');
            }else{
                // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                $this->flashSession->success("Xóa trang thành công");
                return $this->response->redirect('posts');
            }
        }else{

        }
        
    }

    private function get_js_css (){
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/categories.js');
    }
}