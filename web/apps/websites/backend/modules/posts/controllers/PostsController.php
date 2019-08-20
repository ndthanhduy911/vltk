<?php
namespace Backend\Modules\Posts\Controllers;
use Models\Posts;
use Models\PostsLang;
use Models\Language;
use Backend\Modules\Posts\Forms\PostsForm;
use Backend\Modules\Posts\Forms\PostsLangForm;

class PostsController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
    }

    public function trashsAction(){
        $this->get_js_css();
    }

    public function updateAction($id = null){
        $forms_lang = [];
        $posts_lang = [];
        $post_content = [];
        $languages = Language::find(['status = 1']);
        if($id){
            if(!$post = Posts::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $post->updated_at = date('Y-m-d H:i:s');
            $post->calendar = $this->helper->datetime_vn($post->calendar);
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $post_lang = PostsLang::findFirst(['post_id = :id: AND lang_id = :lang_id:','bind' => ['id' => $post->id, 'lang_id' => $lang->id]]);
                if(!$post_lang){
                    $form_lang = new PostsLangForm($post_lang);
                    $posts_lang[$lang->id] = $post_lang;
                    $forms_lang[$lang->id] = $form_lang;
                    $post_content[$lang->id] = $post_lang->content;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $post = new Posts();
            $post->author = $this->session->get('user_id');
            $post->dept_id = $this->session->get('dept_id');
            $post->created_at = date('Y-m-d H:i:s');
            $post->updated_at = $post->created_at;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $forms_lang[$lang->id] = new PostsLangForm();
                $posts_lang[$lang->id] = new PostsLang();
                $post_content[$lang->id] = '';
            }
        }

        $form_post = new PostsForm($post);
        if ($this->request->isPost()) {
            // if ($this->security->checkToken()) {
                $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
                $error = [];
                $p_title = $this->request->getPost('title');
                $p_slug = $this->request->getPost('slug');
                $p_content = $this->request->getPost('content');
                $p_excerpt = $this->request->getPost('excerpt');
                $p_calendar = $this->request->getPost('calendar');
                $req_post = [
                    'cat_id' => $this->request->getPost('cat_id'),
                    'status' => $this->request->getPost('status'),
                    'calendar' => $p_calendar ? $p_calendar : date('d/m/Y H:i'),
                    'featured_image' => $this->request->getPost('featured_image'),
                ];

                $form_post->bind($req_post, $post);
                if (!$form_post->isValid()) {
                    foreach ($form_post->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                foreach ($languages as $key => $lang) {
                    $req_post_lang[$lang->id] = [
                        'title' => $p_title[$lang->id],
                        'slug' => $p_slug[$lang->id] ? $p_slug[$lang->id] : $this->helper->slugify($p_title[$lang->id]),
                        'content' => $p_content[$lang->id],
                        'excerpt' => $p_excerpt[$lang->id],
                        'lang_id' => $lang->id,
                    ];

                    $check_slug = PostsLang::findFirst([
                        "(slug = :slug: OR title = :title:) AND post_id != :id:",
                        "bind" => [
                            "slug" => $req_post_lang[$lang->id]['slug'],
                            'id'    => $id,
                            'title' => $req_post_lang[$lang->id]['title'],
                        ]
                    ]);
        
                    if($check_slug){
                        array_push($error, $lang->name.': slug hoặc tiêu đề đã tồn tại');
                    }

                    $forms_lang[$lang->id]->bind($req_post_lang[$lang->id], $posts_lang[$lang->id]);
                    if (!$forms_lang[$lang->id]->isValid()) {
                        foreach ($forms_lang[$lang->id]->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
                }

                if (!count($error)) {
                    $post->calendar = $this->helper->datetime_mysql($post->calendar);
                    $post->author = $this->session->get('user_id');
                    $post->dept_id = $this->session->get('dept_id');
                    if (!$post->save()) {
                        foreach ($post->getMessages() as $message) {
                            $this->flashSession->error($message);
                        }
                    } else {
                        foreach ($languages as $key => $lang) {
                            $posts_lang[$lang->id]->post_id = $post->id;
                            $posts_lang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(BACKEND_URL.'/posts');
                    }
                }else{
                    foreach ($error as $value) {
                        $this->flashSession->error($value);
                    }
                }
            // }else{
            //     $this->flashSession->error("Token không chính xác");
            // }
        }

        $this->view->languages = $languages;
        $this->view->post_content = $post_content;
        $this->view->forms_lang = $forms_lang;
        $this->view->form_post = $form_post;
        $this->view->post = $post;
        $this->view->posts_lang = $posts_lang;
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
                $npPosts.'.excerpt',
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
                $npPosts.'.excerpt',
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