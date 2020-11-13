<?php
namespace Backend\Modules\Shared\Controllers;
use Backend\Modules\Shared\Forms\DeptsForm;
use Backend\Modules\Shared\Forms\SearchDeptsForm;

class DeptsController extends \BackendController
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
        $title = "Đơn vị/bộ phận";
        $this->getJsCss();
        $this->view->title = $title;
        $this->view->form = new DeptsForm();
        $this->view->form_search = new SearchDeptsForm();
    }

    // ===============================
    // API
    // ===============================
    //Get data
    public function getdataAction(){
        if (!$this->request->isAjax() || !$this->master::checkPermission('depts', 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }

        $parentSearch = $this->request->get('parentSearch','int');
        $nameSearch = $this->request->get('nameSearch',['string', 'trim']);
        $idSearch = $this->request->get('idSearch',['string', 'trim']);

        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'Depts.id',
            'Depts.name',
            'Depts.dcode',
            'Depts.qhns',
            'Depts.description',
            'Depts.address',
            'Depts.parentid'
        ))
        ->from('Depts')
        ->where("Depts.deleted = 0")
        ->orderBy('Depts.id ASC');

        $array_row = [
            'u' => $this->master::checkPermission('depts', 'update', '1'),
            'd' => $this->master::checkPermission('depts', 'delete')
        ];

        if($parentSearch && $parentSearch != 'all'){
            $data = $data->andWhere('Depts.parentid = :parentSearch:', ['parentSearch' => $parentSearch]);
        }else{
            $data = $data->andWhere('Depts.parentid = 0 OR Depts.parentid IS NULL');
        }

        if($nameSearch){
            $data = $data->andWhere('Depts.name LIKE :nameSearch:',['nameSearch' => '%'.$nameSearch.'%']);
        }

        if($idSearch){
            $data = $data->andWhere('Depts.id LIKE :idSearch:',['idSearch' => $idSearch]);
        }

        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data, false, $array_row));
    }

    public function getsingleAction($id = null){
        if (!$this->request->isAjax()) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        $perL = $this->master::checkPermissionDepted('depts', ['update','index'],[0,1]);
        if(!$perL){
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }

        if ($data = \Depts::findFirstIdNoDelete($id)) {
            $data = $data->toArray();
            $this->helper->responseJson($this, $data);
        } else {
            $this->helper->responseJson($this, ['error' => ['Không tìm thấy dữ liệu']]);
        }
    }
    // Update data
    public function updateAction($id = 0){ 
        if (!$this->security->checkToken()) {
            $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            $data['error'] = ['Token không chính xác'];
            $this->helper->responseJson($this, $data);
        }
        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
        if (!$this->request->isAjax() || !$this->request->isPost()) {
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        if($id){
            if(!$depts = \Depts::findFirstIdNoDelete($id)){
                $data['error'] = ['Không tìm thấy dữ liêụ'];
                $this->helper->responseJson($this, $data);
            }
            $depts->updatedat = date('Y-m-d H:i:s');
            $depts->updatedby = $userid;
        }else{
            $depts = new \Depts();
            $depts->createdat = date('Y-m-d H:i:s');
            $depts->updatedat = $depts->createdat;
            $depts->createdby = $userid;
            $depts->updatedby = $userid;
            $depts->deleted = 0;
        }
        $deptsOld = $depts->toArray();
        $depts->name = $this->request->getPost('name',['string', 'trim']);
        $depts->address = $this->request->getPost('address',['string', 'trim']);
        $depts->parentid = $this->request->getPost('parentid','int');
        $depts->description = $this->request->getPost('description',['string', 'trim']);
        $depts->dcode = $this->request->getPost('dcode',['string', 'trim']);
        $depts->qhns = $this->request->getPost('qhns',['string', 'trim']);

        if((int)$depts->parentid){
            if(!$deptParent = \Depts::findFirstId($depts->parentid, 'id')){
                $data['error'] = ['Trực thuộc TS không tồn tại'];
                $this->helper->responseJson($this, $data);
            }
            if($id && $depts->parentid == $id){
                $data['error'] = ['Không thể trực thuộc chính mình'];
                $this->helper->responseJson($this, $data);
            }
            
            if($id && $depts->parentid != $deptsOld['id']){
                $arrayIdChild = \Depts::getArrayChild($deptsOld['id']);
                if(in_array($deptParent->id, $arrayIdChild)){
                    $data['error'] = ['Không thể trực thuộc đơn vị/bộ phận này'];
                    $this->helper->responseJson($this, $data);
                }
            }
        }

        try {
            $this->db->begin();
            $depts->vdUpdate(true);
            if (!$depts->save()) {
                foreach ($depts->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            if($id){
                \Logs::saveLogs($this, 2, 'Cập nhật đơn vị/ bộ phận: '.$depts->name, $deptsOld,$depts->toArray());
            }else{
                \Logs::saveLogs($this, 1, 'Thêm mới đơn vị/ bộ phận: '.$depts->name, "", $depts->toArray());
            }
            $this->db->commit();
            $data['data'] = $depts->toArray();
            $this->helper->responseJson($this, $data);
        } catch (\Throwable $e) {
            $this->db->rollback();
            $data['error'] = [$e->getMessage()];
            $this->helper->responseJson($this, $data);
        }

    }

    public function getdeptschildAction($id = 0) {
        if (!$this->request->isAjax() || !$this->master::checkPermissionDepted('depts', 'index')) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }
        $data = [];
        $data = \Depts::getChild($id,$data);
        $this->helper->responseJson($this, $data);
    }

    public function deleteAction(){ 
        if (!$this->request->isAjax() || !$this->request->isPost()) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }
        $listId = $this->request->getPost('dataId',['string', 'trim']);
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }
        $listId = $this->helper->filterListIds($listId);

        try {
            $this->db->begin();
            foreach ($listId as $deptid) {
                $this->deleteOne($deptid);
            }
            $this->db->commit(); 
            $this->helper->responseJson($this,[]);
        } catch (\Throwable $e) {
            $this->db->rollback();
            $this->helper->responseJson($this, ["error" => [$e->getMessage()]]);
        }    
    }

    public function importAction(){
        if (!$this->security->checkToken()) {
            $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            $data['error'] = ['Token không chính xác'];
            $this->helper->responseJson($this, $data);
        }
        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
        if (!$this->request->isAjax() || !$this->request->isPost() || !$this->master::checkPermission('depts', 'update')) {
            $data['error'] = ["Truy cập không được phép"];
            $this->helper->responseJson($this, $data);
        }
        try {
            $this->db->begin();
            $importExcel = new \Library\ImportExcel\ImportExcelDepts('importfile', [
                'size_max' => 2,
                'is_check_password' => false,
                'file_password' => EXCEL_PASSWORD
            ]);
            $resValidation = $importExcel->validation();
            if ($resValidation !== true) {
                throw new \Exception($resValidation);
            }
            $importExcel->run();
            if (!empty($importExcel->error)) {
                throw new \Exception($importExcel->error);
            }
            $this->db->commit();
            $this->helper->responseJson($this, $data);
        } catch (\Throwable $e) {
            $this->db->rollback();
            $data['error'] = [$e->getMessage()];
            $this->helper->responseJson($this, $data);
        }
    }

    // ===============================
    // FUNCTION
    // ===============================

    private function getJsCss (){
        // And some local JavaScript resources
        $this->assets->addJs(WEB_URL.'/assets/backend/js/modules/shared/depts.js?v='.VS_SCRIPT);
    }

    private function deleteOne($id) {
        if (!$depts = \Depts::findFirstIdNoDelete($id)) {
            throw new \Exception("ID: $id không tồn tại");
        }
        $depts->deleted = 1;
        $depts->updatedat = date('Y-m-d H:i:s');
        $depts->updatedby = $_SESSION['userid'];

        if (!$depts->save()) {
            foreach ($depts->getMessages() as $message) {
                throw new \Exception("ID: $id ".$message->getMessage());                    
            }
        }
        $deleteChild = \Depts::deleteChild($depts->id);
        foreach ($deleteChild as $child) {
            \Logs::saveLogs($this, 3, "Xóa đơn vị/ bộ phận: {$child['name']}", ['table' => 'Depts','id' => $child['id']]);
        }
        \Logs::saveLogs($this, 3, "Xóa đơn vị/ bộ phận: $depts->name", ['table' => 'Depts','id' => $depts->id]);
    }
}