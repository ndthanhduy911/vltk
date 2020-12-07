<?php
namespace Backend\Modules\Admins\Controllers;

use Backend\Modules\Admins\Forms\MenusForm;

class MenusController  extends \BackendController {

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        // var_dump(\Menus::getTreeDataTable(1,0)); die;
        $deptid = $this->session->get('deptid');
        $title = "Menus";
        $this->getJsCss();
        $this->view->headId = \MenuLocation::getId($deptid,1);
        $this->view->footId = \MenuLocation::getId($deptid,2);
        $this->view->languages = \Language::find(['status = 1']);
        $this->view->formMenus = new MenusForm();
        $this->view->title = $title;
    }

    // =================================
    // API
    // =================================
    // Get data
    public function ajaxgetdataAction($lId = 0){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('menus', 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        
        $menus = \Menus::getTreeDataTable($lId,0);

        $data = [
            'draw' => (int)$this->request->get('draw','int'),
            'recordsTotal' => count($menus),
            'recordsFiltered' => count($menus),
            'data' => $menus,
        ];

        $this->helper->responseJson($this, $data);
    }

    public function getsingleAction($id = null)
    {
        if (!$this->request->isAjax() || !$this->master::checkPermission('menus', ['update','index'],[0,1])) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        if ($data = \Menus::findFirstIdNoDelete($id)) {
            $data = $data->toArray();
            $data['lang'] = [];
            $data['parents'] = \Menus::findS2Parents($this->session->get('deptid'),$data['locationid'])->toArray();
            $languages = \Language::find(['status = 1']);
            foreach ($languages as $lang) {
                if($menulang = \MenusLang::findFirst(["menuid =:id: AND langid = :langid:",'bind'=>['id' => $data['id'],'langid' => $lang->id]])){
                    array_push($data['lang'],$menulang->toArray());
                }
            }
            $this->helper->responseJson($this, $data);
        } else {
            $this->helper->responseJson($this, ['error' => ['Không tìm thấy dữ liệu']]);
        }
    }

    public function gets2menulocationAction($id = null)
    {
        if (!$this->request->isAjax() || !$this->master::checkPermission('menus', ['update','index'],[0,1])) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $data = \Menus::findS2Parents($this->session->get('deptid'),$id)->toArray();
        $this->helper->responseJson($this, $data);
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
        $locationId = $this->request->getPost('locationid',['int']);
        if($id){
            if(!$items = \Menus::findFirstIdPermission($id,$perL,['locationid = :id:',['id' => $locationId]])){
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

        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        foreach ($languages as $key => $lang) {
            if(!$items->id || !$itemsLang = ($this->classNameLang)::findFirst(["menuid = :id: AND langid = :langid:",'bind' => ['id' => $id,'langid' => $lang->id]])){
                $itemsLang = new $this->classNameLang;
            }
            if($key == 0){
                $lId = $lang->id;
            }
            $itemsLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $itemsLang->langid = $lang->id;
            array_push($itemsLangs,$itemsLang);
        }

        $items->dcode = $this->request->getPost('dcode',['trim','string']);
        $items->phone = $this->request->getPost('phone',['trim','string']);
        $items->email = $this->request->getPost('email',['trim','string']);
        $items->link = $this->request->getPost('link',['trim','string']);
        $items->image = $this->request->getPost('image',['trim','string']);
        $items->logo = $this->request->getPost('logo',['trim','string']);
        $items->icon = $this->request->getPost('icon',['trim','string']);

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
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('staffs', 'delete')) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Menus::findPermission($perL,"*",['deleted = 0 AND id IN (' . $strIds . ')']);

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
        \Logs::saveLogs($this, 3, "Xóa tạm cán bộ ID: {$item->id}", ['table' => 'Menus','id' => $item->id]);
    }

    private function getJsCss(){
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/menus.js');
    }
}