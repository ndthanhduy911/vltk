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

        $filters = \Posts::findTrashFilters();
        $tables = \Posts::findTrashTables();
        $fFilters = ['title','catid','calendar'];
        $fTables = ['image','title','excerpt','catid','authorname','calendar','slug'];
        if($fSetting = \FilterSetting::findFirstKey('trashposts')){
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

        $perEdit = $this->master::checkPermissionDepted('posts', 'update',1);
        $perView = $this->master::checkPermissionDepted('posts', 'index');
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
            if(!$posts = \Posts::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }         
            foreach ($languages as $key => $lang) {
                $v = ($key == 0 ? true : false);
                $postLang = \PostsLang::findFirst(['postid = :id: AND langid = :langid:','bind' => ['id' => $posts->id, 'langid' => $lang->id]]);
                if($postLang){
                    $formLang = new PostsLangForm($postLang, [$lang->id,$v]);
                    $postsLang[$lang->id] = $postLang;
                    $formsLang[$lang->id] = $formLang;
                    $postContent[$lang->id] = $postLang->content;
                }else{
                    $formsLang[$lang->id] = new PostsLangForm(null, [$lang->id,$v]);
                    $postsLang[$lang->id] = new \PostsLang();
                    $postContent[$lang->id] = '';
                }
            }
            $title = 'Chỉnh sửa';
            $posts->updatedat = date('Y-m-d H:i:s');
            $posts->calendar = $this->helper->dateVn($posts->calendar,'d/m/Y H:i');
        }else{
            $posts = new \Posts();
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new PostsLangForm(null, [$lang->id,$v]);
                $postsLang[$lang->id] = new \PostsLang();
                $postContent[$lang->id] = '';
            }
            $posts->calendar = date('d/m/Y H:i');
        }

        $formPosts = new PostsForm($posts);

        $this->view->perEdit = $perEdit ? 1 : "";
        $this->view->perView = $perView ? 1 : "";
        $this->view->languages = $languages;
        $this->view->postContent = $postContent;
        $this->view->formsLang = $formsLang;
        $this->view->formPosts = $formPosts;
        $this->view->posts = $posts;
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
            'p.image',
            'p.author',
            'p.deptid',
            'p.calendar',
            'p.createdat',
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
        $data = \FilterSetting::getDataFilter($this,$data,\Posts::arrayFilter(),['p',['pl'=>['title']]]);

        $array_row = [
            'u' => $this->master::checkPermission('posts', 'update', 1)
        ];

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $array_row));
    }

    public function ajaxgetdatatrashAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('posts', 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $columns = [
            'p.id',
            'p.slug',
            'p.catid',
            'p.status',
            'p.image',
            'p.author',
            'p.deptid',
            'p.calendar',
            'p.createdat',
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
        ->where("p.deleted = 0 AND p.status = 4")
        ->leftJoin('User', 'u.id = p.author','u')
        ->leftJoin('CategoriesLang', 'c.catid = p.catid AND c.langid = 1','c')
        ->leftJoin('PostsLang', 'pl.postid = p.id AND pl.langid = 1','pl')
        ->leftJoin('Depts', 'd.id = p.deptid','d')
        ->orderBy('p.calendar DESC');

        $data = $this->master::builderPermission($data,$perL,'p');
        $data = \FilterSetting::getDataOrder($this,$data,\Posts::findFirst(),'p',['pl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,\Posts::arrayTrashFilter(),'p');

        $array_row = [];

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $array_row));
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
            if(!$posts = \Posts::findFirstIdPermission($id,$perL)){
                $data['error'] = ['Không tìm thấy bài viết'];
                $this->helper->responseJson($this, $data);
            }
            $posts->updatedat = date('Y-m-d H:i:s');
            $posts->updatedby = $userid;
        }else{
            $posts = new \Posts();
            $posts->author = $this->session->get('userid');
            $posts->deptid = $this->session->get('deptid');
            $posts->createdat = date('Y-m-d H:i:s');
            $posts->updatedat = $posts->createdat;
            $posts->createdby = $userid;
            $posts->updatedby = $userid;
        }
        $postLangs = [];

        foreach ($languages as $key => $lang) {

            if(!$id || !$postLang = \PostsLang::findFirst(["postid = :id: AND langid = :langid:",'bind' => ['id' => (int)$id,'langid' => $lang->id]])){
                $postLang = new \PostsLang();
            }

            if($key == 0){
                $lId = $lang->id;
            }

            $postLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $postLang->content = !empty($pContent[$lang->id]) ? $pContent[$lang->id] : $pContent[$lId];
            $postLang->excerpt = !empty($pExcerpt[$lang->id]) ? $pExcerpt[$lang->id] : $pExcerpt[$lId];
            $postLang->langid = $lang->id;
            array_push($postLangs,$postLang);
        }

        $plug = $this->request->getPost('slug',['string','trim']);
        $posts->catid = $this->request->getPost('catid',['int']);
        $posts->status = $this->request->getPost('status',['int']);
        $posts->slug = $plug ? $plug : $this->helper->slugify($pTitle[1]);

        $posts->calendar = $this->helper->dateMysql($this->request->getPost('calendar', ['string', 'trim']),'Y-m-d H:i:s');
        $posts->image = $this->request->getPost('image',['trim','string']);

        if(\Posts::findFirst(["slug = :slug: AND id != :id:","bind" => ["slug" => $posts->slug,'id'=> $id]])){
            $reqPost['slug'] = $posts->slug .'-'. strtotime('now');
        }

        if(!\Categories::findFirstIdPermission($posts->catid,$perL)){
            $data['error'] = ["Chuyên mục không tồn tại"];
            $this->helper->responseJson($this, $data);
        }

        try {
            $this->db->begin();
            $posts->vdUpdate(true);
            if (!$posts->save()) {
                foreach ($posts->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            foreach ($postLangs as $postLang) {
                $postLang->postid = $posts->id;
                $postLang->vdUpdate(true);
                if (!$postLang->save()) {
                    foreach ($postLang->getMessages() as $message) {
                        throw new \Exception($message->getMessage());
                    }
                }
            }
            $this->db->commit();
            $this->flashSession->success(($id ? 'Chỉnh sửa' : 'Thêm mới').' bài viết thành công');
        } catch (\Throwable $e) {
            $this->db->rollback();
            $data['error'] = [$e->getMessage()];
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
        if (!$item->save()) {
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
        $item->status = 1;
        if (!$item->save()) {
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
            'bind' => ['postId' => $itemOld['id']]
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