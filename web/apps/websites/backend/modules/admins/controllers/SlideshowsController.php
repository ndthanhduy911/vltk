<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\SlideshowsForm;
use Backend\Modules\Admins\Forms\SlideshowsLangForm;
use Backend\Modules\Admins\Forms\SearchSlideshowsForm;

class SlideshowsController  extends \BackendController {

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $filters = \Slideshows::findFilters();
        $tables = \Slideshows::findTables();
        $fFilters = ['name','status','createdat'];
        $fTables = ['image','name','description','createdat','status'];
        if($fSetting = \FilterSetting::findFirstKey('slideshows')){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $title = "Banners";
        $this->getJsCss();
        $this->view->searchForm = new SearchSlideshowsForm();
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

        $perEdit = $this->master::checkPermissionDepted('slideshows', 'update',1);
        $perView = $this->master::checkPermissionDepted('slideshows', 'index');
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
        $slideshowsLang = [];
        $bannerContent = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$slideshows = \Slideshows::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }         
            foreach ($languages as $key => $lang) {
                $v = ($key == 0 ? true : false);
                $bannerLang = \SlideshowsLang::findFirst(['slideshowid = :id: AND langid = :langid:','bind' => ['id' => $slideshows->id, 'langid' => $lang->id]]);
                if($bannerLang){
                    $formLang = new SlideshowsLangForm($bannerLang, [$lang->id,$v]);
                    $slideshowsLang[$lang->id] = $bannerLang;
                    $formsLang[$lang->id] = $formLang;
                    $bannerContent[$lang->id] = $bannerLang->content;
                }else{
                    $formsLang[$lang->id] = new SlideshowsLangForm(null, [$lang->id,$v]);
                    $slideshowsLang[$lang->id] = new \SlideshowsLang();
                    $bannerContent[$lang->id] = '';
                }
            }
            $title = 'Chỉnh sửa';
            $slideshows->updatedat = date('Y-m-d H:i:s');
        }else{
            $slideshows = new \Slideshows();
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new SlideshowsLangForm(null, [$lang->id,$v]);
                $slideshowsLang[$lang->id] = new \SlideshowsLang();
                $bannerContent[$lang->id] = '';
            }
        }

        $formSlideshows = new SlideshowsForm($slideshows);

        $this->view->perEdit = $perEdit ? 1 : "";
        $this->view->perView = $perView ? 1 : "";
        $this->view->languages = $languages;
        $this->view->bannerContent = $bannerContent;
        $this->view->formsLang = $formsLang;
        $this->view->formSlideshows = $formSlideshows;
        $this->view->slideshows = $slideshows;
        $this->view->slideshowsLang = $slideshowsLang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->getJsCss();
    }

    // =================================
    // API
    // =================================
    // Get data
    public function ajaxgetdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('slideshows', 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $columns = [
            'b.id',
            'b.deptid',
            'b.image',
            'b.buttonlink',
            'b.status',
            'b.sort',
            'b.createdat',
            'bl.name',
            'bl.description',
            'd.slug dslug',
            '(SELECT dl.name FROM DeptsLang AS dl WHERE dl.deptid = b.deptid AND dl.langid = 1) AS deptname',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['b' => "Slideshows"])
        ->where("b.deleted = 0")
        ->leftJoin('SlideshowsLang', 'bl.slideshowid = b.id AND bl.langid = 1','bl')
        ->leftJoin('Depts', 'd.id = b.deptid','d')
        ->orderBy('b.deptid ASC, b.sort ASC, b.id ASC');

        $data = $this->master::builderPermission($data,$perL,'b');
        $data = \FilterSetting::getDataOrder($this,$data,\Slideshows::findFirst(),'b',['bl'=>'name']);
        $data = \FilterSetting::getDataFilter($this,$data,\Slideshows::arrayFilter(),['b',['bl'=>['name']]]);

        $array_row = [
            'u' => $this->master::checkPermission('slideshows', 'update', 1)
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
        if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('slideshows','update')){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        $languages = \Language::find(['status = 1']);
        $pName = $this->request->getPost('name',['string','trim']);
        $pDes = $this->request->getPost('description',['string','trim']);
        if($id){
            if(!$slideshows = \Slideshows::findFirstIdPermission($id,$perL)){
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
        $slideshows->buttonlink = $this->request->getPost('buttonlink',['trim','string']);

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
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('slideshows', 'delete')) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Slideshows::findPermission($perL,"*",['deleted = 0 AND id IN (' . $strIds . ')']);

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