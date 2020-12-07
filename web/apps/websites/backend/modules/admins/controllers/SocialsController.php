<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\CategoriesForm;
use Backend\Modules\Admins\Forms\CategoriesLangForm;
use Backend\Modules\Admins\Forms\SearchCategoriesForm;

class SocialsController  extends \BackendController {

    private $title = "Chuyên mục";

    private $cler = "categories";

    private $className = \Categories::class;

    private $classNameLang = \CategoriesLang::class;

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $this->getJsCss();
        $this->view->searchForm = new SearchCategoriesForm();
        $this->view->title = $this->title;
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
                $catLang = ($this->classNameLang)::findFirst(['catid = :id: AND langid = :langid:','bind' => ['id' => $items->id, 'langid' => $lang->id]]);
                if($catLang){
                    $formLang = new CategoriesLangForm($catLang, [$lang->id,$v]);
                    $formsLang[$lang->id] = $formLang;
                }else{
                    $formsLang[$lang->id] = new CategoriesLangForm(null, [$lang->id,$v]);
                }
            }
            $title = 'Chỉnh sửa';
        }else{
            $items = new \Categories();
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new CategoriesLangForm(null, [$lang->id,$v]);
            }
        }

        $form = new CategoriesForm($items);
        // var_dump($formsLang);die;
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
    // ===============================
    // API
    // ===============================
    public function ajaxgetdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted($this->cler, 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $columns = [
            'c.id',
            'c.slug',
            'c.status',
            'c.deptid',
            'c.createdat',
            'c.image',
            'cl.title',
            'cl.excerpt',
            'd.slug dslug',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['c' => "Categories"])
        ->where("c.deleted = 0")
        ->leftJoin('CategoriesLang', 'cl.catid = c.id AND cl.langid = 1','cl')
        ->leftJoin('Depts', 'd.id = c.deptid','d')
        ->orderBy('c.deptid ASC');

        $data = $this->master::builderPermission($data,$perL,'c');
        $data = \FilterSetting::getDataOrder($this,$data,($this->className)::findFirst(),'c',['cl'=>'name']);
        $data = \FilterSetting::getDataFilter($this,$data,($this->className)::arrayFilter(),['c',['cl'=>['name']]]);

        $array_row = [
            'u' => $this->master::checkPermission($this->cler, 'update', 1)
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
        if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted($this->cler,'update')){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pDes = $this->request->getPost('excerpt',['string','trim']);
        if($id){
            if(!$categories = ($this->className)::findFirstIdPermission($id,$perL)){
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
            if(!$id || !$categoriesLang = ($this->classNameLang)::findFirst(["catid = :id: AND langid = :langid:",'bind' => ['id' => (int)$id,'langid' => $lang->id]])){
                $categoriesLang = new \CategoriesLang();
            }
            if($key == 0){
                $lId = $lang->id;
            }
            $categoriesLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $categoriesLang->excerpt = !empty($pDes[$lang->id]) ? $pDes[$lang->id] : $pDes[$lId];
            $categoriesLang->langid = $lang->id;
            array_push($categoriesLangs,$categoriesLang);
        }

        $clug = $this->request->getPost('slug',['string','trim']);
        $categories->status = $this->request->getPost('status',['int']);
        $categories->slug = $clug ? $clug : $this->helper->slugify($pTitle[1]);
        $categories->image = $this->request->getPost('image',['trim','string']);

        if(($this->className)::findFirst(["slug = :slug: AND id != :id:","bind" => ["slug" => $categories->slug,'id'=> $id]])){
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
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted($this->cler, 'delete')) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        $listId = $this->request->getPost('dataId');
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }

        $listId = $this->helper->filterListIds($listId);
        $strIds = implode(',', $listId);

        $data = ($this->className)::findPermission($perL,"*",['id IN (' . $strIds . ')']);
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
        $data = ($this->classNameLang)::find([
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