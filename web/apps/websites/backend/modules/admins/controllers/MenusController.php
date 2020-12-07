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

    // Update data
    public function updateAction($id = 0){
        $this->view->disable();
        if (!$this->security->checkToken()) {
            $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            $data['error'] = ['Token không chính xác'];
            $this->helper->responseJson($this, $data);
        }
        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
        if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('staffs','update')){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pContent = $this->request->getPost('content',['trim']);
        $pExcerpt = $this->request->getPost('excerpt',['string','trim']);
        if($id){
            if(!$staffs = \Menus::findFirstIdPermission($id,$perL)){
                $data['error'] = ['Không tìm thấy môn học'];
                $this->helper->responseJson($this, $data);
            }
            $staffs->updatedat = date('Y-m-d H:i:s');
            $staffs->updatedby = $userid;
        }else{
            $staffs = new \Menus();
            $staffs->author = $this->session->get('userid');
            $staffs->deptid = $this->session->get('deptid');
            $staffs->createdat = date('Y-m-d H:i:s');
            $staffs->updatedat = $staffs->createdat;
            $staffs->createdby = $userid;
            $staffs->updatedby = $userid;
        }
        $staffLangs = [];

        foreach ($languages as $key => $lang) {

            if(!$id || !$staffLang = \MenusLang::findFirst(["staffid = :id: AND langid = :langid:",'bind' => ['id' => (int)$id,'langid' => $lang->id]])){
                $staffLang = new \MenusLang();
            }

            if($key == 0){
                $lId = $lang->id;
            }

            $staffLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $staffLang->content = !empty($pContent[$lang->id]) ? $pContent[$lang->id] : $pContent[$lId];
            $staffLang->excerpt = !empty($pExcerpt[$lang->id]) ? $pExcerpt[$lang->id] : $pExcerpt[$lId];
            $staffLang->langid = $lang->id;
            array_push($staffLangs,$staffLang);
        }

        $plug = $this->request->getPost('slug',['string','trim']);
        $staffs->attrid = $this->request->getPost('attrid',['int']);
        $staffs->status = $this->request->getPost('status',['int']);
        $staffs->slug = $plug ? $plug : $this->helper->slugify($pTitle[1]);
        $staffs->image = $this->request->getPost('image',['trim','string']);
        $staffs->bgimage = $this->request->getPost('bgimage',['trim','string']);

        if(\Menus::findFirst(["slug = :slug: AND id != :id:","bind" => ["slug" => $staffs->slug,'id'=> $id]])){
            $reqPost['slug'] = $staffs->slug .'-'. strtotime('now');
        }

        try {
            $this->db->begin();
            $staffs->vdUpdate(true);
            if (!$staffs->save()) {
                foreach ($staffs->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            foreach ($staffLangs as $staffLang) {
                $staffLang->staffid = $staffs->id;
                $staffLang->vdUpdate(true);
                if (!$staffLang->save()) {
                    foreach ($staffLang->getMessages() as $message) {
                        throw new \Exception($message->getMessage());
                    }
                }
            }
            $this->db->commit();
            $this->flashSession->success(($id ? 'Chỉnh sửa' : 'Thêm mới').' môn học thành công');
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