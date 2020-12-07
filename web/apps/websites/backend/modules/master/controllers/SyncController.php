<?php
namespace Backend\Modules\Master\Controllers;
use Backend\Modules\Master\Forms\SyncForm;
use Backend\Modules\Master\Forms\SearchSyncForm;
use Backend\Modules\Master\Forms\SyncDetailForm;
use Library\Forms\SearchDetailForm;
use Library\Helper\Helper;

class SyncController extends \BackendController
{
    // ===============================
    // PAGE
    // ===============================
    public function indexAction(){
        if($this->request->get('singlePage','int') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }
        $title = "Nhập dữ liệu ban đầu";
        $filters = \Sync::findFilters();
        $tables = \Sync::findTables();
        $fFilters = ['year','deptid','typeid'];
        $fTables = ['year','deptname','typename','createdat','updatedat','quantity'];
        if($fSetting = \FilterSetting::findFirstKey('sync')){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);

        $this->getJsCss();
        $this->view->title = $title;
        $this->view->filters = $filters;
        $this->view->tables = $tables;
        $this->view->fFilters = $fFilters;
        $this->view->fTables = $fTables;
        $this->view->form_search = new SearchSyncForm();
        $this->view->syncForm = new SyncForm();
    }

    public function viewAction($id = 0){
        $perAdd = $this->master::checkPermissionDepted('sync', 'update');
        $perEdit = $this->master::checkPermissionDepted('sync', 'update',1);
        $perView = $this->master::checkPermissionDepted('sync', 'index');
        $perL = $perView ? $perView :($perAdd ? $perAdd : ($perEdit? $perEdit :false));
        if(!$perL){
            require ERROR_FILE; die;
        }

        if($this->request->get('singlePage','int') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }
        $isAcceptChangeDept = true;
        if(!$sync = \Sync::findFirstIdPermission($id,$perL)){
            $this->flashSession->error('Không tìm thấy dữ liệu');
            return $this->response->redirect(WEB_ADMIN_URI.'/sync');
        }
        $title = "Chi tiết";
        $type = $sync->status ? "lock" :"edit";
        $sync->syncdate = $this->helper->datetimeVn($sync->syncdate);
        $sync->rpdate = $this->helper->dateVn($sync->rpdate,'d/m/Y');
        $form = new SyncForm($sync);
        $isAcceptChangeDept = $this->isAcceptChangeDept($id);

        $filters = \SyncDetail::findFilters();
        $tables = \SyncDetail::findTables();
        $fFilters = ['code','name'];
        $fTables = ['aunumber','audate','name','madename','usedyear','code','tagcode','costs','disfactor','discosts','defactor','decosts','ddcosts','accumulated','renumber','redate','rereason','restcosts'];
        if($fSetting = \FilterSetting::findFirstKey('syncdetail')){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $this->view->title = $title;
        $this->view->type = $type;
        $this->view->form = $form;
        $this->view->formDetail = new SyncDetailForm();
        $this->view->formSDetail = new SearchDetailForm();
        $this->view->sync = $sync;
        $this->view->isAcceptChangeDept = $isAcceptChangeDept ? null : true;
        $this->view->perAdd = $perAdd ? 1 : "";
        $this->view->perEdit = $perEdit ? 1 : "";
        $this->view->perView = $perView ? 1 : "";
        $this->view->filters = $filters;
        $this->view->tables = $tables;
        $this->view->fFilters = $fFilters;
        $this->view->fTables = $fTables;
        $this->view->groupField = \FieldGroup::findDataArrayKey('sync');
        $this->getJsCss();
    }

    // ===============================
    // API
    // ===============================
    public function getdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('sync', 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        
        $columns = [
            'sy.id',
            'sy.year',
            'sy.typeid',
            // 'sy.typename',
            'sy.deptid',
            'sy.deptname',
            'sy.createdat',
            'sy.updatedat',
            'sy.status',
            '(SELECT COUNT(syd.id) FROM SyncDetail as syd WHERE syd.deleted = 0 AND syd.syncid = sy.id) as quantity'
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['sy' => 'Sync'])
        ->where("sy.deleted = 0")
        ->orderBy("sy.id DESC");

        $data = $this->master::builderPermission($data,$perL,'sy');

        //Filter
        $data = \FilterSetting::getDataFilter($this,$data,\Sync::arrayFilter(),'sy');

        $array_row = [
            'u' => $this->master::checkPermission('sync', 'update', 1),
            'd' => $this->master::checkPermission('sync', 'delete'),
            'v' => true
        ];

        $dataShow = $this->ssp->dataOutput($this, $data,"", $array_row);
        if(!empty($dataShow['data'])){
            foreach ($dataShow['data'] as $key => $at) {
                $dataShow['data'][$key]['typename'] = \AssetType::getFullName($at['typeid']);
            }
        }
        $this->helper->responseJson($this, $dataShow);
    }

    public function getdatadetailAction($syId = 0){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('sync', ['update','index'],[0,1])) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        
        $columns = [
            'syd.id',
            'syd.syncid',
            'syd.type',
            'syd.typeid',
            'syd.typename',
            'syd.deptid',
            'syd.deptname',
            'syd.year',
            'syd.aunumber',
            'syd.audate',
            'syd.name',
            'syd.specifications',
            'syd.typename',
            'syd.madeid',
            'syd.madename',
            'syd.usedyear',
            'syd.code',
            'syd.tagcode',
            'syd.costs',
            'syd.disfactor',
            'syd.discosts',
            'syd.defactor',
            'syd.decosts',
            'syd.ddcosts',
            'syd.accumulated',
            'syd.renumber',
            'syd.redate',
            'syd.rereason',
            'syd.restcosts',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['syd' => 'SyncDetail'])
        ->where("syd.deleted = 0 AND syncid =:syId:",['syId' => $syId])
        ->orderBy("syd.id DESC");

        $data = $this->master::builderPermission($data,$perL,'syd');

        //Filter
        $data = \FilterSetting::getDataFilter($this,$data,\SyncDetail::arrayFilter(),'syd');

        $array_row = [
            'u' => $this->master::checkPermission('sync', 'update', 1),
            'd' => $this->master::checkPermission('sync', 'delete'),
            'v' => true,
        ];

        $dataShow = $this->ssp->dataOutput($this, $data,'', $array_row);
        $this->helper->responseJson($this, $dataShow);
    }

