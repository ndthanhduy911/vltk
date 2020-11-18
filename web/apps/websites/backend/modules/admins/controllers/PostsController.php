<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\PostsForm;
use Backend\Modules\Admins\Forms\PostsLangForm;
use Backend\Modules\Admins\Forms\SearchPostsForm;

class PostsController  extends \BackendController {

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $filters = \Posts::findFilters();
        $tables = \Posts::findTables();
        $fFilters = ['title','catid','status','calendar'];
        $fTables = ['featured_image','title','excerpt','catid','authorname','calendar','slug','status'];
        if($fSetting = \FilterSetting::findFirstKey('posts')){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $title = "Bài viết";
        $this->getJsCss();
        $this->view->searchForm = new SearchPostsForm();
        $this->view->title = $title;
        $this->view->filters = $filters;
        $this->view->tables = $tables;
        $this->view->fFilters = $fFilters;
        $this->view->fTables = $fTables;
    }

    public function trashsAction(){
        $this->getJsCss();
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
            $post->updatedat = date('Y-m-d H:i:s');
            $post->calendar = $this->helper->datetimeVn($post->calendar);
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $post_lang = \PostsLang::findFirst(['postid = :id: AND langid = :langid:','bind' => ['id' => $post->id, 'langid' => $lang->id]]);
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
            $post->deptid = $this->session->get('deptid');
            $post->createdat = date('Y-m-d H:i:s');
            $post->updatedat = $post->createdat;
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
                $reqPost = [
                    'catid' => $this->request->getPost('catid',['int','trim']),
                    'status' => $this->request->getPost('status',['int','trim']),
                    'slug' => $p_slug ? $p_slug : $this->helper->slugify($p_title[1]),
                    'calendar' => $p_calendar ? $p_calendar : date('d/m/Y H:i'),
                    'featured_image' => $this->request->getPost('featured_image',['string','trim']),
                ];

                $check_slug = \Posts::findFirst([
                    "slug = :slug: AND id != :id:",
                    "bind" => [
                        "slug" => $reqPost['slug'],
                        'id'    => $id,
                    ]
                ]);
    
                if($check_slug){
                    $reqPost['slug'] = $reqPost['slug'] .'-'. strtotime('now'); 
                }

                if(!$cat = \Categories::findFirst(["deptid = $post->deptid AND id = :catid:", 'bind' => ['catid' => $reqPost['catid']]])){
                    $this->flashSession->error("Danh mục không tôn tại");
                }

                $form_post->bind($reqPost, $post);
                if (!$form_post->isValid()) {
                    foreach ($form_post->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                foreach ($languages as $key => $lang) {
                    $reqPost_lang[$lang->id] = [
                        'title' => $p_title[$lang->id],
                        'content' => $p_content[$lang->id],
                        'excerpt' => $p_excerpt[$lang->id],
                        'langid' => $lang->id,
                    ];

                    $forms_lang[$lang->id]->bind($reqPost_lang[$lang->id], $posts_lang[$lang->id]);
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
                            $posts_lang[$lang->id]->postid = $post->id;
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
        $this->getJsCss();
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

    // ===============================
    // API
    // ===============================
    public function ajaxgetdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('asset', 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $columns = [
            'p.id',
            'p.slug',
            'p.catid',
            'p.status',
            'p.deptid',
            'p.createdat',
            'p.calendar',
            'p.featured_image',
            'pl.title',
            'pl.content',
            'pl.excerpt',
            'u.fullname authorname',
            'c.name catname',
            'd.slug dslug',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['p' => "Posts"])
        ->where("p.deleted = 0 AND p.status != 4")
        ->leftJoin('User', 'u.id = p.author','u')
        ->leftJoin('CategoriesLang', 'c.catid = p.catid AND c.langid = 1','c')
        ->leftJoin('PostsLang', 'pl.postid = p.id AND pl.langid = 1','pl')
        ->leftJoin('Depts', 'd.id = p.deptid','d')
        ->orderBy('p.calendar DESC');

        $data = $this->master::builderPermission($data,$perL,'p');
        $data = \FilterSetting::getDataOrder($this,$data,\Posts::findFirst(),'p',['pl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,\Posts::arrayFilter(),'p');

        $array_row = [
            'u' => $this->master::checkPermission('posts', 'update', 1)
        ];

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $array_row));
    }

    public function getdatatrashAction(){
        if($this->request->isAjax()){
            $deptid = $this->session->get('deptid');
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'p.id',
                'pl.title',
                'p.slug',
                'p.catid',
                'pl.content',
                'p.status',
                'pl.excerpt',
                'p.deptid',
                'p.createdat',
                'p.calendar',
                'p.featured_image',
                'u.name author_name',
                'c.name cat_name',
            ))
            ->from(['p'=>'Posts'])
            ->where("p.deleted = 0 AND p.status = 4 AND p.deptid = {$deptid}")
            ->leftJoin('Users', 'u.id = p.author','u')
            ->leftJoin('CategoriesLang', 'c.catid = p.catid AND c.langid = 1','c')
            ->leftJoin('PostsLang', 'pl.postid = p.id AND pl.langid = 1','pl')
            ->orderBy('p.calendar DESC');
            // if($this->session->get('role') !== 1){
            //     $data = $data->andWhere("deptid IN (".implode(',',$this->session->get('dept_mg')).")");
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
    private function getJsCss(){
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/admins/posts.js');
    }
}