<?php

namespace Backend\Modules\Setting\Controllers;
use Backend\Modules\Setting\Forms\MenusForm;
use Backend\Modules\Setting\Forms\MenusLangForm;

class MenusController  extends \BackendController
{
    public function indexAction(){
        $this->get_js_css();
        $this->view->menu_location = \MenuLocation::find(["dept_id = {$this->session->get('dept_id')}"]);
    }

    public function updateAction($location_id = 0){
        $forms_lang = [];
        $menus_lang = [];
        $languages = \Language::find(['status = 1']);
        $dept_id = $this->session->get('dept_id');
        $id = $this->request->get('id');
        if(!\MenuLocation::findFirst(['id = :id: AND dept_id = :dept_id:','bind' => ['id' => $location_id, 'dept_id' => $dept_id]])){
            $this->flashSession->error("Vị trí menu không đúng");
            return $this->response->redirect(WEB_ADMIN_URL.'/menu');
        }
        if($id){
            if(!$menu = \Menus::findFirst(["id = $id AND menu_location_id = $location_id AND dept_id = $dept_id"])){
                $this->flashSession->error("Không tìm thấy menu này");
                return $this->response->redirect(WEB_ADMIN_URL.'/menu');
            }
            $menu->updated_at = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $menu_lang = \MenusLang::findFirst(['menu_id = :id: AND lang_id = :lang_id:','bind' => ['id' => $menu->id, 'lang_id' => $lang->id]]);
                if($menu_lang){
                    $form_lang = new MenusLangForm($menu_lang);
                    $menus_lang[$lang->id] = $menu_lang;
                    $forms_lang[$lang->id] = $form_lang;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }
            $form_menu = new MenusForm($menu);   
        }else{
            $menu = new \Menus();
            $menu->created_at = date('Y-m-d H:i:s');
            $menu->updated_at = $menu->created_at;
            $menu->menu_location_id = $location_id;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $forms_lang[$lang->id] = new MenusLangForm();
                $menus_lang[$lang->id] = new \MenusLang();
            }
            $form_menu = new MenusForm($menu);
        }
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $m_name = $this->request->getPost('name',['string','trim']);
                $req_menu = [
                    'dept_id' => $menu->dept_id ? $menu->dept_id : $dept_id,
                    'menu_location_id' => $location_id,
                    'type' => $this->request->getPost('type',['int','trim']),
                    'status' => $this->request->getPost('status',['int','trim']),
                    'post_id' => $this->request->getPost('post_id',['int','trim']),
                    'page_id' => $this->request->getPost('page_id',['int','trim']),
                    'cat_id' => $this->request->getPost('cat_id',['int','trim']),
                    'dept' => $this->request->getPost('dept',['string','trim']),
                    'links' => $this->request->getPost('links',['string','trim']),
                    'icon' => $this->request->getPost('icon',['string','trim']),
                    'parent_id' => $this->request->getPost('parent_id',['int','trim']),
                    'sort' => $this->request->getPost('sort',['int','trim']),
                    'status' => $this->request->getPost('status',['int','trim']),
                    'target' => $this->request->getPost('target',['string','trim'])
                ];
                $req_menu['parent_id'] = $req_menu['parent_id'] ? $req_menu['parent_id'] : NULL;

                if($req_menu['parent_id'] && \Menus::findFirst(['parent_id = :parent_id:','bind' => ['parent_id' => $menu->id ? $menu->id : 0]])){
                    array_push($error, "Menu chỉ hỗ trợ 2 cấp");
                }
                
