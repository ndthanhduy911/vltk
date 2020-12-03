<?php
namespace Backend\Modules\Master\Controllers;
class TrashsController extends \BackendController
{
    // ===============================
    // PAGE
    // ===============================
    public function indexAction(){
        $title = "Thùng rác";
        $this->getJsCss();
        $this->view->title = $title;
    }

    // ===============================
    // API
    // ===============================
    public function ajaxgetdataAction(){
        $this->view->disable();
        if(!$type = $this->request->get('type',['string', 'trim'])){
            $this->helper->responseJson($this, ["error" => "Loại dữ liệu không tồn tại"]);
        };
        $perL = $this->checkP($type);

        $data = $this->modelsManager->createBuilder()
        ->columns($this->arraTypes[$type][2])
        ->from(['t' =>$this->arraTypes[$type][0]])
        ->where("t.deleted = 1")
        ->leftJoin($this->arraTypes[$type][0].'Lang', "tl.{$this->arraTypes[$type][1]} = t.id AND tl.langid = 1",'tl')
        ->orderBy('t.updatedat DESC');

        $data = $this->master::builderPermission($data,$perL,'t');
        $search = "tl.title LIKE :search: OR tl.excerpt LIKE :search:";

        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data, $search));
    }

    // Update data
    public function restoreAction(){
        $this->view->disable();
        if(!$type = $this->request->get('type',['string', 'trim'])){
            $this->helper->responseJson($this, ["error" => "Loại dữ liệu không tồn tại"]);
        };
        $perL = $this->checkP($type);

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = ("\\".$this->arraTypes[$type][0])::findPermission($perL,"*",['deleted = 1 AND id IN (' . $strIds . ')']);

        try {
            $this->db->begin();
            foreach ($data as $item) {
                $this->restoreOne($item,$type);
            }
            $this->db->commit();
        } catch (\Throwable $e) {
            $this->db->rollback();
            $this->helper->responseJson($this, ["error" => [$e->getMessage()]]);
        }
        $this->helper->responseJson($this, ["result" => ["Success"]]);
    }

    public function deleteAction(){
        $this->view->disable();
        if(!$type = $this->request->get('type',['string', 'trim'])){
            $this->helper->responseJson($this, ["error" => "Loại dữ liệu không tồn tại"]);
        };
        $perL = $this->checkP($type);

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = ("\\".$this->arraTypes[$type][0])::findPermission($perL,"*",['deleted = 1 AND id IN (' . $strIds . ')']);

        try {
            $this->db->begin();
            foreach ($data as $item) {
                $this->deleteOne($item,$type);
            }
            $this->db->commit();
        } catch (\Throwable $e) {
            $this->db->rollback();
            $this->helper->responseJson($this, ["error" => [$e->getMessage()]]);
        }
        $this->helper->responseJson($this, ["result" => ["Success"]]);
    }

    // ===============================
    // FUNCTION
    // ===============================
    private $arraTypes = [
        'posts' => ['Posts','postid',['t.id','t.updatedat','tl.title','tl.excerpt des']],
        'pages'=> ['Pages','pageid',['t.id','t.updatedat','tl.title','tl.excerpt des']],
        'subjects'=> ['Subjects','subjectid',['t.id','t.updatedat','tl.title','tl.excerpt des']],
        'researches'=> ['Researches','researchid',['t.id','t.updatedat','tl.title','tl.excerpt des']],
        'slideshows'=> ['Slideshows','slideshowid',['t.id','t.updatedat','tl.title','tl.description des']],
        'staffs'=> ['Staffs','staffid',['t.id','t.updatedat','tl.title','tl.excerpt des']],
        'partners'=> ['Partners','partnerid',['t.id','t.updatedat','tl.title','tl.excerpt des']]
    ];

    private function getJsCss (){
        $this->assets->addJs(WEB_URL.'/assets/backend/js/modules/master/trashs.js?v='.VS_SCRIPT);
    }

    private function checkP($type){
        if (!$this->request->isAjax()) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }

        if(!array_key_exists($type,$this->arraTypes)){
            $this->helper->responseJson($this, ["error" => "Loại dữ liệu không tồn tại"]);
        }

        if(!$perL = $this->master::checkPermissionDepted($type, 'delete')){
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }

        return $perL;
    }

    private function restoreOne($item,$type){
        $userid = $this->session->get('userid');
        $item->updatedat = date('Y-m-d H:i:s');
        $item->updatedby = $userid;
        $item->deleted = 0;
        if (!$item->save()) {
            foreach ($item->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        \Logs::saveLogs($this, 5, "Khôi phục dữ liệu ID: {$item->id}", ['table' => $this->arraTypes[$type][0],'id' => $item->id]);
    }

    private function deleteOne($item,$type){
        $itemOld = $item->toArray();
        if (!$item->delete()) {
            foreach ($item->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        $data = ("\\".$this->arraTypes[$type][0].'Lang')::find([
            "{$this->arraTypes[$type][1]} = :id:",
            'bind' => ['id' => $itemOld['id']]
        ]);
        foreach ($data as $it) {
            if (!$it->delete()) {
                foreach ($it->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
        }
        \Logs::saveLogs($this, 4, "Xóa bài viết ID: {$itemOld['id']}", ['table' => 'Posts','id' => $itemOld['id']]);
    }
}