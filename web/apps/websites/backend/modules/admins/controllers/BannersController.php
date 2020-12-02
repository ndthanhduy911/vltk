<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\BannersForm;
use Backend\Modules\Admins\Forms\BannersLangForm;
use Backend\Modules\Admins\Forms\SearchBannersForm;

class BannersController  extends \BackendController {

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $filters = \Banners::findFilters();
        $tables = \Banners::findTables();
        $fFilters = ['title','status','createdat'];
        $fTables = ['image','title','excerpt','authorname','createdat','slug','status'];
        if($fSetting = \FilterSetting::findFirstKey('banners')){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $title = "Trang";
        $this->getJsCss();
        $this->view->searchForm = new SearchBannersForm();
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

        $filters = \Banners::findTrashFilters();
        $tables = \Banners::findTrashTables();
        $fFilters = ['title','createdat'];
        $fTables = ['image','title','excerpt','authorname','createdat','slug'];
        if($fSetting = \FilterSetting::findFirstKey('trashbanners')){
            $fFilters = $fSetting->filters ? json_decode($fSetting->filters) : $fFilters;
            $fTables = $fSetting->tables ? json_decode($fSetting->tables) : $fTables;   
        }
        $filters = \FilterSetting::mapFilter($fFilters,$filters);
        $tables = \FilterSetting::mapFilter($fTables,$tables);
        $fFilters = array_intersect($fFilters,$filters);
        $fTables = array_intersect($fTables,$tables);

        $title = "Trang";
        $this->getJsCss();
        $this->view->searchForm = new SearchBannersForm();
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

        $perEdit = $this->master::checkPermissionDepted('banners', 'update',1);
        $perView = $this->master::checkPermissionDepted('banners', 'index');
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
        $bannersLang = [];
        $bannerContent = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$banner = \Banners::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }         
            foreach ($languages as $key => $lang) {
                $v = ($key == 0 ? true : false);
                $bannerLang = \BannersLang::findFirst(['bannerid = :id: AND langid = :langid:','bind' => ['id' => $banner->id, 'langid' => $lang->id]]);
                if($bannerLang){
                    $formLang = new BannersLangForm($bannerLang, [$lang->id,$v]);
                    $bannersLang[$lang->id] = $bannerLang;
                    $formsLang[$lang->id] = $formLang;
                    $bannerContent[$lang->id] = $bannerLang->content;
                }else{
                    $formsLang[$lang->id] = new BannersLangForm(null, [$lang->id,$v]);
                    $bannersLang[$lang->id] = new \BannersLang();
                    $bannerContent[$lang->id] = '';
                }
            }
            $title = 'Chỉnh sửa';
            $banner->updatedat = date('Y-m-d H:i:s');
        }else{
            $banner = new \Banners();
            $banner->author = $this->session->get('userid');
            $banner->deptid = $this->session->get('deptid');
            $banner->createdat = date('Y-m-d H:i:s');
            $banner->updatedat = $banner->createdat;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new BannersLangForm(null, [$lang->id,$v]);
                $bannersLang[$lang->id] = new \BannersLang();
                $bannerContent[$lang->id] = '';
            }
        }

        $formPage = new BannersForm($banner);

        $this->view->perEdit = $perEdit ? 1 : "";
        $this->view->perView = $perView ? 1 : "";
        $this->view->languages = $languages;
        $this->view->bannerContent = $bannerContent;
        $this->view->formsLang = $formsLang;
        $this->view->formPage = $formPage;
        $this->view->banner = $banner;
        $this->view->bannersLang = $bannersLang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->getJsCss();
    }

    // =================================
    // API
    // =================================
    // Get data
    public function ajaxgetdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('banners', 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $columns = [
            'p.id',
            'p.slug',
            'p.attrid',
            'p.status',
            'p.deptid',
            'p.createdat',
            'p.image',
            'p.bgimage',
            'pl.title',
            'pl.content',
            'pl.excerpt',
            'u.fullname authorname',
            'd.slug dslug',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['p' => "Banners"])
        ->where("p.deleted = 0 AND p.status != 4")
        ->leftJoin('BannersLang', 'pl.bannerid = p.id AND pl.langid = 1','pl')
        ->leftJoin('Depts', 'd.id = p.deptid','d')
        ->orderBy('p.createdat DESC');

        $data = $this->master::builderPermission($data,$perL,'p');
        $data = \FilterSetting::getDataOrder($this,$data,\Banners::findFirst(),'p',['pl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,\Banners::arrayFilter(),['p',['pl'=>['title']]]);

        $array_row = [
            'u' => $this->master::checkPermission('banners', 'update', 1)
        ];

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $array_row));
    }

    public function ajaxgetdatatrashAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('banners', 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $columns = [
            'p.id',
            'p.slug',
            'p.attrid',
            'p.status',
            'p.deptid',
            'p.createdat',
            'p.image',
            'p.bgimage',
            'pl.title',
            'pl.content',
            'pl.excerpt',
            'u.fullname authorname',
            'd.slug dslug',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['p' => "Banners"])
        ->where("p.deleted = 0 AND p.status = 4")
        ->leftJoin('BannersLang', 'pl.bannerid = p.id AND pl.langid = 1','pl')
        ->leftJoin('Depts', 'd.id = p.deptid','d')
        ->orderBy('p.createdat DESC');

        $data = $this->master::builderPermission($data,$perL,'p');
        $data = \FilterSetting::getDataOrder($this,$data,\Banners::findFirst(),'p',['pl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,\Banners::arrayTrashFilter(),'p');

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
        if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('banners','update')){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pContent = $this->request->getPost('content',['trim']);
        $pExcerpt = $this->request->getPost('excerpt',['string','trim']);
        if($id){
            if(!$banner = \Banners::findFirstIdPermission($id,$perL)){
                $data['error'] = ['Không tìm thấy banner'];
                $this->helper->responseJson($this, $data);
            }
            $banner->updatedat = date('Y-m-d H:i:s');
            $banner->updatedby = $userid;
        }else{
            $banner = new \Banners();
            $banner->author = $this->session->get('userid');
            $banner->deptid = $this->session->get('deptid');
            $banner->createdat = date('Y-m-d H:i:s');
            $banner->updatedat = $banner->createdat;
            $banner->createdby = $userid;
            $banner->updatedby = $userid;
        }
        $bannerLangs = [];

        foreach ($languages as $key => $lang) {

            if(!$id || !$bannerLang = \BannersLang::findFirst(["bannerid = :id: AND langid = :langid:",'bind' => ['id' => (int)$id,'langid' => $lang->id]])){
                $bannerLang = new \BannersLang();
            }

            if($key == 0){
                $lId = $lang->id;
            }

            $bannerLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $bannerLang->content = !empty($pContent[$lang->id]) ? $pContent[$lang->id] : $pContent[$lId];
            $bannerLang->excerpt = !empty($pExcerpt[$lang->id]) ? $pExcerpt[$lang->id] : $pExcerpt[$lId];
            $bannerLang->langid = $lang->id;
            array_push($bannerLangs,$bannerLang);
        }

        $plug = $this->request->getPost('slug',['string','trim']);
        $banner->attrid = $this->request->getPost('attrid',['int']);
        $banner->status = $this->request->getPost('status',['int']);
        $banner->slug = $plug ? $plug : $this->helper->slugify($pTitle[1]);
        $banner->image = $this->request->getPost('image',['trim','string']);
        $banner->bgimage = $this->request->getPost('bgimage',['trim','string']);

        if(\Banners::findFirst(["slug = :slug: AND id != :id:","bind" => ["slug" => $banner->slug,'id'=> $id]])){
            $reqPost['slug'] = $banner->slug .'-'. strtotime('now');
        }

        try {
            $this->db->begin();
            $banner->vdUpdate(true);
            if (!$banner->save()) {
                foreach ($banner->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            foreach ($bannerLangs as $bannerLang) {
                $bannerLang->bannerid = $banner->id;
                $bannerLang->vdUpdate(true);
                if (!$bannerLang->save()) {
                    foreach ($bannerLang->getMessages() as $message) {
                        throw new \Exception($message->getMessage());
                    }
                }
            }
            $this->db->commit();
            $this->flashSession->success(($id ? 'Chỉnh sửa' : 'Thêm mới').' banner thành công');
        } catch (\Throwable $e) {
            $this->db->rollback();
            $data['error'] = [$e->getMessage()];
        }
        $this->helper->responseJson($this, $data);
    }

    public function restoreAction(){
        $this->view->disable();
        if(!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('banners','delete',1)){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Banners::findPermission($perL,"*",['status = 4 AND id IN (' . $strIds . ')']);

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
        if(!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('banners','delete',1)){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Banners::findPermission($perL,"*",['id IN (' . $strIds . ')']);

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
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('banners', 'delete')) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Banners::findPermission($perL,"*",['status = 4 AND id IN (' . $strIds . ')']);

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
        \Logs::saveLogs($this, 3, "Xóa tạm banner ID: {$item->id}", ['table' => 'Banners','id' => $item->id]);
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
        \Logs::saveLogs($this, 5, "Khôi phục banner ID: {$item->id}", ['table' => 'Banners','id' => $item->id]);
    }

    private function deleteOne($item){
        $itemOld = $item->toArray();
        if (!$item->delete()) {
            foreach ($item->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        $data = \BannersLang::find([
            'bannerid = :bannerid:',
            'bind' => ['bannerid' => $itemOld['id']]
        ]);
        foreach ($data as $it) {
            if (!$it->delete()) {
                foreach ($it->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
        }
        \Logs::saveLogs($this, 4, "Xóa banner ID: {$itemOld['id']}", ['table' => 'Banners','id' => $itemOld['id']]);
    }

    private function getJsCss(){
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/banners.js');
    }
}