<?php
namespace Backend\Modules\Admins\Controllers;

class OptionsController  extends \BackendController {

    public $title = "Trang thông tin";

    public $cler = "options";

    public $className = \Depts::class;

    public $classNameLang = \DeptsLang::class;

    public $itemsForm = \Backend\Modules\Admins\Forms\OptionsForm::class;

    public $itemsLangFrom = \Backend\Modules\Admins\Forms\OptionsLangForm::class;

    public function indexAction(){

        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }
        $perEdit = $this->master::checkPermissionDepted("depts", 'update',1);
        $perView = $this->master::checkPermissionDepted("depts", 'index');
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
        $id = $this->session->get('deptid');

        if(!$items = ($this->className)::findFirstId($id)){
            echo 'Không tìm thấy dữ liệu'; die;
        }         
        foreach ($languages as $key => $lang) {
            $v = ($key == 0 ? true : false);
            $itemsLang = ($this->classNameLang)::findFirst(["deptid = :id: AND langid = :langid:",'bind' => ['id' => $items->id, 'langid' => $lang->id]]);
            if($itemsLang){
                $formLang = new $this->itemsLangFrom($itemsLang, [$lang->id,$v]);
                $formsLang[$lang->id] = $formLang;
            }else{
                $formsLang[$lang->id] = new $this->itemsLangFrom(null, [$lang->id,$v]);
            }
        }

        $form = new $this->itemsForm($items);

        $this->view->perEdit = $perEdit ? 1 : "";
        $this->view->perView = $perView ? 1 : "";
        $this->view->languages = $languages;
        $this->view->formsLang = $formsLang;
        $this->view->form = $form;
        $this->view->items = $items;
        $this->view->title = 'Thiết lập chung';
        $this->view->cler = "depts";
        $this->assets->addJs(WEB_URI.'/elfinder/js/require.min.js');
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/templates/views.js');
        return $this->view->pick('templates/views');
    }

    // =================================
    // API
    // =================================
    // Get data

    // Update data
    public function updateAction($id = 0){
        $this->view->disable();
        if (!$this->security->checkToken()) {
            $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            $data['error'] = ['Token không chính xác'];
            $this->helper->responseJson($this, $data);
        }
        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
        if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted("depts",'update',1)){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        $id = $this->session->get('deptid');
        if(!$items = ($this->className)::findFirstIdPermission($id,$perL)){
            $data['error'] = ["Không tìm thấy {}"];
            $this->helper->responseJson($this, $data);
        }
        $items->updatedat = date('Y-m-d H:i:s');
        $items->updatedby = $userid;

        $itemsLangs = [];
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pExcerpt = $this->request->getPost('excerpt',['string','trim']);
        $pAddress = $this->request->getPost('address',['string','trim']);
        foreach ($languages as $key => $lang) {
            if(!$items->id || !$itemsLang = ($this->classNameLang)::findFirst(["deptid = :id: AND langid = :langid:",'bind' => ['id' => $id,'langid' => $lang->id]])){
                $itemsLang = new $this->classNameLang;
            }
            if($key == 0){
                $lId = $lang->id;
            }
            $itemsLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $itemsLang->address = !empty($pAddress[$lang->id]) ? $pAddress[$lang->id] : $pAddress[$lId];
            $itemsLang->excerpt = !empty($pExcerpt[$lang->id]) ? $pExcerpt[$lang->id] : $pExcerpt[$lId];
            $itemsLang->langid = $lang->id;
            array_push($itemsLangs,$itemsLang);
        }

        $items->dcode = $this->request->getPost('dcode',['trim','string']);
        $items->phone = $this->request->getPost('phone',['trim','string']);
        $items->email = $this->request->getPost('email',['trim','string']);
        $items->link = $this->request->getPost('link',['trim','string']);
        $items->image = $this->request->getPost('image',['trim','string']);
        $items->logo = $this->request->getPost('logo',['trim','string']);
        $items->icon = $this->request->getPost('icon',['trim','string']);

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
            \Logs::saveLogs($this, 2, "Thiết lập chung khoa/ bộ môn ", ['table' => $this->className,'id' => $items->id]);
            $this->flashSession->success("Cập nhật thành công");
        } catch (\Throwable $e) {
            $this->db->rollback();
            $data['error'] = [$e->getMessage()];
        }
        $this->helper->responseJson($this, $data);
    }
}