<?php
class AdminsCore extends \BackendController{
    public $title = NULL;

    public $cler = NULL;

    public $className = NULL;

    public $classNameLang = NULL;

    public $itemsForm = NULL;

    public $itemsLangFrom = NULL;

    public $searchForm = NULL;

    public $fTables = NULL;

    public $fFilters = NULL;

    public $jS = NULL;

    public $itemsid = NULL;

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $filters = ($this->className)::findFilters();
        $tables = ($this->className)::findTables();
        $fFilters = $this->fFilters;
        $fTables = $this->fTables;
        if($fSetting = \FilterSetting::findFirstKey($this->cler)){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $this->view->searchForm = new $this->searchForm();
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
                $itemsLang = ($this->classNameLang)::findFirst(["{$this->itemsid} = :id: AND langid = :langid:",'bind' => ['id' => $items->id, 'langid' => $lang->id]]);
                if($itemsLang){
                    $formLang = new $this->itemsLangFrom($itemsLang, [$lang->id,$v]);
                    $formsLang[$lang->id] = $formLang;
                }else{
                    $formsLang[$lang->id] = new $this->itemsLangFrom(null, [$lang->id,$v]);
                }
            }
            $title = 'Cập nhật';
        }else{
            $items = new \Posts();
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new $this->itemsLangFrom(null, [$lang->id,$v]);
            }
        }
        $items = $this->viewC($items);
        $form = new $this->itemsForm($items);

        $this->view->perEdit = $perEdit ? 1 : "";
        $this->view->perView = $perView ? 1 : "";
        $this->view->languages = $languages;
        $this->view->formsLang = $formsLang;
        $this->view->form = $form;
        $this->view->items = $items;
        $this->view->title = $title;
        $this->view->btitle = $this->title;
        $this->view->cler = $this->cler;
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/templates/views.js');
        return $this->view->pick('templates/views');
    }

    // ===============================
    // API
    // ===============================
    public function ajaxgetdataAction(){
        $this->helper->responseJson($this,[]);
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
        if($id){
            if(!$items = ($this->className)::findFirstIdPermission($id,$perL)){
                $data['error'] = ["Không tìm thấy {}"];
                $this->helper->responseJson($this, $data);
            }
            $items->updatedat = date('Y-m-d H:i:s');
            $items->updatedby = $userid;
        }else{
            $items = new $this->className();
            $items->deptid = $this->session->get('deptid');
            $items->createdat = date('Y-m-d H:i:s');
            $items->updatedat = $items->createdat;
            $items->createdby = $userid;
            $items->updatedby = $userid;
        }
        $itemsLangs = [];

        $itemsArr = $this->updateC($items,$itemsLangs);
        $items = $itemsArr[0];
        $itemsLangs = $itemsArr[1];

        try {
            $this->db->begin();
            $items->vdUpdate(true);
            if (!$items->save()) {
                foreach ($items->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            foreach ($itemsLangs as $itemsLang) {
                $itemsLang->postid = $items->id;
                $itemsLang->vdUpdate(true);
                if (!$itemsLang->save()) {
                    foreach ($itemsLang->getMessages() as $message) {
                        throw new \Exception($message->getMessage());
                    }
                }
            }
            $this->db->commit();
            \Logs::saveLogs($this, ($id ? 2: 1), ($id ? 'Cập nhật ' : 'Thêm mới ').mb_strtolower($this->title,'UTF-8')." ID: {$items->id}", ['table' => $this->className,'id' => $items->id]);
            $this->flashSession->success(($id ? 'Cập nhật ' : 'Thêm mới ')." thành công");
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
    public function viewC($items){
        return $items;
    }

    public function updateC($items,$itemsLangs){
        return [$items,$itemsLangs];
    }

    private function deleteOne($item){
        $userid = $this->session->get('userid');
        $item->updatedat = date('Y-m-d H:i:s');
        $item->updatedby = $userid;
        $item->deleted = 1;
        if (!$item->save()) {
            foreach ($item->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        \Logs::saveLogs($this, 3, "Xóa tạm ".mb_strtolower($this->title,'UTF-8')." ID: {$item->id}", ['table' => $this->className,'id' => $item->id]);
    }

    private function getJsCss(){
        $this->assets->addJs($this->jS);
    }
}
