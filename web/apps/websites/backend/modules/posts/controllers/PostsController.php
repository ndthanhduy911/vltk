<?php
namespace Backend\Modules\Posts\Controllers;
use Models\Posts;
use Backend\Modules\Posts\Forms\PostsForm;

class PostsController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
    }

    public function trashsAction(){
        $this->get_js_css();
    }

    public function updateAction($id = null){
        if($id){
            $post = Posts::findFirstId($id);
            $post->updated_at = date('Y-m-d H:i:s');
            $post->calendar = $this->helper->datetime_vn($post->calendar);
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
                $p_title = $this->request->getPost('title');
                $p_slug = $this->request->getPost('slug');
                $p_calendar = $this->request->getPost('calendar');
                $req = [
                    'title' => $p_title,
                    'slug' => $this->request->getPost('slug') ? $p_slug : $this->helper->slugify($p_title),
                    'cat_id' => $this->request->getPost('cat_id'),
                    'content' => $this->request->getPost('content'),
                    'status' => $this->request->getPost('status'),
                    'calendar' => $p_calendar ? $p_calendar : date('d/m/Y H:i'),
                    'except' => $this->request->getPost('except'),
                    'featured_image' => $this->request->getPost('featured_image'),
                ];

                $form->bind($req, $post);
                if (!$form->isValid()) {
                    foreach ($form->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                $check_slug = Posts::findFirst([
                    "slug = :slug: AND id != :id:",
                    "bind" => [
                        "slug" => $req['slug'],
                        'id'    => $id,
                    ]
                ]);

                if($check_slug){
                    array_push($error, 'Slug đã tồn tại');
                }

                if (!count($error)) {
                    $post->calendar = $this->helper->datetime_mysql($post->calendar);
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
        $this->get_js_css();
    }

    public function restoreAction($id = null){

        if ($post = Posts::findFirstId($id)) {
            $post->status = 1;
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
                    return $this->response->redirect(BACKEND_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $post->toArray();
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                    $this->flashSession->success("Khôi phục bài viết thành công");
                    return $this->response->redirect(BACKEND_URL.'/posts');
                }
            }
        }else{
            if ($this->request->isAjax()) {
                $data['error'] = 'Không tìm thấy bài viết';
                $this->response->setStatusCode(404, 'Not found');
                $this->response->setJsonContent($data);
                return $this->response->send();
            } else {
                // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                $this->flashSession->error("Không tìm thấy bài viết");
                return $this->response->redirect(BACKEND_URL.'/posts');
            }
        }
        
    }

    public function trashAction($id = null){

        if ($post = Posts::findFirstId($id)) {
            $post->status = 4;
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
                    return $this->response->redirect(BACKEND_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $post->toArray();
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                    $this->flashSession->success("Chuyển bài viết đến thùng rác thành công");
                    return $this->response->redirect(BACKEND_URL.'/posts');
                }
            }
        }else{
            if ($this->request->isAjax()) {
                $data['error'] = 'Không tìm thấy bài viết';
                $this->response->setStatusCode(404, 'Not found');
                $this->response->setJsonContent($data);
                return $this->response->send();
            } else {
                // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                $this->flashSession->error("Không tìm thấy bài viết");
                return $this->response->redirect(BACKEND_URL.'/posts');
            }
        }
        
    }

    public function deleteAction($id = null){
        $post = Posts::findFirstId($id);
        if ($post !== false) {
            if (!$post->delete()) {
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
                    return $this->response->redirect(BACKEND_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $post->toArray();
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                    $this->flashSession->success("Xóa bài viết khoản thành công");
                    return $this->response->redirect(BACKEND_URL.'/trashs');
                }

            }
        }else{
            if ($this->request->isAjax()) {
                $data['error'] = 'Không tìm thấy bài viết';
                $this->response->setStatusCode(404, 'Not found');
                $this->response->setJsonContent($data);
                return $this->response->send();
            } else {
                // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                $this->flashSession->error("Không tìm thấy bài viết");
                return $this->response->redirect(BACKEND_URL.'/trashs');
            }
        }
    }

    // =================================
    // API
    // =================================
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
            ->where($npPosts.'.status != 4');
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

    public function getdatatrashAction(){
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
            ->where($npPosts.'.status = 4');
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
    // =================================
    // FUNCTION
    // =================================
    private function get_js_css (){
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/posts.js');
    }
}