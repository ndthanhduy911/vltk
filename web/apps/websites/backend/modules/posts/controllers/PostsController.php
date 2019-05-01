<?php
namespace Backend\Modules\Posts\Controllers;
use Models\Posts;
use Backend\Modules\Posts\Forms\PostsForm;

class PostsController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function getdataAction(){
        if($this->request->isAjax()){
            $npPosts = Posts::getNamepace();
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                $npPosts.'.id',
                $npPosts.'.title',
                $npPosts.'.slug',
                $npPosts.'.cat_id',
                $npPosts.'.content',
                $npPosts.'.status',
                $npPosts.'.except',
                $npPosts.'.dept_id',
                $npPosts.'.created_at',
                $npPosts.'.calendar',
                $npPosts.'.featured_image',
                'D.name dept_name',
                'D.slug dept_slug',
                'U.name author_name',
                'C.name cat_name',
            ))
            ->from($npPosts)
            ->join('Models\Departments', 'D.id = '.$npPosts.'.dept_id','D')
            ->join('Models\Users', 'U.id = '.$npPosts.'.author','U')
            ->join('Models\Categories', 'C.id = '.$npPosts.'.cat_id','C')
            ->orderBy($npPosts.'.title DESC')
            ->where("1 = 1");
            // if($this->session->get('role') !== 1){
            //     $data = $data->andWhere("dept_id IN (".implode(',',$this->session->get('dept_mg')).")");
            // }
    
            $search = $npPosts.'.title LIKE :search:';
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
            $post = Posts::findFirstId($id);
            $post->updated_at = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
        }else{
            $post = new Posts();
            $post->author = $this->session->get('user_id');
            $post->dept_id = $this->session->get('dept_id');
            $post->created_at = date('Y-m-d H:i:s');
            $post->updated_at = $post->created_at;
            $title = 'Thêm mới';
        }

        $form = new PostsForm($post);
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
                            $this->flashSession->success($title." thành công");
                            return $this->response->redirect(BACKEND_URL.'/posts');
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
        $this->view->post = $post;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
    }

    public function deleteAction($id = null){

        if ($post = Posts::findFirstId($id)) {
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
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/posts.js');
    }
}