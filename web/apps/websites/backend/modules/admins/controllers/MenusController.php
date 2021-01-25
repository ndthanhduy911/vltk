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
        if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('menus','update',[0,1])){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        $locationId = $this->request->getPost('locationid',['int']);
        if(!$locations = \MenuLocation::findFirstIdPermission($locationId,$perL)){
            $data['error'] = ['Ví trí menus không hợp lệ'];
            $this->helper->responseJson($this, $data);
        }
        if($id){
            if(!$menus = \Menus::findFirstIdPermission($id,$perL,"*",['locationid = :lid:',['lid' => $locations->id]])){
                $data['error'] = ["Menus không hợp lệ"];
                $this->helper->responseJson($this, $data);
            }
            $menus->updatedat = date('Y-m-d H:i:s');
            $menus->updatedby = $userid;
        }else{
            $menus = new \Menus();
            $menus->deptid = $this->session->get('deptid');
            $menus->locationid = $locationId;
            $menus->createdat = date('Y-m-d H:i:s');
            $menus->updatedat = $menus->createdat;
            $menus->createdby = $userid;
            $menus->updatedby = $userid;
        }
        $menusLangs = [];
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        foreach ($languages as $key => $lang) {
            if(empty($menus->id) || !$menusLang = \MenusLang::findFirst(["menuid = :id: AND langid = :langid:",'bind' => ['id' => $id,'langid' => $lang->id]])){
                $menusLang = new \MenusLang();
            }
            if($key == 0){
                $lId = $lang->id;
            }
            $menusLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $menusLang->langid = $lang->id;
            array_push($menusLangs,$menusLang);
        }

        $menus->type = $this->request->getPost('type',['int']);
        $menus->postid = $this->request->getPost('postid',['int']);
        $menus->pageid = $this->request->getPost('pageid',['int']);
        $menus->catid = $this->request->getPost('catid',['int']);
        $menus->dept = $this->request->getPost('dept',['int']);
        $menus->links = $this->request->getPost('links',['trim','string']);
        $menus->majorid = $this->request->getPost('majorid',['int']);
        $menus->gmajorid = $this->request->getPost('gmajorid',['int']);
        // $menus->icon = $this->request->getPost('icon',['trim','string']);
        $menus->parentid = $this->request->getPost('parentid',['int']);
        $menus->sort = (int)$this->request->getPost('sort',['int']);
        $menus->target = $this->request->getPost('target',['int']);
        $menus->status = $this->request->getPost('status',['int']);

        try {
            $this->db->begin();
            $menus->vdUpdate(true);
            if (!$menus->save()) {
                foreach ($menus->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            foreach ($menusLangs as $menusLang) {
                $menusLang->menuid = $menus->id;
                $menusLang->vdUpdate(true);
                if (!$menusLang->save()) {
                    foreach ($menusLang->getMessages() as $message) {
                        throw new \Exception($message->getMessage());
                    }
                }
            }
            $this->db->commit();
            \Logs::saveLogs($this, ($id ? 2: 1), ($id ? 'Cập nhật ' : 'Thêm mới ').mb_strtolower('Menus','UTF-8')." ID: {$menus->id}", ['table' => "Menus",'id' => $menus->id]);
        } catch (\Throwable $e) {
            $this->db->rollback();
            $data['error'] = [$e->getMessage()];
        }
        $this->helper->responseJson($this, $data);
    }

    public function deleteAction($id = 0){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('staffs', 'delete')) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        if(!$item = \Menus::findFirstIdPermission($id,$perL)){
            $this->helper->responseJson($this, ["error" => ["Không tìm thấy menus"]]);
        }

        try {
            $this->db->begin();
            $this->deleteOne($item);
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