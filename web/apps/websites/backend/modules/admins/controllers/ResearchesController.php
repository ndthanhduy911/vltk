<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\ResearchesForm;
use Backend\Modules\Admins\Forms\ResearchesLangForm;
use Backend\Modules\Admins\Forms\SearchResearchesForm;

class ResearchesController  extends \BackendController {

    private $title = "Hướng nghiên cứu";

    private $cler = "researches";

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
        if($fSetting = \FilterSetting::findFirstKey($this->cler)){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $this->getJsCss();
        $this->view->searchForm = new SearchResearchesForm();
        $this->view->title = $this->title;
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
            if(!$items = \Researches::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }         
            foreach ($languages as $key => $lang) {
                $v = ($key == 0 ? true : false);
                $itemsLang = \ResearchesLang::findFirst(['researchid = :id: AND langid = :langid:','bind' => ['id' => $items->id, 'langid' => $lang->id]]);
                if($itemsLang){
                    $formLang = new ResearchesLangForm($itemsLang, [$lang->id,$v]);
                    $formsLang[$lang->id] = $formLang;
                }else{
                    $formsLang[$lang->id] = new ResearchesLangForm(null, [$lang->id,$v]);
                }
            }
            $title = 'Chỉnh sửa';
        }else{
            $items = new \Researches();
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new ResearchesLangForm(null, [$lang->id,$v]);
            }
        }

        $form = new ResearchesForm($items);

        $this->view->perEdit = $perEdit ? 1 : "";
        $this->view->perView = $perView ? 1 : "";
        $this->view->languages = $languages;
        $this->view->formsLang = $formsLang;
        $this->view->form = $form;
        $this->view->items = $items;
        $this->view->title = $title;
        $this->view->btitle = $this->title;
        $this->view->cler = $this->cler;
        $this->assets->addJs(WEB_URI.'/elfinder/js/require.min.js');
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/templates/views.js');
        return $this->view->pick('templates/views');
    }

    // =================================
    // API
    // =================================
    // Get data
    public function ajaxgetdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted($this->cler, 'index')) {
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
            '(SELECT dl.name FROM DeptsLang AS dl WHERE dl.deptid = r.deptid AND dl.langid = 1) AS deptname'
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['r' => "Researches"])
        ->where("r.deleted = 0")
        ->leftJoin('ResearchesLang', 'rl.researchid = r.id AND rl.langid = 1','rl')
        ->leftJoin('Depts', 'd.id = r.deptid','d')
        ->orderBy('r.deptid ASC,r.id DESC');

        $data = $this->master::builderPermission($data,$perL,'r');
        $data = \FilterSetting::getDataOrder($this,$data,\Researches::findFirst(),'r',['rl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,\Researches::arrayFilter(),['r',['rl'=>['title']]]);

        $array_row = [
            'u' => $this->master::checkPermission($this->cler, 'update', 1)
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
        if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted($this->cler,'update')){
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

        $data = \Researches::findPermission($perL,"*",['deleted = 0 AND id IN (' . $strIds . ')']);

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
        \Logs::saveLogs($this, 3, "Xóa tạm hướng nghiên cứu ID: {$item->id}", ['table' => 'Researches','id' => $item->id]);
    }

    private function getJsCss(){
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/researches.js');
    }
}