                $form_menu->bind($req_menu, $menu);
                if (!$form_menu->isValid()) {
                    foreach ($form_menu->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                foreach ($languages as $key => $lang) {
                    $req_menu_lang[$lang->id] = [
                        'name' => $m_name[$lang->id],
                        'lang_id' => $lang->id,
                    ];
                    $forms_lang[$lang->id]->bind($req_menu_lang[$lang->id], $menus_lang[$lang->id]);
                    if (!$forms_lang[$lang->id]->isValid()) {
                        foreach ($forms_lang[$lang->id]->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
                }

                if (!count($error)) {
                    if (!$menu->save()) {
                        foreach ($menu->getMessages() as $message) {
                            $this->flashSession->error($message);
                        }
                    } else {
                        foreach ($languages as $key => $lang) {
                            $menus_lang[$lang->id]->menu_id = $menu->id;
                            $menus_lang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(WEB_ADMIN_URL.'/menu');
                    }
                }else{
                    foreach ($error as $value) {
                        $this->flashSession->error($value . ". ");
                    }
                }
            }else{
                $this->flashSession->error("Token không chính xác");
                return $this->response->redirect(WEB_ADMIN_URL.'/menu');
            }
        }
        $this->view->location_id = $location_id;
        $this->view->languages = $languages;
        $this->view->forms_lang = $forms_lang;
        $this->view->form_menu = $form_menu;
        $this->view->menus_lang = $menus_lang;
        $this->view->menu = $menu;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->get_js_css();
    }

    public function deleteAction($id = null){
        if ($menu = \Menus::findFirstId($id)) {
            $menu->deleted = 1;
            if (!$menu->save()) {
                if ($this->request->isAjax()) {
                    foreach ($menu->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $data['error'] = $error;
                    $this->response->setStatusCode(400, 'error');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    foreach ($menu->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                    return $this->response->redirect(WEB_ADMIN_URL.'/menu');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $menu->toArray();
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    $this->flashSession->success("Xóa thành công");
                    return $this->response->redirect(WEB_ADMIN_URL.'/menu');
                }
            }
        }else{
            $this->flashSession->error("Không tìm thấy");
            return $this->response->redirect(WEB_ADMIN_URL.'/menu');
        }
    }

    // =================================
    // API
    // =================================
    public function getdataAction(){
        if(!$this->request->isAjax()){
            $this->response->setStatusCode(403, 'Failed');
            $this->response->setJsonContent(['Truy cập không được phép']);
            return $this->response->send();
        }
        $menu_location_id = $this->request->get('menu_location_id');
        $menu_location_id = $menu_location_id ? $menu_location_id : 0;
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'm.id',
            'm.dept_id',
            'm.menu_location_id',
            'm.type',
            'm.post_id',
            'm.page_id',
            'm.cat_id',
            'm.dept',
            'm.links',
            'm.icon',
            'm.parent_id',
            'm.sort',
            'm.status',
            'ml.name menu_name',
        ))
        ->from(['m' => 'Menus'])
        ->where("m.parent_id is NULL AND m.deleted = 0 AND m.status = 1 AND m.menu_location_id = $menu_location_id")
        ->leftJoin('MenusLang', 'ml.menu_id = m.id AND ml.lang_id = 1','ml')
        ->orderBy("m.sort ASC, m.id ASC");


        $search = "m.name LIKE :search:";
        $this->response->setStatusCode(200, 'OK');
        $this->response->setJsonContent($this->ssp->data_output($this->request->get(), $data,$search));
        return $this->response->send();
    }

    public function getdatachildAction($parent_id = 0){
        if(!$this->request->isAjax()){
            $this->response->setStatusCode(403, 'Failed');
            $this->response->setJsonContent(['Truy cập không được phép']);
            return $this->response->send();
        }

        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'm.id',
            'm.menu_location_id',
            'm.type',
            'm.post_id',
            'm.page_id',
            'm.cat_id',
            'm.dept',
            'm.links',
            'm.icon',
            'm.sort',
            'm.status',
            'ml.name menu_name',
        ))
        ->from(['m'=>'Menus'])
        ->leftJoin('MenusLang', 'ml.menu_id = m.id AND ml.lang_id = 1','ml')
        ->orderBy("m.sort ASC, ml.name ASC")
        ->where("m.deleted = 0 AND m.parent_id = :parent_id:",['parent_id' => $parent_id])
        ->getQuery()
        ->execute();

        $this->response->setStatusCode(200, 'OK');
        $this->response->setJsonContent(['menus' => $data->toArray()]);
        return $this->response->send();
    }

    // =================================
    // FUNCTION
    // =================================
    private function get_js_css (){
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/menus.js');
    }
}