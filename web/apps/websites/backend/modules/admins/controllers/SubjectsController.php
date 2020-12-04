<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\SubjectsForm;
use Backend\Modules\Admins\Forms\SubjectsLangForm;
use Backend\Modules\Admins\Forms\SearchSubjectsForm;

class SubjectsController  extends \BackendController {

    private $title = "Môn học";

    private $cler = "subjects";

    private $className = \Subjects::class;

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $filters = ($this->className)::findFilters();
        $tables = ($this->className)::findTables();
        $fFilters = ['title','code','status','createdat'];
        $fTables = ['image','code','title','excerpt','createdat','slug','status'];
        if($fSetting = \FilterSetting::findFirstKey($this->cler)){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $this->view->searchForm = new SearchSubjectsForm();
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
                $itemsLang = \SubjectsLang::findFirst(['subjectid = :id: AND langid = :langid:','bind' => ['id' => $items->id, 'langid' => $lang->id]]);
                if($itemsLang){
                    $formLang = new SubjectsLangForm($itemsLang, [$lang->id,$v]);
                    $formsLang[$lang->id] = $formLang;
                }else{
                    $formsLang[$lang->id] = new SubjectsLangForm(null, [$lang->id,$v]);
                }
            }
            $title = 'Chỉnh sửa';
        }else{
            $items = new \Subjects();
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new SubjectsLangForm(null, [$lang->id,$v]);
            }
        }

        $form = new SubjectsForm($items);
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
            's.id',
            's.slug',
            's.status',
            's.code',
            's.deptid',
            's.createdat',
            's.image',
            's.bgimage',
            'sl.title',
            'sl.content',
            'sl.excerpt',
            'd.slug dslug',
            '(SELECT dl.name FROM DeptsLang AS dl WHERE dl.deptid = s.deptid AND dl.langid = 1) AS deptname',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['s' => "Subjects"])
        ->where("s.deleted = 0")
        ->leftJoin('SubjectsLang', 'sl.subjectid = s.id AND sl.langid = 1','sl')
        ->leftJoin('Depts', 'd.id = s.deptid','d')
        ->orderBy('s.deptid ASC,s.id DESC');

        $data = $this->master::builderPermission($data,$perL,'p');
        $data = \FilterSetting::getDataOrder($this,$data,($this->className)::findFirst(),'s',['sl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,($this->className)::arrayFilter(),['s',['sl'=>['title']]]);

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
            if(!$subjects = ($this->className)::findFirstIdPermission($id,$perL)){
                $data['error'] = ['Không tìm thấy môn học'];
                $this->helper->responseJson($this, $data);
            }
            $subjects->updatedat = date('Y-m-d H:i:s');
            $subjects->updatedby = $userid;
        }else{
            $subjects = new \Subjects();
            $subjects->author = $this->session->get('userid');
            $subjects->deptid = $this->session->get('deptid');
            $subjects->createdat = date('Y-m-d H:i:s');
            $subjects->updatedat = $subjects->createdat;
            $subjects->createdby = $userid;
            $subjects->updatedby = $userid;
        }
        $subjectLangs = [];

        foreach ($languages as $key => $lang) {

            if(!$id || !$subjectLang = \SubjectsLang::findFirst(["subjectid = :id: AND langid = :langid:",'bind' => ['id' => (int)$id,'langid' => $lang->id]])){
                $subjectLang = new \SubjectsLang();
            }

            if($key == 0){
                $lId = $lang->id;
            }

            $subjectLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $subjectLang->content = !empty($pContent[$lang->id]) ? $pContent[$lang->id] : $pContent[$lId];
            $subjectLang->excerpt = !empty($pExcerpt[$lang->id]) ? $pExcerpt[$lang->id] : $pExcerpt[$lId];
            $subjectLang->langid = $lang->id;
            array_push($subjectLangs,$subjectLang);
        }

        $plug = $this->request->getPost('slug',['string','trim']);
        $subjects->attrid = $this->request->getPost('attrid',['int']);
        $subjects->status = $this->request->getPost('status',['int']);
        $subjects->slug = $plug ? $plug : $this->helper->slugify($pTitle[1]);
        $subjects->image = $this->request->getPost('image',['trim','string']);
        $subjects->bgimage = $this->request->getPost('bgimage',['trim','string']);

        if(($this->className)::findFirst(["slug = :slug: AND id != :id:","bind" => ["slug" => $subjects->slug,'id'=> $id]])){
            $reqPost['slug'] = $subjects->slug .'-'. strtotime('now');
        }

        try {
            $this->db->begin();
            $subjects->vdUpdate(true);
            if (!$subjects->save()) {
                foreach ($subjects->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            foreach ($subjectLangs as $subjectLang) {
                $subjectLang->subjectid = $subjects->id;
                $subjectLang->vdUpdate(true);
                if (!$subjectLang->save()) {
                    foreach ($subjectLang->getMessages() as $message) {
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
        \Logs::saveLogs($this, 3, "Xóa tạm môn học ID: {$item->id}", ['table' => 'Subjects','id' => $item->id]);
    }

    private function getJsCss(){
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/subjects.js');
    }
}