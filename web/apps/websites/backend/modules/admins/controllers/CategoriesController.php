<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\CategoriesForm;
use Backend\Modules\Admins\Forms\CategoriesLangForm;
use Backend\Modules\Admins\Forms\SearchCategoriesForm;

class CategoriesController  extends \BackendController {

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $title = "Chuyên mục";
        $this->getJsCss();
        $this->view->searchForm = new SearchCategoriesForm();
        $this->view->title = $title;
    }
    public function viewAction($id = 0){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $perEdit = $this->master::checkPermissionDepted('categories', 'update',1);
        $perView = $this->master::checkPermissionDepted('categories', 'index');
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
        $catsLang = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$cat = \Categories::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }         
            foreach ($languages as $key => $lang) {
                $v = ($key == 0 ? true : false);
                $catLang = \CategoriesLang::findFirst(['catid = :id: AND langid = :langid:','bind' => ['id' => $cat->id, 'langid' => $lang->id]]);
                if($catLang){
                    $formLang = new CategoriesLangForm($catLang, [$lang->id,$v]);
                    $catsLang[$lang->id] = $catLang;
                    $formsLang[$lang->id] = $formLang;
                }else{
                    $formsLang[$lang->id] = new CategoriesLangForm(null, [$lang->id,$v]);
                    $catsLang[$lang->id] = new \CategoriesLang();
                }
            }
            $title = 'Chỉnh sửa';
        }else{
            $cat = new \Categories();
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new CategoriesLangForm(null, [$lang->id,$v]);
                $catsLang[$lang->id] = new \CategoriesLang();
            }
        }

        $formCat = new CategoriesForm($cat);

        $this->view->perEdit = $perEdit ? 1 : "";
        $this->view->perView = $perView ? 1 : "";
        $this->view->languages = $languages;
        $this->view->formsLang = $formsLang;
        $this->view->formCat = $formCat;
        $this->view->cat = $cat;
        $this->view->catsLang = $catsLang;
        $this->view->title = $title;
        $this->getJsCss();
    }
    // ===============================
    // API
    // ===============================
    public function ajaxgetdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('categories', 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $columns = [
            'c.id',
            'c.slug',
            'c.status',
            'c.deptid',
            'c.createdat',
            'c.image',
            'cl.name',
            'cl.description',
            'd.slug dslug',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['c' => "Categories"])
        ->where("c.deleted = 0")
        ->leftJoin('CategoriesLang', 'cl.catid = c.id AND cl.langid = 1','cl')
        ->leftJoin('Depts', 'd.id = c.deptid','d')
        ->orderBy('c.deptid ASC');

        $data = $this->master::builderPermission($data,$perL,'p');
        $data = \FilterSetting::getDataOrder($this,$data,\Categories::findFirst(),'c',['cl'=>'name']);
        $data = \FilterSetting::getDataFilter($this,$data,\Categories::arrayFilter(),['c',['cl'=>['name']]]);

        $array_row = [
            'u' => $this->master::checkPermission('categories', 'update', 1)
        ];

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $array_row));
    }
    // ===================================
    // Update data
    // ===================================
    public function updateAction($id = 0){
        $this->view->disable();
        if (!$this->security->checkToken()) {
            $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            $data['error'] = ['Token không chính xác'];
            $this->helper->responseJson($this, $data);
        }
        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
        if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('categories','update')){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        $languages = \Language::find(['status = 1']);
        $pName = $this->request->getPost('name',['string','trim']);
        $pDes = $this->request->getPost('description',['string','trim']);
        if($id){
            if(!$categories = \Categories::findFirstIdPermission($id,$perL)){
                $data['error'] = ['Không tìm thấy chuyên mục'];
                $this->helper->responseJson($this, $data);
            }
            $categories->updatedat = date('Y-m-d H:i:s');
            $categories->updatedby = $userid;
        }else{
            $categories = new \Categories();
            $categories->deptid = $this->session->get('deptid');
            $categories->createdat = date('Y-m-d H:i:s');
            $categories->updatedat = $categories->createdat;
            $categories->createdby = $userid;
            $categories->updatedby = $userid;
        }
        $categoriesLangs = [];
        foreach ($languages as $key => $lang) {
            if(!$id || !$categoriesLang = \CategoriesLang::findFirst(["catid = :id: AND langid = :langid:",'bind' => ['id' => (int)$id,'langid' => $lang->id]])){
                $categoriesLang = new \CategoriesLang();
            }
            if($key == 0){
                $lId = $lang->id;
            }
            $categoriesLang->name = !empty($pName[$lang->id]) ? $pName[$lang->id] : $pName[$lId];
            $categoriesLang->description = !empty($pDes[$lang->id]) ? $pDes[$lang->id] : $pDes[$lId];
            $categoriesLang->langid = $lang->id;
            array_push($categoriesLangs,$categoriesLang);
        }

        $clug = $this->request->getPost('slug',['string','trim']);
        $categories->status = $this->request->getPost('status',['int','trim']);
        $categories->slug = $clug ? $clug : $this->helper->slugify($pName[1]);
        $categories->image = $this->request->getPost('image',['trim','string']);

        if(\Categories::findFirst(["slug = :slug: AND id != :id:","bind" => ["slug" => $categories->slug,'id'=> $id]])){
            $reqPost['slug'] = $categories->slug .'-'. strtotime('now');
        }

        try {
            $this->db->begin();
            $categories->vdUpdate(true);
            if (!$categories->save()) {
                foreach ($categories->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            foreach ($categoriesLangs as $categoriesLang) {
                $categoriesLang->catid = $categories->id;
                $categoriesLang->vdUpdate(true);
                if (!$categoriesLang->save()) {
                    foreach ($categoriesLang->getMessages() as $message) {
                        throw new \Exception($message->getMessage());
                    }
                }
            }
            $this->db->commit();
            $this->flashSession->success(($id ? 'Chỉnh sửa' : 'Thêm mới').' chuyên mục thành công');
        } catch (\Throwable $e) {
            $this->db->rollback();
            $data['error'] = [$e->getMessage()];
        }
        $this->helper->responseJson($this, $data);
    }
    public function deleteAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('categories', 'delete')) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = \Categories::findPermission($perL,"*",['id IN (' . $strIds . ')']);
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
    // ==============================
    // FUNCTION
    // ==============================
    private function deleteOne($item){
        $itemOld = $item->toArray();
        if (!$item->delete()) {
            foreach ($item->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }
        $data = \CategoriesLang::find([
            'catid = :catid:',
            'bind' => ['catid' => $itemOld['id']]
        ]);
        foreach ($data as $it) {
            $it->deleted = 1;
            if (!$it->save()) {
                foreach ($it->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
        }
        \Logs::saveLogs($this, 4, "Xóa chuyên mục ID: {$itemOld['id']}", ['table' => 'Categories','id' => $itemOld['id']]);
    }
    private function getJsCss (){
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/admins/categories.js');
    }
}