<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\StaffsForm;
use Backend\Modules\Admins\Forms\StaffsLangForm;
use Backend\Modules\Admins\Forms\SearchStaffsForm;

class StaffsController  extends \BackendController {

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $filters = \Staffs::findFilters();
        $tables = \Staffs::findTables();
        $fFilters = ['title','email','status','createdat'];
        $fTables = ['image','title','email','dean','createdat','slug','status'];
        if($fSetting = \FilterSetting::findFirstKey('staffs')){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $title = "Tổ chức Cán bộ";
        $this->getJsCss();
        $this->view->searchForm = new SearchStaffsForm();
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

        $filters = \Staffs::findTrashFilters();
        $tables = \Staffs::findTrashTables();
        $fFilters = ['title','email','status','createdat'];
        $fTables = ['image','title','email','dean','createdat','slug','status'];
        if($fSetting = \FilterSetting::findFirstKey('trashstaffs')){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $title = "Tổ chức Cán bộ";
        $this->getJsCss();
        $this->view->searchForm = new SearchStaffsForm();
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

        $perEdit = $this->master::checkPermissionDepted('staffs', 'update',1);
        $perView = $this->master::checkPermissionDepted('staffs', 'index');
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
        $staffsLang = [];
        $staffContent = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$staffs = \Staffs::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }         
            foreach ($languages as $key => $lang) {
                $v = ($key == 0 ? true : false);
                $staffLang = \StaffsLang::findFirst(['staffid = :id: AND langid = :langid:','bind' => ['id' => $staffs->id, 'langid' => $lang->id]]);
                if($staffLang){
                    $formLang = new StaffsLangForm($staffLang, [$lang->id,$v]);
                    $staffsLang[$lang->id] = $staffLang;
                    $formsLang[$lang->id] = $formLang;
                    $staffContent[$lang->id] = $staffLang->content;
                }else{
                    $formsLang[$lang->id] = new StaffsLangForm(null, [$lang->id,$v]);
                    $staffsLang[$lang->id] = new \StaffsLang();
                    $staffContent[$lang->id] = '';
                }
            }
            $title = 'Chỉnh sửa';
        }else{
            $staffs = new \Staffs();
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new StaffsLangForm(null, [$lang->id,$v]);
                $staffsLang[$lang->id] = new \StaffsLang();
                $staffContent[$lang->id] = '';
            }
        }

        $formStaffs = new StaffsForm($staffs);
        $this->view->perEdit = $perEdit ? 1 : "";
        $this->view->perView = $perView ? 1 : "";
        $this->view->languages = $languages;
        $this->view->staffContent = $staffContent;
        $this->view->formsLang = $formsLang;
        $this->view->formStaffs = $formStaffs;
        $this->view->staffs = $staffs;
        $this->view->staffsLang = $staffsLang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->getJsCss();
    }

    // =================================
    // API
    // =================================
    // Get data
    public function ajaxgetdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('staffs', 'index')) {
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
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['s' => "Staffs"])
        ->where("s.deleted = 0 AND s.status != 4")
        ->leftJoin('StaffsLang', 'sl.staffid = s.id AND sl.langid = 1','sl')
        ->leftJoin('Depts', 'd.id = s.deptid','d')
        ->orderBy('s.createdat DESC');

        $data = $this->master::builderPermission($data,$perL,'p');
        $data = \FilterSetting::getDataOrder($this,$data,\Staffs::findFirst(),'s',['sl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,\Staffs::arrayFilter(),['s',['sl'=>['title']]]);

        $array_row = [
            'u' => $this->master::checkPermission('staffs', 'update', 1)
        ];

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $array_row));
    }

    public function ajaxgetdatatrashAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('staffs', 'index')) {
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
            'u.fullname authorname',
            'd.slug dslug',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['s' => "Staffs"])
        ->where("s.deleted = 0 AND s.status = 4")
        ->leftJoin('User', 'u.id = s.author','u')
        ->leftJoin('StaffsLang', 'sl.staffid = s.id AND sl.langid = 1','sl')
        ->leftJoin('Depts', 'd.id = s.deptid','d')
        ->orderBy('s.createdat DESC');

        $data = $this->master::builderPermission($data,$perL,'s');
        $data = \FilterSetting::getDataOrder($this,$data,\Staffs::findFirst(),'s',['sl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,\Staffs::arrayTrashFilter(),['s',['sl'=>['title']]]);

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
            if(!$staffs = \Staffs::findFirstIdPermission($id,$perL)){
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

        if(\Staffs::findFirst(["slug = :slug: AND id != :id:","bind" => ["slug" => $staffs->slug,'id'=> $id]])){
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

    public function restoreAction(){
        $this->view->disable();
        if(!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('staffs','delete',1)){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Staffs::findPermission($perL,"*",['status = 4 AND id IN (' . $strIds . ')']);

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
        if(!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('staffs','delete',1)){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Staffs::findPermission($perL,"*",['id IN (' . $strIds . ')']);

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
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('staffs', 'delete')) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Staffs::findPermission($perL,"*",['status = 4 AND id IN (' . $strIds . ')']);

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
        \Logs::saveLogs($this, 3, "Xóa tạm môn học ID: {$item->id}", ['table' => 'Staffs','id' => $item->id]);
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
        \Logs::saveLogs($this, 5, "Khôi phục môn học ID: {$item->id}", ['table' => 'Staffs','id' => $item->id]);
    }

    private function deleteOne($item){
        $itemOld = $item->toArray();
        if (!$item->delete()) {
            foreach ($item->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        $data = \StaffsLang::find([
            'staffid = :staffid:',
            'bind' => ['staffid' => $itemOld['id']]
        ]);
        foreach ($data as $it) {
            if (!$it->delete()) {
                foreach ($it->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
        }
        \Logs::saveLogs($this, 4, "Xóa môn học ID: {$itemOld['id']}", ['table' => 'Staffs','id' => $itemOld['id']]);
    }

    private function getJsCss(){
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/staffs.js');
    }
}