<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\PagesForm;
use Backend\Modules\Admins\Forms\PagesLangForm;
use Backend\Modules\Admins\Forms\SearchPagesForm;

class PagesController  extends \BackendController {

    private $title = "Trang thông tin";

    private $cler = "pages";

    private $className = \Pages::class;

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $filters = ($this->className)::findFilters();
        $tables = ($this->className)::findTables();
        $fFilters = ['title','status','createdat'];
        $fTables = ['image','title','excerpt','authorname','createdat','slug','status'];
        if($fSetting = \FilterSetting::findFirstKey($this->cler)){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $this->view->searchForm = new SearchPagesForm();
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
                $itemsLang = \PagesLang::findFirst(['pageid = :id: AND langid = :langid:','bind' => ['id' => $page->id, 'langid' => $lang->id]]);
                if($itemsLang){
                    $formLang = new PagesLangForm($itemsLang, [$lang->id,$v]);
                    $formsLang[$lang->id] = $formLang;
                }else{
                    $formsLang[$lang->id] = new PagesLangForm(null, [$lang->id,$v]);
                }
            }
            $title = 'Chỉnh sửa';
        }else{
            $items = new \Pages();
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new PagesLangForm(null, [$lang->id,$v]);
            }
        }

        $form = new PagesForm($items);

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

    // =================================
    // API
    // =================================
    // Get data
    public function ajaxgetdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted($this->cler, 'index')) {
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
            '(SELECT dl.name FROM DeptsLang AS dl WHERE dl.deptid = p.deptid AND dl.langid = 1) AS deptname',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['p' => "Pages"])
        ->where("p.deleted = 0")
        ->leftJoin('User', 'u.id = p.author','u')
        ->leftJoin('PagesLang', 'pl.pageid = p.id AND pl.langid = 1','pl')
        ->leftJoin('Depts', 'd.id = p.deptid','d')
        ->orderBy('p.deptid ASC, p.id DESC');

        $data = $this->master::builderPermission($data,$perL,'p');
        $data = \FilterSetting::getDataOrder($this,$data,($this->className)::findFirst(),'p',['pl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,($this->className)::arrayFilter(),['p',['pl'=>['title']]]);

        $array_row = [
            'u' => $this->master::checkPermission($this->cler, 'update', 1)
        ];

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
            if(!$page = ($this->className)::findFirstIdPermission($id,$perL)){
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

        if(($this->className)::findFirst(["slug = :slug: AND id != :id:","bind" => ["slug" => $page->slug,'id'=> $id]])){
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
        \Logs::saveLogs($this, 3, "Xóa tạm trang ID: {$item->id}", ['table' => 'Pages','id' => $item->id]);
    }

    private function getJsCss(){
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/pages.js');
    }
}