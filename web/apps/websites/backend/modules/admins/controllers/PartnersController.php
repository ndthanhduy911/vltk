<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\PartnersForm;
use Backend\Modules\Admins\Forms\PartnersLangForm;
use Backend\Modules\Admins\Forms\SearchPartnersForm;

class PartnersController  extends \BackendController {
    private $title = "Liên kết/ đối tác";

    private $cler = "partners";

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $filters = \Partners::findFilters();
        $tables = \Partners::findTables();
        $fFilters = ['title','status','createdat'];
        $fTables = ['image','title','excerpt','createdat','link','status'];
        if($fSetting = \FilterSetting::findFirstKey($this->cler)){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $this->getJsCss();
        $this->view->searchForm = new SearchPartnersForm();
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
            if(!$items = \Partners::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }         
            foreach ($languages as $key => $lang) {
                $v = ($key == 0 ? true : false);
                $itemsLang = \PartnersLang::findFirst(['partnerid = :id: AND langid = :langid:','bind' => ['id' => $items->id, 'langid' => $lang->id]]);
                if($itemsLang){
                    $formLang = new PartnersLangForm($itemsLang, [$lang->id,$v]);
                    $formsLang[$lang->id] = $formLang;
                }else{
                    $formsLang[$lang->id] = new PartnersLangForm(null, [$lang->id,$v]);
                }
            }
            $title = 'Chỉnh sửa';
        }else{
            $items = new \Partners();
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new PartnersLangForm(null, [$lang->id,$v]);
            }
        }

        $form = new PartnersForm($items);
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
            's.link',
            's.image',
            's.sort',
            's.deptid',
            's.createdat',
            's.status',
            'sl.title',
            'sl.excerpt',
            'd.slug dslug',
            '(SELECT dl.name FROM DeptsLang AS dl WHERE dl.deptid = s.deptid AND dl.langid = 1) AS deptname',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['s' => "Partners"])
        ->where("s.deleted = 0")
        ->leftJoin('PartnersLang', 'sl.partnerid = s.id AND sl.langid = 1','sl')
        ->leftJoin('Depts', 'd.id = s.deptid','d')
        ->orderBy('s.deptid ASC,s.id DESC');

        $data = $this->master::builderPermission($data,$perL,'p');
        $data = \FilterSetting::getDataOrder($this,$data,\Partners::findFirst(),'s',['sl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,\Partners::arrayFilter(),['s',['sl'=>['title']]]);

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
            if(!$partners = \Partners::findFirstIdPermission($id,$perL)){
                $data['error'] = ['Không tìm thấy liên kết/ đối tác'];
                $this->helper->responseJson($this, $data);
            }
            $partners->updatedat = date('Y-m-d H:i:s');
            $partners->updatedby = $userid;
        }else{
            $partners = new \Partners();
            $partners->author = $this->session->get('userid');
            $partners->deptid = $this->session->get('deptid');
            $partners->createdat = date('Y-m-d H:i:s');
            $partners->updatedat = $partners->createdat;
            $partners->createdby = $userid;
            $partners->updatedby = $userid;
        }
        $partnerLangs = [];

        foreach ($languages as $key => $lang) {

            if(!$id || !$partnerLang = \PartnersLang::findFirst(["partnerid = :id: AND langid = :langid:",'bind' => ['id' => (int)$id,'langid' => $lang->id]])){
                $partnerLang = new \PartnersLang();
            }

            if($key == 0){
                $lId = $lang->id;
            }

            $partnerLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $partnerLang->content = !empty($pContent[$lang->id]) ? $pContent[$lang->id] : $pContent[$lId];
            $partnerLang->excerpt = !empty($pExcerpt[$lang->id]) ? $pExcerpt[$lang->id] : $pExcerpt[$lId];
            $partnerLang->langid = $lang->id;
            array_push($partnerLangs,$partnerLang);
        }

        $plug = $this->request->getPost('slug',['string','trim']);
        $partners->attrid = $this->request->getPost('attrid',['int']);
        $partners->status = $this->request->getPost('status',['int']);
        $partners->slug = $plug ? $plug : $this->helper->slugify($pTitle[1]);
        $partners->image = $this->request->getPost('image',['trim','string']);
        $partners->bgimage = $this->request->getPost('bgimage',['trim','string']);

        if(\Partners::findFirst(["slug = :slug: AND id != :id:","bind" => ["slug" => $partners->slug,'id'=> $id]])){
            $reqPost['slug'] = $partners->slug .'-'. strtotime('now');
        }

        try {
            $this->db->begin();
            $partners->vdUpdate(true);
            if (!$partners->save()) {
                foreach ($partners->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            foreach ($partnerLangs as $partnerLang) {
                $partnerLang->partnerid = $partners->id;
                $partnerLang->vdUpdate(true);
                if (!$partnerLang->save()) {
                    foreach ($partnerLang->getMessages() as $message) {
                        throw new \Exception($message->getMessage());
                    }
                }
            }
            $this->db->commit();
            $this->flashSession->success(($id ? 'Chỉnh sửa' : 'Thêm mới').' liên kết/ đối tác thành công');
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

        $data = \Partners::findPermission($perL,"*",['deleted = 0 AND id IN (' . $strIds . ')']);

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
        \Logs::saveLogs($this, 3, "Xóa tạm liên kết/ đối tác ID: {$item->id}", ['table' => 'Partners','id' => $item->id]);
    }

    private function getJsCss(){
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/partners.js');
    }
}