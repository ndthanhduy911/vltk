<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\PostsForm;
use Backend\Modules\Admins\Forms\PostsLangForm;


class PostsController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // var_dump($_SESSION); die;
    }

    public function trashsAction(){
        $this->get_js_css();
    }

    public function updateAction($id = 0){
        $forms_lang = [];
        $posts_lang = [];
        $post_content = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$post = \Posts::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $post->updated_at = date('Y-m-d H:i:s');
            $post->calendar = $this->helper->datetimeVn($post->calendar);
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $post_lang = \PostsLang::findFirst(['post_id = :id: AND lang_id = :lang_id:','bind' => ['id' => $post->id, 'lang_id' => $lang->id]]);
                if($post_lang){
                    $form_lang = new PostsLangForm($post_lang);
                    $posts_lang[$lang->id] = $post_lang;
                    $forms_lang[$lang->id] = $form_lang;
                    $post_content[$lang->id] = $post_lang->content;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $post = new \Posts();
            $post->author = $this->session->get('user_id');
            $post->dept_id = $this->session->get('dept_id');
            $post->created_at = date('Y-m-d H:i:s');
            $post->updated_at = $post->created_at;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $forms_lang[$lang->id] = new PostsLangForm();
                $posts_lang[$lang->id] = new \PostsLang();
                $post_content[$lang->id] = '';
            }
        }

        $form_post = new PostsForm($post);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
                $error = [];
                $p_title = $this->request->getPost('title',['string','trim']);
                $p_slug = $this->request->getPost('slug',['string','trim']);
                $p_content = $this->request->getPost('content',['trim']);
                $p_excerpt = $this->request->getPost('excerpt',['string','trim']);
                $p_calendar = $this->request->getPost('calendar',['string','trim']);
                $req_post = [
                    'cat_id' => $this->request->getPost('cat_id',['int','trim']),
                    'status' => $this->request->getPost('status',['int','trim']),
                    'slug' => $p_slug ? $p_slug : $this->helper->slugify($p_title[1]),
                    'calendar' => $p_calendar ? $p_calendar : date('d/m/Y H:i'),
                    'featured_image' => $this->request->getPost('featured_image',['string','trim']),
                ];

                $check_slug = \Posts::findFirst([
                    "slug = :slug: AND id != :id:",
                    "bind" => [
                        "slug" => $req_post['slug'],
                        'id'    => $id,
                    ]
                ]);
    
                if($check_slug){
                    $req_post['slug'] = $req_post['slug'] .'-'. strtotime('now'); 
                }

                if(!$cat = \Categories::findFirst(["dept_id = $post->dept_id AND id = :cat_id:", 'bind' => ['cat_id' => $req_post['cat_id']]])){
                    $this->flashSession->error("Danh mục không tôn tại");
                }

                $form_post->bind($req_post, $post);
                if (!$form_post->isValid()) {
                    foreach ($form_post->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                foreach ($languages as $key => $lang) {
                    $req_post_lang[$lang->id] = [
                        'title' => $p_title[$lang->id],
                        'content' => $p_content[$lang->id],
                        'excerpt' => $p_excerpt[$lang->id],
                        'lang_id' => $lang->id,
                    ];

                    $forms_lang[$lang->id]->bind($req_post_lang[$lang->id], $posts_lang[$lang->id]);
                    if (!$forms_lang[$lang->id]->isValid()) {
                        foreach ($forms_lang[$lang->id]->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
                }

                if (!count($error)) {
                    $post->calendar = $this->helper->datetimeMysql($post->calendar);
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
                        return $this->response->redirect(WEB_ADMIN_URL.'/posts');
                    }
                }else{
                    foreach ($error as $value) {
                        $this->flashSession->error($value);
                    }
                }
            }else{
                $this->flashSession->error("Token không chính xác");
            }
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
        if ($post = \Posts::findFirstId($id)) {
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
                    return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $post->toArray();
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    $this->flashSession->success("Khôi phục bài viết thành công");
                    return $this->response->redirect(WEB_ADMIN_URL.'/posts');
                }
            }
        }else{
            if ($this->request->isAjax()) {
                $data['error'] = 'Không tìm thấy bài viết';
                $this->response->setStatusCode(404, 'Not found');
                $this->response->setJsonContent($data);
                return $this->response->send();
            } else {
                $this->flashSession->error("Không tìm thấy bài viết");
                return $this->response->redirect(WEB_ADMIN_URL.'/posts');
            }
        }
        
    }

    public function trashAction($id = null){

        if ($post = \Posts::findFirstId($id)) {
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
                    return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
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
                    return $this->response->redirect(WEB_ADMIN_URL.'/posts');
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
                return $this->response->redirect(WEB_ADMIN_URL.'/posts');
            }
        }
        
    }

    public function deleteAction($id = null){
        if ($post = \Posts::findFirstId($id)) {
            $post->deleted = 1;
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
                    return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $post->toArray();
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    $this->flashSession->success("Xóa bài viết khoản thành công");
                    return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
                }
            }
        }else{
            if ($this->request->isAjax()) {
                $data['error'] = 'Không tìm thấy bài viết';
                $this->response->setStatusCode(404, 'Not found');
                $this->response->setJsonContent($data);
                return $this->response->send();
            } else {
                $this->flashSession->error("Không tìm thấy bài viết");
                return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
            }
        }
    }

    // =================================
    // API
    // =================================
    public function getdataAction(){
        if(!$this->request->isAjax() && $this->request->isPost()){ 
            $this->response->setStatusCode(403, 'Failed');
            $this->response->setJsonContent(['Truy cập không được phép']);
            return $this->response->send();
        }

        $dept_id = $this->session->get('dept_id');
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'p.id',
            'p.title',
            'p.slug',
            'p.cat_id',
            'p.content',
            'p.status',
            'p.excerpt',
            'p.dept_id',
            'p.created_at',
            'p.calendar',
            'p.featured_image',
            'u.name author_name',
            'c.name cat_name',
        ))
        ->from(['p' => "Posts"])
        ->where("p.deleted = 0 AND p.dept_id = $dept_id AND p.status != 4")
        ->leftJoin('Users', 'u.id = p.author','u')
        ->leftJoin('CategoriesLang', 'c.cat_id = p.cat_id AND c.lang_id = 1','c')
        ->leftJoin('PostsLang', 'p.post_id = p.id AND PL.lang_id = 1','PL')
        ->orderBy('p.calendar DESC');

        $search = 'pl.title LIKE :search:';
        $this->response->setStatusCode(200, 'OK');
        $this->response->setJsonContent($this->ssp->data_output($this->request->get(), $data,$search));
        return $this->response->send();

    }

    public function getdatatrashAction(){
        if($this->request->isAjax()){
            $dept_id = $this->session->get('dept_id');
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'p.id',
                'pl.title',
                'p.slug',
                'p.cat_id',
                'pl.content',
                'p.status',
                'pl.excerpt',
                'p.dept_id',
                'p.created_at',
                'p.calendar',
                'p.featured_image',
                'u.name author_name',
                'c.name cat_name',
            ))
            ->from(['p'=>'Posts'])
            ->where("p.deleted = 0 AND p.status = 4 AND p.dept_id = {$dept_id}")
            ->leftJoin('Users', 'u.id = p.author','u')
            ->leftJoin('CategoriesLang', 'c.cat_id = p.cat_id AND c.lang_id = 1','c')
            ->leftJoin('PostsLang', 'pl.post_id = p.id AND pl.lang_id = 1','pl')
            ->orderBy('p.calendar DESC');
            // if($this->session->get('role') !== 1){
            //     $data = $data->andWhere("dept_id IN (".implode(',',$this->session->get('dept_mg')).")");
            // }
    
            $search = 'pl.title LIKE :search:';
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