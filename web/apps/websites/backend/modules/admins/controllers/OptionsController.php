<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\OptionsForm;
use Backend\Modules\Admins\Forms\OptionsLangForm;

class OptionsController  extends \BackendController {

    public function indexAction(){

        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $perEdit = $this->master::checkPermissionDepted('options', 'update',1);
        $perView = $this->master::checkPermissionDepted('options', 'index');
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
        $optionsLang = [];
        $pageContent = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$options = \Options::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }         
            foreach ($languages as $key => $lang) {
                $v = ($key == 0 ? true : false);
                $pageLang = \OptionsLang::findFirst(['pageid = :id: AND langid = :langid:','bind' => ['id' => $page->id, 'langid' => $lang->id]]);
                if($pageLang){
                    $formLang = new OptionsLangForm($pageLang, [$lang->id,$v]);
                    $optionsLang[$lang->id] = $pageLang;
                    $formsLang[$lang->id] = $formLang;
                    $pageContent[$lang->id] = $pageLang->content;
                }else{
                    $formsLang[$lang->id] = new OptionsLangForm(null, [$lang->id,$v]);
                    $optionsLang[$lang->id] = new \OptionsLang();
                    $pageContent[$lang->id] = '';
                }
            }
            $title = 'Chỉnh sửa';
        }else{
            $options = new \Options();
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $v = $key == 0 ? true : false;
                $formsLang[$lang->id] = new OptionsLangForm(null, [$lang->id,$v]);
                $optionsLang[$lang->id] = new \OptionsLang();
                $pageContent[$lang->id] = '';
            }
        }

        $formOptions = new OptionsForm($options);

        $this->view->perEdit = $perEdit ? 1 : "";
        $this->view->perView = $perView ? 1 : "";
        $this->view->languages = $languages;
        $this->view->pageContent = $pageContent;
        $this->view->formsLang = $formsLang;
        $this->view->formOptions = $formOptions;
        $this->view->options = $options;
        $this->view->optionsLang = $optionsLang;
        $this->view->title = $title;
        $this->getJsCss();
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
        if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('options','update')){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pContent = $this->request->getPost('content',['trim']);
        $pExcerpt = $this->request->getPost('excerpt',['string','trim']);
        if($id){
            if(!$page = \Options::findFirstIdPermission($id,$perL)){
                $data['error'] = ['Không tìm thấy trang'];
                $this->helper->responseJson($this, $data);
            }
            $page->updatedat = date('Y-m-d H:i:s');
            $page->updatedby = $userid;
        }else{
            $page = new \Options();
            $page->author = $this->session->get('userid');
            $page->deptid = $this->session->get('deptid');
            $page->createdat = date('Y-m-d H:i:s');
            $page->updatedat = $page->createdat;
            $page->createdby = $userid;
            $page->updatedby = $userid;
        }
        $pageLangs = [];

        foreach ($languages as $key => $lang) {

            if(!$id || !$pageLang = \OptionsLang::findFirst(["pageid = :id: AND langid = :langid:",'bind' => ['id' => (int)$id,'langid' => $lang->id]])){
                $pageLang = new \OptionsLang();
            }

            if($key == 0){
                $lId = $lang->id;
            }

            $pageLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $pageLang->content = !empty($pContent[$lang->id]) ? $pContent[$lang->id] : $pContent[$lId];
            $pageLang->excerpt = !empty($pExcerpt[$lang->id]) ? $pExcerpt[$lang->id] : $pExcerpt[$lId];
            $pageLang->langid = $lang->id;
            array_push($pageLangs,$pageLang);
        }

        $plug = $this->request->getPost('slug',['string','trim']);
        $page->attrid = $this->request->getPost('attrid',['int']);
        $page->status = $this->request->getPost('status',['int']);
        $page->slug = $plug ? $plug : $this->helper->slugify($pTitle[1]);
        $page->image = $this->request->getPost('image',['trim','string']);
        $page->bgimage = $this->request->getPost('bgimage',['trim','string']);

        if(\Options::findFirst(["slug = :slug: AND id != :id:","bind" => ["slug" => $page->slug,'id'=> $id]])){
            $reqPost['slug'] = $page->slug .'-'. strtotime('now');
        }

        try {
            $this->db->begin();
            $page->vdUpdate(true);
            if (!$page->save()) {
                foreach ($page->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            foreach ($pageLangs as $pageLang) {
                $pageLang->pageid = $page->id;
                $pageLang->vdUpdate(true);
                if (!$pageLang->save()) {
                    foreach ($pageLang->getMessages() as $message) {
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

    // =================================
    // FUNCTION
    // =================================

    private function getJsCss(){
        $this->assets->addJs(WEB_URI.'/assets/backend/js/modules/admins/setting.js');
    }
}