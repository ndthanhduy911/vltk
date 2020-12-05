<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\PostsForm;
use Backend\Modules\Admins\Forms\PostsLangForm;
use Backend\Modules\Admins\Forms\SearchPostsForm;

class PostsController  extends \BackendController {

    private $title = "Bài viết";

    private $cler = "posts";

    private $className = \Posts::class;

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $filters = ($this->className)::findFilters();
        $tables = ($this->className)::findTables();
        $fFilters = ['title','catid','status','calendar'];
        $fTables = ['image','title','excerpt','catid','authorname','calendar','slug','status'];
        if($fSetting = \FilterSetting::findFirstKey($this->cler)){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $this->view->searchForm = new SearchPostsForm();
        $this->view->title = $this->title;
        $this->view->filters = $filters;
        $this->view->tables = $tables;
        $this->view->fFilters = $fFilters;
        $this->view->fTables = $fTables;
        $this->view->cler = $this->cler;
        $this->view->className = $this->className;
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/templates/indexs.js');
        $this->getJsCss();
        return $this->view->pick('templates/indexs');
    }

    public function viewAction($id = 0){

        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $perEdit = $this->master::checkPermissionDepted($this->cler, 'update',1);
        $perView = $this->master::checkPermissionDepted($this->cler, 'index');
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
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$items = ($this->className)::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }         
            foreach ($languages as $key => $lang) {
                $v = ($key == 0 ? true : false);
                $itemsLang = \PostsLang::findFirst(['postid = :id: AND langid = :langid:','bind' => ['id' => $items->id, 'langid' => $lang->id]]);
                if($itemsLang){
                    $formLang = new PostsLangForm($itemsLang, [$lang->id,$v]);
                    $formsLang[$lang->id] = $formLang;
                }else{
                    $formsLang[$lang->id] = new PostsLangForm(null, [$lang->id,$v]);
                }
            }
            $title = 'Chỉnh sửa';
            $items->updatedat = date('Y-m-d H:i:s');
            $items->calendar = $this->helper->dateVn($items->calendar,'d/m/Y H:i');
        }else{
            $items = new \Posts();
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new PostsLangForm(null, [$lang->id,$v]);
            }
            $items->calendar = date('d/m/Y H:i');
        }

        $form = new PostsForm($items);

        $this->view->perEdit = $perEdit ? 1 : "";
        $this->view->perView = $perView ? 1 : "";
        $this->view->languages = $languages;
        $this->view->formsLang = $formsLang;
        $this->view->form = $form;
        $this->view->items = $items;
        $this->view->title = $title;
        $this->view->btitle = $this->title;
        $this->view->cler = $this->cler;
        $this->assets->addJs(WEB_URI.'/elfinder/js/require.min.js');
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/templates/views.js');
        return $this->view->pick('templates/views');
    }

    // ===============================
    // API
    // ===============================
    public function ajaxgetdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted($this->cler, 'index')) {
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
            '(SELECT dl.title FROM DeptsLang AS dl WHERE dl.deptid = p.deptid AND dl.langid = 1) AS deptname',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['p' => "Posts"])
        ->where("p.deleted = 0")
        ->leftJoin('User', 'u.id = p.author','u')
        ->leftJoin('CategoriesLang', 'c.catid = p.catid AND c.langid = 1','c')
        ->leftJoin('PostsLang', 'pl.postid = p.id AND pl.langid = 1','pl')
        ->leftJoin('Depts', 'd.id = p.deptid','d')
        ->orderBy('p.deptid ASC, p.calendar DESC');

        $data = $this->master::builderPermission($data,$perL,'p');
        $data = \FilterSetting::getDataOrder($this,$data,($this->className)::findFirst(),'p',['pl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,($this->className)::arrayFilter(),['p',['pl'=>['title']]]);

        $array_row = [
            'u' => $this->master::checkPermission($this->cler, 'update', 1)
        ];

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
        if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted($this->cler,'update')){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pContent = $this->request->getPost('content',['trim']);
        $pExcerpt = $this->request->getPost('excerpt',['string','trim']);
        if($id){
            if(!$posts = ($this->className)::findFirstIdPermission($id,$perL)){
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

        if(($this->className)::findFirst(["slug = :slug: AND id != :id:","bind" => ["slug" => $posts->slug,'id'=> $id]])){
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

    public function deleteAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted($this->cler, 'delete')) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = ($this->className)::findPermission($perL,"*",['deleted = 0 AND id IN (' . $strIds . ')']);

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
    private function deleteOne($item)
    {
        $userid = $this->session->get('userid');
        $item->updatedat = date('Y-m-d H:i:s');
        $item->updatedby = $userid;
        $item->deleted = 1;
        if (!$item->save()) {
            foreach ($item->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        \Logs::saveLogs($this, 3, "Xóa tạm bài viết ID: {$item->id}", ['table' => 'Posts','id' => $item->id]);
    }

    private function getJsCss(){
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/posts.js');
    }
}