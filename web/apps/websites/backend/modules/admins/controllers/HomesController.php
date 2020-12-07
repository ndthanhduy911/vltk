<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\HomesForm;
use Backend\Modules\Admins\Forms\HomesLangForm;

class HomesController  extends \BackendController {

    public $title = "Thiết lập trang chủ";

    public $cler = "homes";

    public $className = \Homes::class;

    public $classNameLang = \HomesLang::class;

    public $itemsForm = \Backend\Modules\Admins\Forms\HomesForm::class;

    public $itemsLangFrom = \Backend\Modules\Admins\Forms\HomesLangForm::class;

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $perEdit = $this->master::checkPermissionDepted('homes', 'update',1);
        $perView = $this->master::checkPermissionDepted('homes', 'index');
        $perL = $perView ? $perView : ($perEdit? $perEdit :false);
        if(!$perL){
            require ERROR_FILE; die;
        }
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }
        $deptid = $this->session->get('deptid');
        if(!$homes = ($this->className)::findFirstPermission($perL,"*",["deptid = :id:",['id'=>$deptid]])){
            require ERROR_FILE; die;
        } 
        $formsLang = [];
        $languages = \Language::find(['status = 1']);
        foreach ($languages as $key => $lang) {
            $v = ($key == 0 ? true : false);
            $homeLang = \HomesLang::findFirst(['homeid = :id: AND langid = :langid:','bind' => ['id' => $homes->id, 'langid' => $lang->id]]);
            if($homeLang){
                $formLang = new HomesLangForm($homeLang, [$lang->id,$v]);
                $formsLang[$lang->id] = $formLang;
            }else{
                $formsLang[$lang->id] = new HomesLangForm(null, [$lang->id,$v]);
            }
        }
        $title = 'Thiết lập trang chủ';
        $homes->catlist = !empty($homes->catlist) ? json_decode($homes->catlist) : [];
        $formHomes = new HomesForm($homes);
        $this->view->perEdit = $perEdit ? 1 : "";
        $this->view->perView = $perView ? 1 : "";
        $this->view->languages = $languages;
        $this->view->formsLang = $formsLang;
        $this->view->formHomes = $formHomes;
        $this->view->homes = $homes;
        $this->view->homesLang = $homesLang;
        $this->view->title = $title;
        $this->getJsCss();
    }

    // =================================
    // API
    // =================================

    // Update data
    public function updateAction(){
        $this->view->disable();
        if (!$this->security->checkToken()) {
            $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            $data['error'] = ['Token không chính xác'];
            $this->helper->responseJson($this, $data);
        }
        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
        if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted("homes",'update',1)){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        $deptid = $this->session->get('deptid');
        if(!$items = ($this->className)::findFirstPermission($perL,"*",["deptid = :id:",['id'=>$deptid]])){
            $data['error'] = ["Không tìm thấy dữ liệu"];
            $this->helper->responseJson($this, $data);
        }
        $items->updatedat = date('Y-m-d H:i:s');
        $items->updatedby = $userid;

        $itemsLangs = [];
        $languages = \Language::find(['status = 1']);
        $pSzedTitle = $this->request->getPost('szedtitle',['string','trim']);
        $pStaffTitle = $this->request->getPost('stafftitle',['string','trim']);
        $pStaffDes = $this->request->getPost('staffdes',['string','trim']);
        $pPartnerTitle = $this->request->getPost('partnertitle',['string','trim']);
        $pPartnerDes	 = $this->request->getPost('partnerdes',['string','trim']);
        $pContactTitle = $this->request->getPost('contacttitle',['string','trim']);
        $pContactDes	 = $this->request->getPost('contactdes',['string','trim']);
        foreach ($languages as $key => $lang) {
            if(!$items->id || !$itemsLang = ($this->classNameLang)::findFirst(["homeid = :id: AND langid = :langid:",'bind' => ['id' => $items->id,'langid' => $lang->id]])){
                $itemsLang = new $this->classNameLang;
            }
            if($key == 0){
                $lId = $lang->id;
            }
            $itemsLang->szedtitle = !empty($pSzedTitle[$lang->id]) ? $pSzedTitle[$lang->id] : $pSzedTitle[$lId];
            $itemsLang->stafftitle = !empty($pStaffTitle[$lang->id]) ? $pStaffTitle[$lang->id] : $pStaffTitle[$lId];
            $itemsLang->staffdes = !empty($pStaffDes[$lang->id]) ? $pStaffDes[$lang->id] : $pStaffDes[$lId];
            $itemsLang->partnertitle = !empty($pPartnerTitle[$lang->id]) ? $pPartnerTitle[$lang->id] : $pPartnerTitle[$lId];
            $itemsLang->partnerdes = !empty($pPartnerDes[$lang->id]) ? $pPartnerDes[$lang->id] : $pPartnerDes[$lId];
            $itemsLang->contacttitle = !empty($pContactTitle[$lang->id]) ? $pContactTitle[$lang->id] : $pContactTitle[$lId];
            $itemsLang->contactdes = !empty($pContactDes[$lang->id]) ? $pContactDes[$lang->id] : $pContactDes[$lId];
            $itemsLang->langid = $lang->id;
            array_push($itemsLangs,$itemsLang);
        }
        $catlist = $this->request->getPost('catlist',['trim','string']);
        if(is_array($catlist)){
            $catlist = json_encode($catlist);
        }else{
            $catlist = json_encode([]);
        }
        $items->catlist = $catlist;
        $items->postnumber = $this->request->getPost('postnumber',['int']);
        $items->szedbg = $this->request->getPost('szedbg',['trim','string']);
        $items->partnerbg = $this->request->getPost('partnerbg',['trim','string']);

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
            \Logs::saveLogs($this, 2, "Thiết lập trang chủ bộ môn/ khoa", ['table' => $this->className,'id' => $items->id]);
            $this->flashSession->success("Cập nhật thành công");
        } catch (\Throwable $e) {
            $this->db->rollback();
            $data['error'] = [$e->getMessage()];
        }
        $this->helper->responseJson($this, $data);
    }

    // =================================
    // FUNCTION
    // =================================

    private function getJsCss (){
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/homes.js');
    }
}