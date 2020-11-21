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
        $fTables = ['image','title','excerpt','catid','authorname','calendar','slug','status'];
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
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $filters = \Posts::findFilters();
        $tables = \Posts::findTables();
        $fFilters = ['title','catid','status','calendar'];
        $fTables = ['image','title','excerpt','catid','authorname','calendar','slug','status'];
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

    public function viewAction($id = 0){

        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $perEdit = $this->master::checkPermissionDepted('asset', 'update',1);
        $perView = $this->master::checkPermissionDepted('asset', 'index');
        $perL = $perView ? $perView : ($perEdit? $perEdit :false);
        if(!$perL){
            require ERROR_FILE; die;
        }
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $formsLang = [];
        $postsLang = [];
        $postContent = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$post = \Posts::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }            
            foreach ($languages as $key => $lang) {
                $postLang = \PostsLang::findFirst(['postid = :id: AND langid = :langid:','bind' => ['id' => $post->id, 'langid' => $lang->id]]);
                if($postLang){
                    $formLang = new PostsLangForm($postLang);
                    $postsLang[$lang->id] = $postLang;
                    $formsLang[$lang->id] = $formLang;
                    $postContent[$lang->id] = $postLang->content;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }
            $title = 'Chỉnh sửa';
            $post->updatedat = date('Y-m-d H:i:s');
            $post->calendar = $this->helper->dateVn($post->calendar,'d/m/Y H:i');
        }else{
            $post = new \Posts();
            $post->author = $this->session->get('userid');
            $post->deptid = $this->session->get('deptid');
            $post->createdat = date('Y-m-d H:i:s');
            $post->updatedat = $post->createdat;
            $title = 'Thêm mới';
            foreach ($languages as $lang) {
                $formsLang[$lang->id] = new PostsLangForm();
                $postsLang[$lang->id] = new \PostsLang();
                $postContent[$lang->id] = '';
            }
        }

        $formPost = new PostsForm($post);

        $this->view->perEdit = $perEdit ? 1 : "";
        $this->view->perView = $perView ? 1 : "";
        $this->view->languages = $languages;
        $this->view->postContent = $postContent;
        $this->view->formsLang = $formsLang;
        $this->view->formPost = $formPost;
        $this->view->post = $post;
        $this->view->postsLang = $postsLang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->getJsCss();
    }

    // ===============================
    // API
    // ===============================
    public function ajaxgetdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('posts', 'index')) {
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
            'p.image',
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
                'p.image',
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

    // ===================================
    // Update data
    // ===================================
    public function updateAction($id = 0){
        $this->view->disable();
        if (!$this->security->checkToken()) {
            $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            $data['error'] = ['Token không chính xác'];
            $this->helper->responseJson($this, $data);
        }
        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
        if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('posts','update')){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pContent = $this->request->getPost('content',['trim']);
        $pExcerpt = $this->request->getPost('excerpt',['string','trim']);
        if($id){
            if(!$post = \Posts::findFirstIdPermission($id,$perL)){
                $data['error'] = ['Không tìm thấy phiếu nhập'];
                $this->helper->responseJson($this, $data);
            }
            $post->updatedat = date('Y-m-d H:i:s');
            $post->updatedby = $userid;
        }else{
            $post = new \Posts();
            $post->author = $this->session->get('userid');
            $post->deptid = $this->session->get('deptid');
            $post->createdat = date('Y-m-d H:i:s');
            $post->updatedat = $post->createdat;
            $post->createdby = $userid;
            $post->updatedby = $userid;
        }
        $postLangs = [];
        foreach ($languages as $lang) {
            if(!$postLang = \PostsLang::findFirst(["postid = :id:",'bind' => ['id' => (int)$post->id]])){
                $postLang = new \PostsLang();
            }
            $postLang->title = isset($pTitle[$lang->id]) ? $pTitle[$lang->id] : NULL;
            $postLang->content = isset($pContent[$lang->id]) ? $pContent[$lang->id] : NULL;
            $postLang->excerpt = isset($pExcerpt[$lang->id]) ? $pExcerpt[$lang->id] : NULL;
            $postLang->langid = $lang->id;
            array_push($postLangs,$postLang);
        }

        $plug = $this->request->getPost('slug',['string','trim']);
        $post->title = $this->request->getPost('title',['string','trim']);
        $post->catid = $this->request->getPost('catid',['int','trim']);
        $post->status = $this->request->getPost('status',['int','trim']);
        $post->slug = $plug ? $plug : $this->helper->slugify($pTitle[1]);
        $post->calendar = $this->helper->dateMysql($this->request->getPost('calendar', ['string', 'trim']));
        $iamge = $this->helper->uploadImage('image', $post->image, 'image');
        if (!empty($checkReportfile['error'])) {
            $data['error'] = [$checkReportfile['error']];
            $this->helper->responseJson($this, $data);
        }
        $post->image = $iamge['filename'];

        if(\Posts::findFirst(["slug = :slug: AND id != :id:","bind" => ["slug" => $post->slug,'id'=> $id]])){
            $reqPost['slug'] = $post->slug .'-'. strtotime('now'); 
        }

        if(!\Categories::findFirstIdPermission($post->catid,$perL)){
            $data['error'] = ["Chuyên mục không tồn tại"];
            $this->helper->responseJson($this, $data);
        }

        try {
            $this->db->begin();
            $post->vdUpdate(true);
            if (!$post->save()) {
                $this->db->rollback();
                foreach ($post->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            foreach ($postLangs as $postLang) {
                $postLang->vdUpdate(true);
                if (!$postLang->save()) {
                    $this->db->rollback();
                    foreach ($postLang->getMessages() as $message) {
                        throw new \Exception($message->getMessage());
                    }
                }
            }
            $this->db->commit();
            $this->flashSession->success(($id ? 'Chỉnh sửa' : 'Thêm mới').' tài sản thành công');
        } catch (\Throwable $e) {
            $this->db->rollback();
            $this->flashSession->error($e->getMessage());
        }
        $this->helper->responseJson($this, $data);
    }

    public function restoreAction(){
        $this->view->disable();
        if(!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('posts','delete',1)){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Posts::findPermission($perL,"*",['status = 4 AND id IN (' . $strIds . ')']);

        try {
            $this->db->begin();
            foreach ($data as $item) {
                $this->restoreOne($item);
            }
            $this->db->commit();
        } catch (\Throwable $e) {
            $this->db->rollback();
            $this->helper->responseJson($this, ["error" => [$e->getMessage()]]);
        }
        $this->helper->responseJson($this, ["result" => ["Success"]]);
    }

    public function trashAction(){
        $this->view->disable();
        if(!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('posts','delete',1)){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Posts::findPermission($perL,"*",['id IN (' . $strIds . ')']);

        try {
            $this->db->begin();
            foreach ($data as $item) {
                $this->trashOne($item);
            }
            $this->db->commit();
        } catch (\Throwable $e) {
            $this->db->rollback();
            $this->helper->responseJson($this, ["error" => [$e->getMessage()]]);
        }
        $this->helper->responseJson($this, ["result" => ["Success"]]);
        
    }

    public function deleteAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('posts', 'delete')) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Posts::findPermission($perL,"*",['status = 4 AND id IN (' . $strIds . ')']);

        try {
            $this->db->begin();
            foreach ($data as $item) {
                $this->deleteOne($item);
            }
            $this->db->commit();
        } catch (\Throwable $e) {
            $this->db->rollback();
            $this->helper->responseJson($this, ["error" => [$e->getMessage()]]);
        }
        $this->helper->responseJson($this, ["result" => ["Success"]]);
    }

    // =================================
    // FUNCTION
    // =================================

    private function trashOne($item)
    {
        $userid = $this->session->get('userid');
        $item->updatedat = date('Y-m-d H:i:s');
        $item->updatedby = $userid;
        $item->status = 4;
        if (!$item->delete()) {
            foreach ($item->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        \Logs::saveLogs($this, 3, "Xóa tạm bài viết ID: {$item->id}", ['table' => 'Posts','id' => $item->id]);
    }

    private function restoreOne($item)
    {
        $userid = $this->session->get('userid');
        $item->updatedat = date('Y-m-d H:i:s');
        $item->updatedby = $userid;
        $item->status = 4;
        if (!$item->delete()) {
            foreach ($item->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        \Logs::saveLogs($this, 5, "Khôi phục bài viết ID: {$item->id}", ['table' => 'Posts','id' => $item->id]);
    }

    private function deleteOne($item)
    {
        $itemOld = $item->toArray();
        if (!$item->delete()) {
            foreach ($item->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        $data = \PostsLang::find([
            'postid = :postId:',
            ['postId' => $itemOld['id']]
        ]);
        foreach ($data as $it) {
            if (!$it->delete()) {
                foreach ($it->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
        }
        \Logs::saveLogs($this, 4, "Xóa bài viết ID: {$itemOld['id']}", ['table' => 'Posts','id' => $itemOld['id']]);
    }

    private function getJsCss(){
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/posts.js');
    }
}