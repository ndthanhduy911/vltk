<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\SlideshowsForm;
use Backend\Modules\Admins\Forms\SlideshowsLangForm;
use Backend\Modules\Admins\Forms\SearchSlideshowsForm;

class SlideshowsController  extends \BackendController {
    private $title = "Banners";

    private $cler = "slideshows";

    private $className = \Slideshows::class;

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $filters = ($this->className)::findFilters();
        $tables = ($this->className)::findTables();
        $fFilters = ['name','status','createdat'];
        $fTables = ['image','name','description','createdat','status'];
        if($fSetting = \FilterSetting::findFirstKey($this->cler)){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $this->view->searchForm = new SearchSlideshowsForm();
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
                $itemsLang = \SlideshowsLang::findFirst(['slideshowid = :id: AND langid = :langid:','bind' => ['id' => $items->id, 'langid' => $lang->id]]);
                if($itemsLang){
                    $formLang = new SlideshowsLangForm($itemsLang, [$lang->id,$v]);
                    $formsLang[$lang->id] = $formLang;
                }else{
                    $formsLang[$lang->id] = new SlideshowsLangForm(null, [$lang->id,$v]);
                }
            }
            $title = 'Chỉnh sửa';
            $items->updatedat = date('Y-m-d H:i:s');
        }else{
            $items = new \Slideshows();
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new SlideshowsLangForm(null, [$lang->id,$v]);
            }
        }

        $form = new SlideshowsForm($items);

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
            'b.id',
            'b.deptid',
            'b.image',
            'b.link',
            'b.status',
            'b.sort',
            'b.createdat',
            'bl.name',
            'bl.except',
            'd.slug dslug',
            '(SELECT dl.title FROM DeptsLang AS dl WHERE dl.deptid = b.deptid AND dl.langid = 1) AS deptname',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['b' => "Slideshows"])
        ->where("b.deleted = 0")
        ->leftJoin('SlideshowsLang', 'bl.slideshowid = b.id AND bl.langid = 1','bl')
        ->leftJoin('Depts', 'd.id = b.deptid','d')
        ->orderBy('b.deptid ASC, b.sort ASC, b.id ASC');

        $data = $this->master::builderPermission($data,$perL,'b');
        $data = \FilterSetting::getDataOrder($this,$data,($this->className)::findFirst(),'b',['bl'=>'name']);
        $data = \FilterSetting::getDataFilter($this,$data,($this->className)::arrayFilter(),['b',['bl'=>['name']]]);

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
        $pName = $this->request->getPost('name',['string','trim']);
        $pDes = $this->request->getPost('description',['string','trim']);
        if($id){
            if(!$slideshows = ($this->className)::findFirstIdPermission($id,$perL)){
                $data['error'] = ['Không tìm thấy banner'];
                $this->helper->responseJson($this, $data);
            }
            $slideshows->updatedat = date('Y-m-d H:i:s');
            $slideshows->updatedby = $userid;
        }else{
            $slideshows = new \Slideshows();
            $slideshows->deptid = $this->session->get('deptid');
            $slideshows->createdat = date('Y-m-d H:i:s');
            $slideshows->updatedat = $slideshows->createdat;
            $slideshows->createdby = $userid;
            $slideshows->updatedby = $userid;
        }
        $bannerLangs = [];

        foreach ($languages as $key => $lang) {
            if(!$id || !$bannerLang = \SlideshowsLang::findFirst(["slideshowid = :id: AND langid = :langid:",'bind' => ['id' => (int)$id,'langid' => $lang->id]])){
                $bannerLang = new \SlideshowsLang();
            }

            if($key == 0){
                $lId = $lang->id;
            }
            $bannerLang->name = !empty($pName[$lang->id]) ? $pName[$lang->id] : $pName[$lId];
            $bannerLang->description = !empty($pDes[$lang->id]) ? $pDes[$lang->id] : $pDes[$lId];
            $bannerLang->langid = $lang->id;
            array_push($bannerLangs,$bannerLang);
        }

        $slideshows->status = $this->request->getPost('status',['int']);
        $slideshows->image = $this->request->getPost('image',['trim','string']);
        $slideshows->sort = $this->request->getPost('sort',['int']);
        $slideshows->link = $this->request->getPost('link',['trim','string']);

        try {
            $this->db->begin();
            $slideshows->vdUpdate(true);
            if (!$slideshows->save()) {
                foreach ($slideshows->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            foreach ($bannerLangs as $bannerLang) {
                $bannerLang->slideshowid = $slideshows->id;
                $bannerLang->vdUpdate(true);
                if (!$bannerLang->save()) {
                    foreach ($bannerLang->getMessages() as $message) {
                        throw new \Exception($message->getMessage());
                    }
                }
            }
            $this->db->commit();
            $this->flashSession->success(($id ? 'Chỉnh sửa' : 'Thêm mới').' banner thành công');
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
        \Logs::saveLogs($this, 3, "Xóa tạm banners ID: {$item->id}", ['table' => 'Slideshows','id' => $item->id]);
    }

    private function getJsCss(){
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/slideshows.js');
    }
}