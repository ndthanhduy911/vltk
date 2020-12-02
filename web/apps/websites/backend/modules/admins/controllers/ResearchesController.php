<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\ResearchesForm;
use Backend\Modules\Admins\Forms\ResearchesLangForm;
use Backend\Modules\Admins\Forms\SearchResearchesForm;

class ResearchesController  extends \BackendController {

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $filters = \Researches::findFilters();
        $tables = \Researches::findTables();
        $fFilters = ['title','status','createdat'];
        $fTables = ['image','title','excerpt','createdat','slug','status'];
        if($fSetting = \FilterSetting::findFirstKey('researches')){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $title = "Hướng nghiên cứu";
        $this->getJsCss();
        $this->view->searchForm = new SearchResearchesForm();
        $this->view->title = $title;
        $this->view->filters = $filters;
        $this->view->tables = $tables;
        $this->view->fFilters = $fFilters;
        $this->view->fTables = $fTables;
    }

    public function trashsAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $filters = \Researches::findTrashFilters();
        $tables = \Researches::findTrashTables();
        $fFilters = ['title','createdat'];
        $fTables = ['image','title','excerpt','createdat','slug'];
        if($fSetting = \FilterSetting::findFirstKey('trashresearches')){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $title = "Hướng nghiên cứu";
        $this->getJsCss();
        $this->view->searchForm = new SearchResearchesForm();
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

        $perEdit = $this->master::checkPermissionDepted('researches', 'update',1);
        $perView = $this->master::checkPermissionDepted('researches', 'index');
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
        $researchesLang = [];
        $researchContent = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$researches = \Researches::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }         
            foreach ($languages as $key => $lang) {
                $v = ($key == 0 ? true : false);
                $researchLang = \ResearchesLang::findFirst(['researchid = :id: AND langid = :langid:','bind' => ['id' => $researches->id, 'langid' => $lang->id]]);
                if($researchLang){
                    $formLang = new ResearchesLangForm($researchLang, [$lang->id,$v]);
                    $researchesLang[$lang->id] = $researchLang;
                    $formsLang[$lang->id] = $formLang;
                    $researchContent[$lang->id] = $researchLang->content;
                }else{
                    $formsLang[$lang->id] = new ResearchesLangForm(null, [$lang->id,$v]);
                    $researchesLang[$lang->id] = new \ResearchesLang();
                    $researchContent[$lang->id] = '';
                }
            }
            $title = 'Chỉnh sửa';
        }else{
            $researches = new \Researches();
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new ResearchesLangForm(null, [$lang->id,$v]);
                $researchesLang[$lang->id] = new \ResearchesLang();
                $researchContent[$lang->id] = '';
            }
        }

        $formResearches = new ResearchesForm($researches);

        $this->view->perEdit = $perEdit ? 1 : "";
        $this->view->perView = $perView ? 1 : "";
        $this->view->languages = $languages;
        $this->view->researchContent = $researchContent;
        $this->view->formsLang = $formsLang;
        $this->view->formResearches = $formResearches;
        $this->view->researches = $researches;
        $this->view->researchesLang = $researchesLang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->getJsCss();
    }

    // =================================
    // API
    // =================================
    // Get data
    public function ajaxgetdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('researches', 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $columns = [
            'r.id',
            'r.slug',
            'r.status',
            'r.deptid',
            'r.createdat',
            'r.image',
            'r.bgimage',
            'rl.title',
            'rl.content',
            'rl.excerpt',
            'd.slug dslug',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['r' => "Researches"])
        ->where("r.deleted = 0 AND r.status != 4")
        ->leftJoin('ResearchesLang', 'rl.researchid = r.id AND rl.langid = 1','rl')
        ->leftJoin('Depts', 'd.id = r.deptid','d')
        ->orderBy('r.createdat DESC');

        $data = $this->master::builderPermission($data,$perL,'r');
        $data = \FilterSetting::getDataOrder($this,$data,\Researches::findFirst(),'r',['rl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,\Researches::arrayFilter(),['r',['rl'=>['title']]]);

        $array_row = [
            'u' => $this->master::checkPermission('researches', 'update', 1)
        ];

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $array_row));
    }

    public function ajaxgetdatatrashAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('researches', 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $columns = [
            'r.id',
            'r.slug',
            'r.status',
            'r.deptid',
            'r.createdat',
            'r.image',
            'r.bgimage',
            'rl.title',
            'rl.content',
            'rl.excerpt',
            'd.slug dslug',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['r' => "Researches"])
        ->where("r.deleted = 0 AND r.status = 4")
        ->leftJoin('ResearchesLang', 'rl.researchid = r.id AND rl.langid = 1','rl')
        ->leftJoin('Depts', 'd.id = r.deptid','d')
        ->orderBy('r.createdat DESC');

        $data = $this->master::builderPermission($data,$perL,'r');
        $data = \FilterSetting::getDataOrder($this,$data,\Researches::findFirst(),'r',['rl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,\Researches::arrayTrashFilter(),['r',['rl'=>['title']]]);

        $array_row = [];

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
        if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('researches','update')){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pContent = $this->request->getPost('content',['trim']);
        $pExcerpt = $this->request->getPost('excerpt',['string','trim']);
        if($id){
            if(!$researches = \Researches::findFirstIdPermission($id,$perL)){
                $data['error'] = ['Không tìm thấy trang'];
                $this->helper->responseJson($this, $data);
            }
            $researches->updatedat = date('Y-m-d H:i:s');
            $researches->updatedby = $userid;
        }else{
            $researches = new \Researches();
            $researches->deptid = $this->session->get('deptid');
            $researches->createdat = date('Y-m-d H:i:s');
            $researches->updatedat = $researches->createdat;
            $researches->createdby = $userid;
            $researches->updatedby = $userid;
        }
        $researchLangs = [];

        foreach ($languages as $key => $lang) {

            if(!$id || !$researchLang = \ResearchesLang::findFirst(["researchid = :id: AND langid = :langid:",'bind' => ['id' => (int)$id,'langid' => $lang->id]])){
                $researchLang = new \ResearchesLang();
            }

            if($key == 0){
                $lId = $lang->id;
            }

            $researchLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $researchLang->content = !empty($pContent[$lang->id]) ? $pContent[$lang->id] : $pContent[$lId];
            $researchLang->excerpt = !empty($pExcerpt[$lang->id]) ? $pExcerpt[$lang->id] : $pExcerpt[$lId];
            $researchLang->langid = $lang->id;
            array_push($researchLangs,$researchLang);
        }

        $plug = $this->request->getPost('slug',['string','trim']);
        $researches->attrid = $this->request->getPost('attrid',['int']);
        $researches->status = $this->request->getPost('status',['int']);
        $researches->slug = $plug ? $plug : $this->helper->slugify($pTitle[1]);
        $researches->image = $this->request->getPost('image',['trim','string']);
        $researches->bgimage = $this->request->getPost('bgimage',['trim','string']);

        if(\Researches::findFirst(["slug = :slug: AND id != :id:","bind" => ["slug" => $researches->slug,'id'=> $id]])){
            $reqPost['slug'] = $researches->slug .'-'. strtotime('now');
        }

        try {
            $this->db->begin();
            $researches->vdUpdate(true);
            if (!$researches->save()) {
                foreach ($researches->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            foreach ($researchLangs as $researchLang) {
                $researchLang->researchid = $researches->id;
                $researchLang->vdUpdate(true);
                if (!$researchLang->save()) {
                    foreach ($researchLang->getMessages() as $message) {
                        throw new \Exception($message->getMessage());
                    }
                }
            }
            $this->db->commit();
            $this->flashSession->success(($id ? 'Chỉnh sửa' : 'Thêm mới').' trang thành công');
        } catch (\Throwable $e) {
            $this->db->rollback();
            $data['error'] = [$e->getMessage()];
        }
        $this->helper->responseJson($this, $data);
    }

    public function restoreAction(){
        $this->view->disable();
        if(!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('researches','delete',1)){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Researches::findPermission($perL,"*",['status = 4 AND id IN (' . $strIds . ')']);

        try {
            $this->db->begin();
            foreach ($data as $item) {
                $this->restoreOne($item);
            }
            $this->db->commit();
        } catch (\Throwable $e) {
            $this->db->rollback();
            $this->helper->responseJson($this, ["error" => [$e->getMessage()]]);
        }
        $this->helper->responseJson($this, ["result" => ["Success"]]);
    }

    public function trashAction(){
        $this->view->disable();
        if(!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('researches','delete',1)){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Researches::findPermission($perL,"*",['id IN (' . $strIds . ')']);

        try {
            $this->db->begin();
            foreach ($data as $item) {
                $this->trashOne($item);
            }
            $this->db->commit();
        } catch (\Throwable $e) {
            $this->db->rollback();
            $this->helper->responseJson($this, ["error" => [$e->getMessage()]]);
        }
        $this->helper->responseJson($this, ["result" => ["Success"]]);
        
    }

    public function deleteAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('researches', 'delete')) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Researches::findPermission($perL,"*",['status = 4 AND id IN (' . $strIds . ')']);

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
    private function trashOne($item){
        $userid = $this->session->get('userid');
        $item->updatedat = date('Y-m-d H:i:s');
        $item->updatedby = $userid;
        $item->status = 4;
        if (!$item->save()) {
            foreach ($item->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        \Logs::saveLogs($this, 3, "Xóa tạm trang ID: {$item->id}", ['table' => 'Researches','id' => $item->id]);
    }

    private function restoreOne($item){
        $userid = $this->session->get('userid');
        $item->updatedat = date('Y-m-d H:i:s');
        $item->updatedby = $userid;
        $item->status = 1;
        if (!$item->save()) {
            foreach ($item->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        \Logs::saveLogs($this, 5, "Khôi phục trang ID: {$item->id}", ['table' => 'Researches','id' => $item->id]);
    }

    private function deleteOne($item){
        $itemOld = $item->toArray();
        if (!$item->delete()) {
            foreach ($item->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        $data = \ResearchesLang::find([
            'researchid = :researchid:',
            'bind' => ['researchid' => $itemOld['id']]
        ]);
        foreach ($data as $it) {
            if (!$it->delete()) {
                foreach ($it->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
        }
        \Logs::saveLogs($this, 4, "Xóa trang ID: {$itemOld['id']}", ['table' => 'Researches','id' => $itemOld['id']]);
    }

    private function getJsCss(){
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/researches.js');
    }
}