    public function getsingledetailAction($id = null){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('sync', ['update','index'],[0,1])) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        if (!$data = \SyncDetail::findFirstIdPermission($id,$perL,"*")) {
            $this->helper->responseJson($this, ['error' => ['Không tìm thấy dữ liệu']]);
        }
        $data = $data->toArray();
        $this->helper->responseJson($this, $data);
    }

    //Update data
    public function addAction(){
        $this->view->disable();
        if (!$this->security->checkToken()) {
            $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            $data['error'] = ['Token không chính xác'];
            $this->helper->responseJson($this, $data);
        }
        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
        if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('sync','update',[0,1])){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $deptId = $this->request->getPost('deptid','int');
        $deptId = $deptId ? $deptId : 1;
        if(!$dept = \Depts::findFirstIdNoDelete($deptId)){
            $data['error'] = ['Đơn vị bộ phận không đúng'];
            $this->helper->responseJson($this, $data);
        }

        $typeId = $this->request->getPost('typeid',['trim','int']);
        if(!$aType = \AssetType::findFirstIdNoDelete($typeId,"*",["type = 1"])){
            $data['error'] = ['Loại tài sản không tồn tại'];
            $this->helper->responseJson($this, $data);
        }
        try {
            $this->db->begin();
            $importExcel = new \Library\ImportExcel\ImportExcelSync2('importfile', [
                'size_max' => 5,
                'is_check_password' => false,
                'file_password' => EXCEL_PASSWORD
            ]);
            $resValidation = $importExcel->validation();
            if ($resValidation !== true) {
                throw new \Exception($resValidation);
            }
            $importExcel->run(['dept' => $dept, 'aType' => $aType, 'perL' => $perL]);
            if (!empty($importExcel->error)) {
                throw new \Exception($importExcel->error);
            }
            $this->db->commit();
            $this->helper->responseJson($this, $data);
        } catch (\Exception $e) {
            $this->db->rollback();
            $data['error'] = [$e->getMessage()];
            $this->helper->responseJson($this, $data);
        }
        
    }
    
    public function updateAction($id = 0){
        $this->view->disable();
        if (!$this->security->checkToken()) {
            $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            $data['error'] = ['Token không chính xác'];
            $this->helper->responseJson($this, $data);
        }
        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
        if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('sync','update',[0,1])){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $isAcceptChangeDept = true;
        $userid = $this->session->get('userid');
        $deptId = $this->request->getPost('deptid','int');
        if($id){
            if(!$sync = \Sync::findFirstIdPermission($id,$perL)){
                $data['error'] = ['Không tìm thấy dữ liệu'];
                $this->helper->responseJson($this, $data);
            }
            $isAcceptChangeDept = $this->isAcceptChangeDept($id);
            $sync->updatedat = date('Y-m-d H:i:s');
            $sync->updatedby = $userid;
            $deptId = $deptId ? $deptId : $sync->deptid;
            $syncOld = $sync->toArray();
            $this->isAllowChange($sync);
            if($deptId != $syncOld['deptid']){
                if(!$isAcceptChangeDept){
                    $data['error'] = ['Không được phép thay đổi bộ môn khi đã có tài sản'];
                    $this->helper->responseJson($this, $data);
                }
            }
        }else{
            $sync =  new \Sync();
            $sync->reportfile = NULL;
            $sync->createdat = date('Y-m-d H:i:s');
            $sync->updatedat = $sync->createdat;
            $sync->createdby = $userid;
            $sync->updatedby = $userid;
            $sync->deleted = 0;
        }
        $sync->number = $this->request->getPost('number',['string', 'trim']);
        $sync->rpdate = $this->helper->dateMysql($this->request->getPost('rpdate', ['string', 'trim']));
        $sync->syncdate = $this->helper->datetimeMysql($this->request->getPost('syncdate', ['string', 'trim']));
        $sync->reason = $this->request->getPost('reason',['string', 'trim']);
        $sync->note = $this->request->getPost('note',['string', 'trim']);
        $sync->deptid = $deptId;
        $sync->status = 0;
        //ban kiem ke 
        // one
        $sync->commissary1 = $this->request->getPost('commissary1',['string', 'trim']);
        $sync->coduty1 = $this->request->getPost('coduty1',['string', 'trim']);
        $sync->coinstead1 = $this->request->getPost('coinstead1',['int', 'trim']);
        // two
        $sync->commissary2 = $this->request->getPost('commissary2',['string', 'trim']);
        $sync->coduty2 = $this->request->getPost('coduty2',['string', 'trim']);
        $sync->coinstead2 = $this->request->getPost('coinstead2',['int', 'trim']);
        // three
        $sync->commissary3 = $this->request->getPost('commissary3',['string', 'trim']);
        $sync->coduty3 = $this->request->getPost('coduty3',['string', 'trim']);
        $sync->coinstead3 = $this->request->getPost('coinstead3',['int', 'trim']);
        // four
        $sync->commissary4 = $this->request->getPost('commissary4',['string', 'trim']);
        $sync->coduty4 = $this->request->getPost('coduty4',['string', 'trim']);
        $sync->coinstead4 = $this->request->getPost('coinstead4',['int', 'trim']);

        if(!$depts = \Depts::findFirstIdPermission($sync->deptid,$perL,'id,name')){
            $data['error'] = ['Bộ môn không tồn tại'];
            $this->helper->responseJson($this, $data);
        }
        $sync->deptname = $depts->name;

        $checkReportfile = $this->helper->uploadReportFile('reportfile', $sync->reportfile, 'sync_reportfile');
        $sync->reportfile = $checkReportfile['filename'];
        if (!empty($checkReportfile['error'])) {
            $data['error'] = [$checkReportfile['error']];
            $this->helper->responseJson($this, $data);
        }
        
        if (!$sync->save()) {
            $error = [];
            foreach ($sync->getMessages() as $message) {
                array_push($error, $message->getMessage());
            }
            $data['error'] = $error;
            $this->helper->responseJson($this, $data);
        }
        
        $this->flashSession->success(($id ? 'Cập nhật' : 'Thêm mới').' dữ liệu thành công');
        $data['data'] = $sync->toArray();
        $this->helper->responseJson($this, $data);
        
    }

    public function updatedetailAction($id = 0){
        if (!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('sync','update',[0,1])) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        if (!$this->security->checkToken()) {
            $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            $data['error'] = ['Token không chính xác'];
            $this->helper->responseJson($this, $data);
        }

        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
        $userid = $this->session->get('userid');
        $syncId = $this->request->getPost('syncid', 'int');
        if(!$sync = \Sync::findFirstIdPermission($syncId,$perL)){
            $data['error'] = ['Phiếu dữ liệu không tồn tại'];
            $this->helper->responseJson($this, $data);
        }

        $this->isAllowChange($sync);
        $madeid = $this->request->getPost('madeid', ['int', 'trim']);
        if(!$mades = \AssetMadeIn::findFirstId($madeid,"id,name")){
            $data['error'] = ['Nước sản xuất không tồn tại'];
            $this->helper->responseJson($this, $data);
        }

        $detail = \SyncDetail::findFirstIdPermission($id,$perL,"*",["syncid = :syncId:",["syncId" => $syncId]]);
        if(!$detail){
            $data['error'] = ['Không tìm thấy dữ liêụ'];
            $this->helper->responseJson($this, $data);
        }
        $detail->updatedat = date('Y-m-d H:i:s');
        $detail->updatedby = $userid;
        
        $costs = (float)str_replace(",", "", $this->request->getPost('coss$costs',['string', 'trim']));
        $disfactor = (float)str_replace(",", "", $this->request->getPost('disfactor',['string', 'trim']));
        $discosts = (float)str_replace(",", "", $this->request->getPost('discosts',['string', 'trim']));
        $defactor = (float)str_replace(",", "", $this->request->getPost('defactor',['string', 'trim']));
        $decosts = (float)str_replace(",", "", $this->request->getPost('decosts',['string', 'trim']));
        $accumulated = (float)str_replace(",", "", $this->request->getPost('accumulated',['string', 'trim']));
        $restcosts = (float)str_replace(",", "", $this->request->getPost('restcosts',['string', 'trim']));

        $detail->aunumber = $this->request->getPost('aunumber', ['string', 'trim']);
        $detail->audate = $this->helper->dateMysql($this->request->getPost('audate', ['string', 'trim']));
        $detail->name = $this->request->getPost('name', ['string', 'trim']);
        $detail->specifications = $this->request->getPost('specifications', ['string', 'trim']);
        $detail->madeid = $mades ? $mades->id : NULL;
        $detail->madename = $mades ? $mades->name : NULL;
        $detail->usedyear = $this->request->getPost('usedyear', ['string', 'trim']);
        $detail->tagcode = NULL;
        $detail->costs = $costs ? $costs : 0;;
        $detail->disfactor = $disfactor ? $disfactor : 0;
        $detail->discosts = $discosts ? $discosts : 0;
        $detail->defactor = $defactor ? $defactor : 0;
        $detail->decosts = $decosts ? $decosts : 0;
        $detail->ddcosts = $detail->decosts + $detail->discosts;
        $detail->accumulated = $accumulated ? $accumulated : 0;
        $detail->renumber = $this->request->getPost('renumber', ['string', 'trim']);
        $detail->redate = $this->helper->dateMysql($this->request->getPost('redate', ['string', 'trim']));
        $detail->rereason = $this->request->getPost('rereason', ['string', 'trim']);
        $detail->restcosts = $restcosts ? $restcosts : 0;

        try {
            $this->db->begin();
            $detail->vdUpdate(true);
            if (!$detail->save()) {
                foreach ($detail->getMessages() as $message) {
                    $data['error'] = [$message->getMessage()];
                    $this->helper->responseJson($this, $data);
                }
            }
            $this->db->commit();
        } catch (\Throwable $e) {
            $this->db->rollback();
            $data['error'] = [$e->getMessage()];
        }
        $this->helper->responseJson($this, $data);
    }

    public function deleteAction(){
        if (!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('sync','delete')) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Sync::findPermission($perL,"*",['id IN (' . $strIds . ')']);

        try {
            $this->db->begin();
            foreach ($data as $key => $item) {
                $this->isAllowChange($item);
                $this->deleteOne($item,$perL);
            }
            $this->db->commit();
        } catch (\Throwable $e) {
            $this->db->rollback();
            $this->helper->responseJson($this, ["error" => [$e->getMessage()]]);
        }
        $this->helper->responseJson($this, ["result" => ["Xóa thành công"]]);

    }

    public function deletedetailAction($syncId = 0){
        if (!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('sync','delete')) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }
        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }
        
        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        if(!$sync = \Sync::findFirstIdPermission($syncId,$perL)){
            $this->helper->responseJson($this, ["error" => ["Nhập dữ liệu ban đầu không hợp lệ"]]);
        }
        $this->isAllowChange($sync);
        $data = \SyncDetail::findPermission($perL,"*",['syncid = :syncId: AND id IN (' . $strIds . ')',['syncId' => $syncId]]);
        try {
            $this->db->begin();
            foreach ($data as $item) {
                $this->deleteOneDetail($item);
            }
            $this->db->commit();
        } catch (\Throwable $e) {
            $this->db->rollback();
            $this->helper->responseJson($this, ["error" => [$e->getMessage()]]);
        }

        $this->helper->responseJson($this, ["result" => ["Xóa thành công"]]);
    }

    public function lockAction(){
        $this->view->disable();
        try {
            if(!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('sync','lock','1')) {
                throw new \Exception("Truy cập không được phép");
            }
            $this->db->begin();
            $syncs = \Sync::findPermission($perL,"*","","year ASC");
            foreach ($syncs as $sync) {
                $this->isAllowChange($sync);
                if($this->isAcceptChangeDept($sync->id)){
                    throw new \Exception("Nhập dữ liệu ban đầu số: {$sync->number} không có tài sản");
                }
                $sync->status = 1;
                if (!$sync->save()) {
                    $this->db->rollback();
                    foreach ($sync->getMessages() as $message) {
                        throw new \Exception($message->getMessage());
                    }
                }
                $dept = \Depts::findFirstIdPermission($sync->deptid,$perL);
                $listSyncDetail = \SyncDetail::findPermission($perL,"*",['syncid = :syncid:',['syncid' => $sync->id]]);
                foreach ($listSyncDetail as $detail) {
                    $this->lockOneDetail($detail,$sync,$dept,$perL);
                }
            }
            $this->db->commit();
            $this->helper->responseJson($this, ["result" => ['Khóa phiếu nhập thành công']]);
        } catch (\Throwable $e) {
            $this->db->rollback();
            $this->helper->responseJson($this, ["error" => [$e->getMessage()]]);
        }
    }

    // ===============================
    // FUNCTION
    // ===============================

    private function getJsCss(){
        // And some local JavaScript resources
        $this->assets->addJs(WEB_URL.'/assets/backend/js/modules/master/sync.js?v='.VS_SCRIPT);
    }

    private function deleteOne($sync,$perL){
        if (!$sync->delete()) {
            foreach ($sync->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        $data = \SyncDetail::findPermission($perL,"*",[
            'syncid = :syncId:',
            ['syncId' => $sync->id]
        ]);
        foreach ($data as $item) {
            $this->deleteOneDetail($item);
        }
    }

    private function deleteOneDetail($detail){
        if (!$detail->delete()) {
            foreach ($detail->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
    }

    private function isAcceptChangeDept($iId) {
        return \SyncDetail::count(["syncid = :iId: AND deleted = 0", 'bind' => ['iId' => $iId]]) ? false : true;
    }

    private function isAllowChange($sync){
        if ($sync->status == 1) {
            $data['error'] = ['Phiếu dữ liệu đã bị khóa'];
            $this->helper->responseJson($this, $data);
        }
    }

    private function lockOneDetail($detail,$sync,$dept,$perL){
        $deAsset = false;
        try {
            $year = empty($detail->year) ? $sync->year : $detail->year;
            // 1. Nhap,xuat,ghi tang
            if($asset = \Asset::findFirstCode($detail->code)){
                if($asset->reductionid){
                    throw new \Exception("Tài sản đã được ghi giảm trước đó");
                }
                if($asset->cstatus < 1){
                    throw new \Exception("Tài sản chưa được nhập");
                }
            }else{
                //Nhap
                $checkIn = $this->createCheckIn($dept,$year,$perL);
                $asset = new \Asset();
                $asset->name = $detail->name;
                $asset->code = $detail->code;
                $asset->specifications = $detail->specifications;
                $asset->costs = $detail->costs;
                $asset->accumulated = $detail->accumulated;
                $asset->restcosts = $asset->costs - $asset->accumulated;
                $asset->type = $detail->type;
                $asset->typeid = $detail->typeid;
                // $asset->typecode = $aType->code;
                $asset->typename = $detail->typename;
                $asset->madeid = $detail->id;
                $asset->madename = $detail->madename;
                $asset->crstatus = 1;
                $asset = $this->createCIDetail($asset,$dept,$checkIn,$perL);
                //Xuat
                $checkOut = $this->createCheckOut($dept,$year);
                $asset = $this->createCODetail($asset,$checkOut);
                //Ghi tang
                $asset->aunumber = $detail->aunumber;
                $asset->audate = $detail->audate;
                $asset = $this->createUpAsset($asset);
            }
            
            // 2. Khau hao, hao mon
            if(($detail->disfactor && $detail->discosts) || ($detail->defactor && $detail->decosts)){
                if(!\DeAssetDetail::findFirst(['code = :code: AND dedate >= :dedate:','bind' => ["dedate" => "{$year}-12-31",'code' => $asset->code]])){
                    if(!$deAsset){
                        $deAsset = $this->createDeAsset($dept,$year);
                    }
                    $dadetail = new \DeAssetDetail();

                    $dadetail->isdis = 0;
                    $dadetail->disdate = $year."-12-31";
                    $dadetail->disfactor = 0;
                    $dadetail->discosts = 0;
                    if($detail->disfactor && $detail->discosts){
                        $dadetail->isdis = 1;
                        $dadetail->disfactor = $detail->disfactor;
                        $dadetail->discosts = $detail->discosts;
                    }

                    $dadetail->isde = 0;
                    $dadetail->dedate = $year."-12-31";
                    $dadetail->typefactor = 0;
                    $dadetail->decosts = 0;
                    if($detail->defactor && $detail->decosts){
                        $dadetail->isde = 1;
                        $dadetail->typefactor = $detail->defactor;
                        $dadetail->decosts = $detail->decosts;
                    }

                    $dadetail->accumulated = $detail->accumulated ? $detail->accumulated : 0;
                    $this->createDADetail($deAsset,$dadetail,$asset);
                }
            }

            // 3.  Ghi giam
            if($detail->renumber && $detail->redate){
                $reduction = $this->createReduction($detail->renumber,$detail->redate,$dept,$asset,$detail->rereason);
                $asset = $this->createReDetail($reduction,$detail->restcosts,$asset);
            }
        } catch (\Throwable $e) {
            throw new \Exception($e->getMessage() . " - Tại dòng {$readFromRow}");
        }
    }

    // Lock function
    private function createCheckIn($dept,$year,$perL){
        $number = 'INPUT'.$year;
        if($checkIn = \CheckIn::findFirst(['number = :number: AND deleted = 0','bind'=> ['number' => $number]])){
            return $checkIn;
        }
        $checkIn = new \CheckIn();
        $checkIn->number = $number;
        $checkIn->rpnumber = Helper::createNumber(\CheckIn::class,'rpnumber','NK');
        $checkIn->checkindate = $year.'-01-01';
        $checkIn->rpdate = $year.'-01-01';
        $checkIn->reason = "Nhập dữ liệu ban dầu năm {$year}";
        $checkIn->deptid = $dept->id;//Kiem tra lai
        $checkIn->deptname = $dept->name;//Kiem tra lai
        $checkIn->description = "Nhập dữ liệu ban dầu năm {$year}";
        $checkIn->status = 1;
        $checkIn->createdby = $_SESSION['userid'];
        $checkIn->createdat = date('Y-m-d H:i:s');
        $checkIn->updatedby = $checkIn->createdby;
        $checkIn->updatedat = $checkIn->createdat;
        $checkIn->deleted = 0;

        // Mark params form
        $checkIn->mark = $this->helper->markPercentForm(\CheckIn::markCheckIn());
        $checkIn = $checkIn->bfSave($perL,true);
        if (!$checkIn->vdUpdate()) {
            foreach ($checkIn->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        if (!$checkIn->save()) {
            foreach ($checkIn->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        return $checkIn;
    }

    private function createCIDetail($asset,$dept,$checkIn){
        $assetOld = $asset->toArray();
        $asset->deptid = $dept->id;
        $asset->dcode = $dept->dcode;
        $asset->deptname = $dept->name;
        $asset->checkinid = $checkIn->id;
        $asset->deptaddress = $dept->address;
        $asset->deptslat = $dept->lat;
        $asset->deptslng = $dept->lng;
        $asset->checkindate = $checkIn->checkindate; 
        $asset->aplieddate = $checkIn->checkindate;
        $asset->cinumber = $checkIn->number;

        $asset->createdby = $_SESSION['userid'];
        $asset->createdat = date('Y-m-d H:i:s');
        $asset->updatedby = $asset->createdby;
        $asset->updatedat = $asset->createdat;
        $asset->cstatus = 2;
        $asset->deleted = 0;
        try {
            $asset->checkApliedDate($assetOld['aplieddate']);
            $asset->isValiCosts();
            $asset->vdUpdate(true);
        } catch (\Throwable $e) {
            throw new \Exception($e->getMessage());
        }
        if(!$asset->save()){
            foreach ($asset->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }

        $checkType = \CheckType::plusCheckIn($asset->typeid, $asset->deptid);
        if ($checkType !== true) {
            throw new \Exception($checkType);
        }
        
        \AssetLog::saveLog(1, $asset->toArray());
        return $asset;
    }

    private function createCheckOut($dept,$year){
        $number = 'OUTPUT'.$year;
        if($checkOut = \CheckOut::findFirst(['number = :number: AND deleted = 0','bind'=> ['number' => $number]])){
            return $checkOut;
        }
        $checkOut = new \CheckOut();
        $checkOut->number = $number;
        $checkOut->rpnumber = Helper::createNumber(\CheckOut::class,'rpnumber','XK');
        $checkOut->reportfile = NULL;
        $checkOut->deptid = $dept->id;
        $checkOut->deptname = $dept->name;
        $checkOut->checkoutdate = $year.'-01-01';
        $checkOut->rpdate = $year.'-01-01';
        $checkOut->reason = "Xuất tài sản sử dụng lần đầu năm ".$year;
        $checkOut->description = "Xuất tài sản sử dụng lần đầu năm ".$year;
        $checkOut->deptout = $dept->id;
        $checkOut->deptoutname = $dept->name;

        $checkOut->createdat = date('Y-m-d H:i:s');
        $checkOut->updatedat = $checkOut->createdat;
        $checkOut->createdby = $_SESSION['userid'];
        $checkOut->updatedby = $checkOut->createdby;
        $checkOut->deleted = 0;
        $checkOut->status = 1;

        if (!$checkOut->vdUpdate()) {
            foreach ($checkOut->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }

        if (!$checkOut->save()) {
            foreach ($checkOut->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        return $checkOut;
    }

    private function createCODetail($asset,$checkOut){
        $assetOld = $asset->toArray();
        $asset->checkoutid = $checkOut->id;
        $asset->checkoutdate = $checkOut->checkoutdate;
        $asset->aplieddate = $checkOut->checkoutdate;
        $asset->conumber = $checkOut->number;
        $asset->cstatus = 4;
        try {
            $asset->checkApliedDate($assetOld['aplieddate']);
            $asset->isValiCosts();
        } catch (\Throwable $e) {
            throw new \Exception($e->getMessage());
        }
        if(!$asset->save()){
            foreach ($asset->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }

        $checkType = \CheckType::plusCheckOut($asset->typeid, $asset->deptid);
        if ($checkType !== true) {
            throw new \Exception($checkType);
        }
        \AssetLog::saveLog(2, $asset->toArray());
        return $asset;
    }

    private function createUpAsset($asset){
        $asset->isup = 1;
        if(!$asset->vdUpdate()){
            foreach ($asset->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        if(!$asset->save()){
            foreach ($asset->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        try {
            $asset->isValiCosts();
            \AssetLog::saveLog(6, $asset->toArray());
        } catch (\Throwable $e) {
            throw new \Exception($e->getMessage());
        }
        return $asset;
    }

    private function createDeAsset($dept,$year){
        if($deAsset = \DeAsset::findFirst(['deleted = 0  AND isbegin = 1 AND deptid =:did: AND YEAR(deassetdate) = :year:','bind' => ['did' => $dept->id, 'year' => $year]])){
            return $deAsset;
        }
        $userid = $_SESSION['userid'];
        $number = Helper::createNumber(\DeAsset::class,'number','KH');
        $deAsset =  new \DeAsset();
        $deAsset->reportfile = NULL;
        $deAsset->createdat = date('Y-m-d H:i:s');
        $deAsset->updatedat = $deAsset->createdat;
        $deAsset->createdby = $userid;
        $deAsset->updatedby = $userid;
        $deAsset->deleted = 0;
        $deAsset->isbegin = 1;

        $deAsset->number = $number;
        $deAsset->deptid = $dept->id;
        $deAsset->deptname = $dept->name;
        $deAsset->deassetdate = $year.'-12-31';
        $deAsset->rpdate = $year.'-12-31';
        $deAsset->reason = "Nhập khấu hao, hao mòn lần đầu năm {$year}";
        $deAsset->note = NULL;
        $deAsset->status = 1;

        if (!$deAsset->vdUpdate()) {
            foreach ($deAsset->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }

        if (!$deAsset->save()) {
            foreach ($deAsset->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        return $deAsset;
    }

    private function createDADetail($deAsset,$detail,$asset){
        // throw new \Exception("Mã tài sản đã tồn tại trong chứng từ");
        if(\DeAssetDetail::findFirst(["deassetid = {$deAsset->id} AND code = :code:",'bind' => ['code' => $asset->code]])){
            throw new \Exception("Mã tài sản đã tồn tại trong chứng từ");
        }

        $userid = $_SESSION['userid'];
        $detail->code = $asset->code;
        $detail->type = $asset->type;
        $detail->name = $asset->name;
        $detail->deptid = $deAsset->deptid;
        $detail->deptname = $deAsset->deptname;
        $detail->createdat = date('Y-m-d H:i:s');
        $detail->updatedat = $detail->createdat;
        $detail->createdby = $userid;
        $detail->updatedby = $userid;
        $detail->deleted = 0;
        $detail->deassetid = $deAsset->id;
        $detail->costs = $asset->costs;
        $detail->status = 1;

        if (!$detail->vdUpdate()) {
            foreach ($detail->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }

        if (!$detail->save()) {
            foreach ($detail->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        
        $asset->isde = $detail->isde;
        $asset->isdis = $detail->isdis;
        $asset->detype = 1;
        $asset->distype = 1;
        $assetOld = $asset->toArray();
        $asset->aplieddate = $deAsset->deassetdate;
        $asset->deadid = $detail->id;
        $asset->adnumber = $deAsset->number;
        $asset->addate = $deAsset->rpdate;
        $asset->disdate = $detail->disdate;
        $asset->disfactor = $detail->disfactor;
        $asset->dedate = $detail->dedate;
        $asset->typefactor = $detail->typefactor;
        $asset->accumulated = $detail->accumulated;
        $asset->restcosts = $asset->costs - $asset->accumulated;

        try {
            $asset->checkApliedDate($assetOld['aplieddate']);
            $asset->isValiCosts();
        } catch (\Throwable $e) {
            throw new \Exception($e->getMessage());
        }
        if (!$asset->vdUpdate()) {
            foreach ($asset->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        if (!$asset->save()) {
            foreach ($asset->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }

        $data = $asset->toArray();
        \AssetLog::saveLog(8, $data);
        return $detail;
    }

    private function createReduction($reNum,$reDate,$dept,$asset,$reReason){
        if($asset->reductionid){
            throw new \Exception("Tài sản đã được ghi giảm trước đó");
        }
        if(!$reduction = \Reduction::findFirst(['number = :number: AND deleted = 0','bind'=> ['number' => $reNum]])){
            $reduction = new \Reduction();
            $reduction->number = $reNum;
            $reduction->redate = $reDate;
            $reduction->retype = 5;
            $reduction->reason = $reReason;
            $reduction->deptid = $dept->id;//Kiem tra lai
            $reduction->deptname = $dept->name;//Kiem tra lai
            $reduction->status = 1;
            $reduction->createdby = $_SESSION['userid'];
            $reduction->createdat = date('Y-m-d H:i:s');
            $reduction->updatedby = $reduction->createdby;
            $reduction->updatedat = $reduction->createdat;
            $reduction->deleted = 0;
            if (!$reduction->vdUpdate()) {
                foreach ($reduction->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            if (!$reduction->save()) {
                foreach ($reduction->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
        }
        return $reduction;
    }

    private function createReDetail($reduction,$restcosts,$asset){

        $detail = new \ReductionDetail();
        $detail->createdat = date('Y-m-d H:i:s');
        $detail->updatedat = $detail->createdat;
        $detail->createdby = $_SESSION['userid'];
        $detail->updatedby = $_SESSION['userid'];
        $detail->deleted = 0;
        $detail->reductionid = $reduction->id;
        $detail->code = $asset->code;
        $detail->deptid = $reduction->deptid;
        $detail->retype = $reduction->retype;
        $detail->deptname = $reduction->deptname;
        $detail->reason = $reduction->reason;

        $detail->decosts = $asset->costs - $restcosts;
        $detail->restcosts = $restcosts;
        $detail->expenses = 0;
        $detail->evictioncosts = 0;
        $detail->status = 1;
        if (!$detail->vdUpdate()) {
            foreach ($detail->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        if (!$detail->save()) {
            foreach ($detail->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        $assetOld = $asset->toArray();
        $asset->redate = $reduction->redate;
        $asset->aplieddate = $reduction->redate;
        $asset->retype = $reduction->retype;
        try {
            $asset->checkApliedDate($assetOld['aplieddate']);
            $asset->isValiCosts();
        } catch (\Throwable $e) {
            throw new \Exception($e->getMessage());
        }
        if(!$asset->vdUpdate()){
            foreach ($asset->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        if(!$asset->save()){
            foreach ($asset->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }

        $data = $asset->toArray();
        \AssetLog::saveLog(7, $data);
        return $asset;
    }
}