<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\StaffsForm;
use Backend\Modules\Admins\Forms\StaffsLangForm;
use Backend\Modules\Admins\Forms\SearchStaffsForm;

class StaffsController  extends \BackendController {

    private $title = "Tổ chức Cán bộ";

    private $cler = "staffs";

    private $className = \Staffs::class;

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $filters = ($this->className)::findFilters();
        $tables = ($this->className)::findTables();
        $fFilters = ['title','email','status','createdat'];
        $fTables = ['image','title','email','dean','deptposition','createdat','slug','status'];
        if($fSetting = \FilterSetting::findFirstKey($this->cler)){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $this->view->searchForm = new SearchStaffsForm();
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
                $itemsLang = \StaffsLang::findFirst(['staffid = :id: AND langid = :langid:','bind' => ['id' => $items->id, 'langid' => $lang->id]]);
                if($itemsLang){
                    $formLang = new StaffsLangForm($itemsLang, [$lang->id,$v]);
                    $formsLang[$lang->id] = $formLang;
                }else{
                    $formsLang[$lang->id] = new StaffsLangForm(null, [$lang->id,$v]);
                }
            }
            $title = 'Chỉnh sửa';
        }else{
            $items = new \Staffs();
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new StaffsLangForm(null, [$lang->id,$v]);
            }
        }

        $form = new StaffsForm($items);
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
            's.image',
            's.email',
            's.dean',
            's.deptposition',
            's.createdat',
            's.deptid',
            's.status',
            's.sort',
            'sl.title',
            'sl.content',
            'd.slug dslug',
            '(SELECT dl.title FROM DeptsLang AS dl WHERE dl.deptid = s.deptid AND dl.langid = 1) AS deptname',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['s' => "Staffs"])
        ->where("s.deleted = 0")
        ->leftJoin('StaffsLang', 'sl.staffid = s.id AND sl.langid = 1','sl')
        ->leftJoin('Depts', 'd.id = s.deptid','d')
        ->orderBy('s.deptid ASC,s.id DESC');

        $data = $this->master::builderPermission($data,$perL,'s');
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
            if(!$staffs = ($this->className)::findFirstIdPermission($id,$perL)){
                $data['error'] = ['Không tìm thấy môn học'];
                $this->helper->responseJson($this, $data);
            }
            $staffs->updatedat = date('Y-m-d H:i:s');
            $staffs->updatedby = $userid;
        }else{
            $staffs = new \Staffs();
            $staffs->author = $this->session->get('userid');
            $staffs->deptid = $this->session->get('deptid');
            $staffs->createdat = date('Y-m-d H:i:s');
            $staffs->updatedat = $staffs->createdat;
            $staffs->createdby = $userid;
            $staffs->updatedby = $userid;
        }
        $staffLangs = [];

        foreach ($languages as $key => $lang) {

            if(!$id || !$staffLang = \StaffsLang::findFirst(["staffid = :id: AND langid = :langid:",'bind' => ['id' => (int)$id,'langid' => $lang->id]])){
                $staffLang = new \StaffsLang();
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

        if(($this->className)::findFirst(["slug = :slug: AND id != :id:","bind" => ["slug" => $staffs->slug,'id'=> $id]])){
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
        \Logs::saveLogs($this, 3, "Xóa tạm cán bộ ID: {$item->id}", ['table' => 'Staffs','id' => $item->id]);
    }

    private function getJsCss(){
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/staffs.js');
    }
}