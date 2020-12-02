<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\PagesForm;
use Backend\Modules\Admins\Forms\PagesLangForm;
use Backend\Modules\Admins\Forms\SearchPagesForm;

class PagesController  extends \BackendController {

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $filters = \Pages::findFilters();
        $tables = \Pages::findTables();
        $fFilters = ['title','status','createdat'];
        $fTables = ['image','title','excerpt','authorname','createdat','slug','status'];
        if($fSetting = \FilterSetting::findFirstKey('pages')){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $title = "Trang";
        $this->getJsCss();
        $this->view->searchForm = new SearchPagesForm();
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

        $filters = \Pages::findTrashFilters();
        $tables = \Pages::findTrashTables();
        $fFilters = ['title','createdat'];
        $fTables = ['image','title','excerpt','authorname','createdat','slug'];
        if($fSetting = \FilterSetting::findFirstKey('trashpages')){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $title = "Trang";
        $this->getJsCss();
        $this->view->searchForm = new SearchPagesForm();
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
        $pagesLang = [];
        $pageContent = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$pages = \Pages::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }         
            foreach ($languages as $key => $lang) {
                $v = ($key == 0 ? true : false);
                $pageLang = \PagesLang::findFirst(['pageid = :id: AND langid = :langid:','bind' => ['id' => $page->id, 'langid' => $lang->id]]);
                if($pageLang){
                    $formLang = new PagesLangForm($pageLang, [$lang->id,$v]);
                    $pagesLang[$lang->id] = $pageLang;
                    $formsLang[$lang->id] = $formLang;
                    $pageContent[$lang->id] = $pageLang->content;
                }else{
                    $formsLang[$lang->id] = new PagesLangForm(null, [$lang->id,$v]);
                    $pagesLang[$lang->id] = new \PagesLang();
                    $pageContent[$lang->id] = '';
                }
            }
            $title = 'Chỉnh sửa';
        }else{
            $pages = new \Pages();
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new PagesLangForm(null, [$lang->id,$v]);
                $pagesLang[$lang->id] = new \PagesLang();
                $pageContent[$lang->id] = '';
            }
        }

        $formPages = new PagesForm($pages);

        $this->view->perEdit = $perEdit ? 1 : "";
        $this->view->perView = $perView ? 1 : "";
        $this->view->languages = $languages;
        $this->view->pageContent = $pageContent;
        $this->view->formsLang = $formsLang;
        $this->view->formPages = $formPages;
        $this->view->pages = $pages;
        $this->view->pagesLang = $pagesLang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->getJsCss();
    }

    // =================================
    // API
    // =================================
    // Get data
    public function ajaxgetdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('pages', 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $columns = [
            'p.id',
            'p.slug',
            'p.attrid',
            'p.status',
            'p.author',
            'p.deptid',
            'p.image',
            'p.bgimage',
            'p.createdat',
            'pl.title',
            'pl.content',
            'pl.excerpt',
            'u.fullname authorname',
            'd.slug dslug',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['p' => "Pages"])
        ->where("p.deleted = 0 AND p.status != 4")
        ->leftJoin('User', 'u.id = p.author','u')
        ->leftJoin('PagesLang', 'pl.pageid = p.id AND pl.langid = 1','pl')
        ->leftJoin('Depts', 'd.id = p.deptid','d')
        ->orderBy('p.createdat DESC');

        $data = $this->master::builderPermission($data,$perL,'p');
        $data = \FilterSetting::getDataOrder($this,$data,\Pages::findFirst(),'p',['pl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,\Pages::arrayFilter(),['p',['pl'=>['title']]]);

        $array_row = [
            'u' => $this->master::checkPermission('pages', 'update', 1)
        ];

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $array_row));
    }

    public function ajaxgetdatatrashAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('pages', 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $columns = [
            'p.id',
            'p.slug',
            'p.attrid',
            'p.status',
            'p.author',
            'p.deptid',
            'p.image',
            'p.bgimage',
            'p.createdat',
            'pl.title',
            'pl.content',
            'pl.excerpt',
            'u.fullname authorname',
            'd.slug dslug',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['p' => "Pages"])
        ->where("p.deleted = 0 AND p.status = 4")
        ->leftJoin('User', 'u.id = p.author','u')
        ->leftJoin('PagesLang', 'pl.pageid = p.id AND pl.langid = 1','pl')
        ->leftJoin('Depts', 'd.id = p.deptid','d')
        ->orderBy('p.createdat DESC');

        $data = $this->master::builderPermission($data,$perL,'p');
        $data = \FilterSetting::getDataOrder($this,$data,\Pages::findFirst(),'p',['pl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,\Pages::arrayTrashFilter(),['p',['pl'=>['title']]]);

        $array_row = [];

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $array_row));
    }

    // Update data

    public function updateAction($id = 0){
        $this->view->disable();
        if (!$this->security->checkToken()) {
            $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            $data['error'] = ['Token không chính xác'];
            $this->helper->responseJson($this, $data);
        }
        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
        if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('pages','update')){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pContent = $this->request->getPost('content',['trim']);
        $pExcerpt = $this->request->getPost('excerpt',['string','trim']);
        if($id){
            if(!$page = \Pages::findFirstIdPermission($id,$perL)){
                $data['error'] = ['Không tìm thấy trang'];
                $this->helper->responseJson($this, $data);
            }
            $page->updatedat = date('Y-m-d H:i:s');
            $page->updatedby = $userid;
        }else{
            $page = new \Pages();
            $page->author = $this->session->get('userid');
            $page->deptid = $this->session->get('deptid');
            $page->createdat = date('Y-m-d H:i:s');
            $page->updatedat = $page->createdat;
            $page->createdby = $userid;
            $page->updatedby = $userid;
        }
        $pageLangs = [];

        foreach ($languages as $key => $lang) {

            if(!$id || !$pageLang = \PagesLang::findFirst(["pageid = :id: AND langid = :langid:",'bind' => ['id' => (int)$id,'langid' => $lang->id]])){
                $pageLang = new \PagesLang();
            }

            if($key == 0){
                $lId = $lang->id;
            }

            $pageLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $pageLang->content = !empty($pContent[$lang->id]) ? $pContent[$lang->id] : $pContent[$lId];
            $pageLang->excerpt = !empty($pExcerpt[$lang->id]) ? $pExcerpt[$lang->id] : $pExcerpt[$lId];
            $pageLang->langid = $lang->id;
            array_push($pageLangs,$pageLang);
        }

        $plug = $this->request->getPost('slug',['string','trim']);
        $page->attrid = $this->request->getPost('attrid',['int']);
        $page->status = $this->request->getPost('status',['int']);
        $page->slug = $plug ? $plug : $this->helper->slugify($pTitle[1]);
        $page->image = $this->request->getPost('image',['trim','string']);
        $page->bgimage = $this->request->getPost('bgimage',['trim','string']);

        if(\Pages::findFirst(["slug = :slug: AND id != :id:","bind" => ["slug" => $page->slug,'id'=> $id]])){
            $reqPost['slug'] = $page->slug .'-'. strtotime('now');
        }

        try {
            $this->db->begin();
            $page->vdUpdate(true);
            if (!$page->save()) {
                foreach ($page->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            foreach ($pageLangs as $pageLang) {
                $pageLang->pageid = $page->id;
                $pageLang->vdUpdate(true);
                if (!$pageLang->save()) {
                    foreach ($pageLang->getMessages() as $message) {
                        throw new \Exception($message->getMessage());
                    }
                }
            }
            $this->db->commit();
            $this->flashSession->success(($id ? 'Chỉnh sửa' : 'Thêm mới').' trang thành công');
        } catch (\Throwable $e) {
            $this->db->rollback();
            $data['error'] = [$e->getMessage()];
        }
        $this->helper->responseJson($this, $data);
    }

    public function restoreAction(){
        $this->view->disable();
        if(!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('pages','delete',1)){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Pages::findPermission($perL,"*",['status = 4 AND id IN (' . $strIds . ')']);

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
        if(!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('pages','delete',1)){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Pages::findPermission($perL,"*",['id IN (' . $strIds . ')']);

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
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('pages', 'delete')) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Pages::findPermission($perL,"*",['status = 4 AND id IN (' . $strIds . ')']);

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
    private function trashOne($item){
        $userid = $this->session->get('userid');
        $item->updatedat = date('Y-m-d H:i:s');
        $item->updatedby = $userid;
        $item->status = 4;
        if (!$item->save()) {
            foreach ($item->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        \Logs::saveLogs($this, 3, "Xóa tạm trang ID: {$item->id}", ['table' => 'Pages','id' => $item->id]);
    }

    private function restoreOne($item){
        $userid = $this->session->get('userid');
        $item->updatedat = date('Y-m-d H:i:s');
        $item->updatedby = $userid;
        $item->status = 1;
        if (!$item->save()) {
            foreach ($item->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        \Logs::saveLogs($this, 5, "Khôi phục trang ID: {$item->id}", ['table' => 'Pages','id' => $item->id]);
    }

    private function deleteOne($item){
        $itemOld = $item->toArray();
        if (!$item->delete()) {
            foreach ($item->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        $data = \PagesLang::find([
            'pageid = :pageid:',
            'bind' => ['pageid' => $itemOld['id']]
        ]);
        foreach ($data as $it) {
            if (!$it->delete()) {
                foreach ($it->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
        }
        \Logs::saveLogs($this, 4, "Xóa trang ID: {$itemOld['id']}", ['table' => 'Pages','id' => $itemOld['id']]);
    }

    private function getJsCss(){
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/pages.js');
    }
}