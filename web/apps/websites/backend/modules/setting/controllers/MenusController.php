<?php

namespace Backend\Modules\Setting\Controllers;

use Models\Menus;
use Models\MenusLang;
use Models\MenuLocation;
use Models\Language;


use Backend\Modules\Setting\Forms\MenusForm;
use Backend\Modules\Setting\Forms\MenusLangForm;

class MenusController  extends \BackendController
{
    public function indexAction(){
        $this->get_js_css();
        $this->view->menu_location = MenuLocation::find(["dept_id = {$this->session->get('dept_id')}"]);
    }

    public function updateAction($location_id = 0){
        $forms_lang = [];
        $menus_lang = [];
        $languages = Language::find(['status = 1']);
        $dept_id = $this->session->get('dept_id');
        $id = $this->request->get('id');
        if($id){
            if(!$menu = Menus::findFirst(["id = $id AND menu_location_id = $location_id AND dept_id = $dept_id"])){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $menu->updated_at = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $menu_lang = MenusLang::findFirst(['menu_id = :id: AND lang_id = :lang_id:','bind' => ['id' => $menu->id, 'lang_id' => $lang->id]]);
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
            $menu = new Menus();
            $menu->created_at = date('Y-m-d H:i:s');
            $menu->updated_at = $menu->created_at;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $forms_lang[$lang->id] = new MenusLangForm();
                $menus_lang[$lang->id] = new MenusLang();
            }
            $form_menu = new MenusForm($menu);
        }
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $m_name = $this->request->getPost('name');
                $req_menu = [
                    'dept_id' => $menu->dept_id ? $menu->dept_id : $dept_id,
                    'menu_location_id' => $location_id,
                    'type' => $this->request->getPost('type'),
                    'status' => $this->request->getPost('status'),
                    'post_id' => $this->request->getPost('post_id'),
                    'page_id' => $this->request->getPost('page_id'),
                    'cat_id' => $this->request->getPost('cat_id'),
                    'dept' => $this->request->getPost('dept'),
                    'links' => $this->request->getPost('links'),
                    'icon' => $this->request->getPost('icon'),
                    'parent_id' => $this->request->getPost('parent_id'),
                    'sort' => $this->request->getPost('sort'),
                    'status' => $this->request->getPost('status'),
                ];
                
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
                        return $this->response->redirect(BACKEND_URL.'/menu');
                    }
                }else{
                    foreach ($error as $value) {
                        $this->flashSession->error($value . ". ");
                    }
                }
            }else{
                $this->flashSession->error("Token không chính xác");
                return $this->response->redirect(BACKEND_URL.'/menu');
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
        if ($menu = Menus::findFirstId($id) && !in_array((int)$id, [1,2,3,4,5])) {
            $menu->status = 4;
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
                    return $this->response->redirect(BACKEND_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $menu->toArray();
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                    $this->flashSession->success("Chuyển bài viết đến thùng rác thành công");
                    return $this->response->redirect(BACKEND_URL.'/posts');
                }
            }
        }else{
            if ($this->request->isAjax()) {
                $data['error'] = 'Không tìm thấy bài viết';
                $this->response->setStatusCode(404, 'Not found');
                $this->response->setJsonContent($data);
                return $this->response->send();
            } else {
                // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                $this->flashSession->error("Không tìm thấy bài viết");
                return $this->response->redirect(BACKEND_URL.'/posts');
            }
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
        $npMenu = Menus::getNamepace();
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            $npMenu.'.id',
            $npMenu.'.dept_id',
            $npMenu.'.menu_location_id',
            $npMenu.'.type',
            $npMenu.'.post_id',
            $npMenu.'.page_id',
            $npMenu.'.cat_id',
            $npMenu.'.dept',
            $npMenu.'.links',
            $npMenu.'.icon',
            $npMenu.'.parent_id',
            $npMenu.'.sort',
            $npMenu.'.status',
            'ML.name menu_name',
        ))
        ->from($npMenu)
        ->where("$npMenu.parent_id is NULL AND $npMenu.deleted = 0 AND $npMenu.status = 1 AND $npMenu.menu_location_id = $menu_location_id")
        ->join('Models\MenusLang', 'ML.menu_id = '.$npMenu.'.id AND ML.lang_id = 1','ML')
        ->orderBy("$npMenu.sort ASC, $npMenu.id ASC");


        $search = "$npMenu.name LIKE :search:";
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
        $npMenu = Menus::getNamepace();
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            $npMenu.'.id',
            $npMenu.'.menu_location_id',
            $npMenu.'.type',
            $npMenu.'.post_id',
            $npMenu.'.page_id',
            $npMenu.'.cat_id',
            $npMenu.'.dept',
            $npMenu.'.links',
            $npMenu.'.icon',
            $npMenu.'.sort',
            $npMenu.'.status',
            'ML.name menu_name',
        ))
        ->from($npMenu)
        ->join('Models\MenusLang', 'ML.menu_id = '.$npMenu.'.id AND ML.lang_id = 1','ML')
        ->orderBy("$npMenu.sort ASC, ML.name ASC")
        ->where("$npMenu.deleted = 0 AND $npMenu.parent_id = :parent_id:",['parent_id' => $parent_id])
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
