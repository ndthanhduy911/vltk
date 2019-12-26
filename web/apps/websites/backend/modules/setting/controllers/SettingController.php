<?php

namespace Backend\Modules\Setting\Controllers;
use Backend\Modules\Setting\Forms\LinkForm;
use Backend\Modules\Setting\Forms\LinkLangForm;
use Backend\Modules\Setting\Forms\SocialForm;
use Models\Language;
use Models\Link;
use Models\LinkLang;
use Models\Social;

class SettingController  extends \BackendController
{
    public function linksAction() {
        $this->assets->addJs($this->config->applilinkion->baseUri.'/assets/backend/js/modules/setting/links.js');
    }

    public function updatelinkAction($id = 0){
        $forms_lang = [];
        $links_lang = [];
        $languages = Language::find(['status = 1']);
        if($id){
            if(!$link = Link::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $link->updated_at = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $link_lang = LinkLang::findFirst(['link_id = :id: AND lang_id = :lang_id:','bind' => ['id' => $link->id, 'lang_id' => $lang->id]]);
                if($link_lang){
                    $form_lang = new LinkLangForm($link_lang);
                    $links_lang[$lang->id] = $link_lang;
                    $forms_lang[$lang->id] = $form_lang;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }
            $form_link = new LinkForm($link);   
        }else{
            $link = new Link();
            $link->dept_id = $this->session->get('dept_id');
            $link->created_at = date('Y-m-d H:i:s');
            $link->updated_at = $link->created_at;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $forms_lang[$lang->id] = new LinkLangForm();
                $links_lang[$lang->id] = new LinkLang();
            }
            $form_link = new LinkForm($link);
        }
        if ($this->request->isPost()) {
            if (!$this->security->checkToken()) {
                $this->flashSession->error("Token không chính xác");
                return $this->response->redirect(BACKEND_URL.'/setting/links');
            }
            $error = [];
            $l_name = $this->request->getPost('name');
            $req_link = [
                'icon' => $this->request->getPost('icon'),
                'link' => $this->request->getPost('link'),
                'sort' => $this->request->getPost('sort'),
                'status' => $this->request->getPost('status'),
            ];
            
            $form_link->bind($req_link, $link);
            if (!$form_link->isValid()) {
                foreach ($form_link->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
            }

            foreach ($languages as $key => $lang) {
                $req_link_lang[$lang->id] = [
                    'name' => $l_name[$lang->id],
                    'lang_id' => $lang->id,
                ];
                $forms_lang[$lang->id]->bind($req_link_lang[$lang->id], $links_lang[$lang->id]);
                if (!$forms_lang[$lang->id]->isValid()) {
                    foreach ($forms_lang[$lang->id]->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }
            }

            if (!count($error)) {
                if (!$link->save()) {
                    foreach ($link->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                } else {
                    foreach ($languages as $key => $lang) {
                        $links_lang[$lang->id]->link_id = $link->id;
                        $links_lang[$lang->id]->save();
                    }
                    $this->flashSession->success($title." thành công");
                    return $this->response->redirect(BACKEND_URL.'/setting/links');
                }
            }else{
                foreach ($error as $value) {
                    $this->flashSession->error($value . ". ");
                }
            }
        }
        $this->view->languages = $languages;
        $this->view->forms_lang = $forms_lang;
        $this->view->form_link = $form_link;
        $this->view->links_lang = $links_lang;
        $this->view->title = $title;
    }

    public function deletelinkAction($id = 0){
        if ($link = Link::findFirstId($id)) {
            $link->deleted = 1;
            if (!$link->save()) {
                if ($this->request->isAjax()) {
                    foreach ($link->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $data['error'] = $error;
                    $this->response->setStatusCode(400, 'error');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    foreach ($link->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                    return $this->response->redirect(BACKEND_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $link->toArray();
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                    $this->flashSession->success("Xóa thành công");
                    return $this->response->redirect(BACKEND_URL.'/posts');
                }
            }
        }else{
            if ($this->request->isAjax()) {
                $data['error'] = 'Không tìm thấy link';
                $this->response->setStatusCode(404, 'Not found');
                $this->response->setJsonContent($data);
                return $this->response->send();
            } else {
                // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                $this->flashSession->error("Không tìm thấy link");
                return $this->response->redirect(BACKEND_URL.'/posts');
            }
        }
        
    }

    public function socialsAction() {
        $this->assets->addJs($this->config->applilinkion->baseUri.'/assets/backend/js/modules/setting/socials.js');
    }

    public function updatesocialAction($id = 0){
        if($id){
            if(!$social = Social::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $social->updated_at = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            $form_social = new SocialForm($social);   
        }else{
            $social = new Social();
            $social->dept_id = $this->session->get('dept_id');
            $social->created_at = date('Y-m-d H:i:s');
            $social->updated_at = $social->created_at;
            $title = 'Thêm mới';
            $form_social = new SocialForm($social);
        }
        if ($this->request->isPost()) {
            if (!$this->security->checkToken()) {
                $this->flashSession->error("Token không chính xác");
                return $this->response->redirect(BACKEND_URL.'/setting/socials');
            }
            $error = [];
            $l_name = $this->request->getPost('name');
            $req_social = [
                'icon' => $this->request->getPost('icon'),
                'social' => $this->request->getPost('social'),
                'sort' => $this->request->getPost('sort'),
                'status' => $this->request->getPost('status'),
            ];
            
            $form_social->bind($req_social, $social);
            if (!$form_social->isValid()) {
                foreach ($form_social->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
            }

            if (!count($error)) {
                if (!$social->save()) {
                    foreach ($social->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                } else {
                    $this->flashSession->success($title." thành công");
                    return $this->response->redirect(BACKEND_URL.'/setting/socials');
                }
            }else{
                foreach ($error as $value) {
                    $this->flashSession->error($value . ". ");
                }
            }
        }
        $this->view->form_social = $form_social;
        $this->view->title = $title;
    }

    public function deletesocialAction($id = 0){
        if ($social = Social::findFirstId($id)) {
            $social->deleted = 1;
            if (!$social->save()) {
                if ($this->request->isAjax()) {
                    foreach ($social->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $data['error'] = $error;
                    $this->response->setStatusCode(400, 'error');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    foreach ($social->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                    return $this->response->redirect(BACKEND_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $social->toArray();
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                    $this->flashSession->success("Xóa thành công");
                    return $this->response->redirect(BACKEND_URL.'/setting/socials');
                }
            }
        }else{
            if ($this->request->isAjax()) {
                $data['error'] = 'Không tìm thấy biểu tượng';
                $this->response->setStatusCode(404, 'Not found');
                $this->response->setJsonContent($data);
                return $this->response->send();
            } else {
                // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                $this->flashSession->error("Không tìm thấy tượng");
                return $this->response->redirect(BACKEND_URL.'/posts');
            }
        }
        
    }


    // =================================
    // API
    // =================================

    public function getdatalinksAction(){
        if($this->request->isAjax()){
            $dept_id = $this->session->get('dept_id');
            $npLink = Link::getNamepace();
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                $npLink.'.id',
                $npLink.'.icon',
                $npLink.'.link',
                $npLink.'.sort',
                $npLink.'.status',
                'L.name name',
            ))
            ->from($npLink)
            ->where("$npLink.deleted = 0 AND $npLink.dept_id = $dept_id")
            ->join('Models\LinkLang', 'L.link_id = '.$npLink.'.id AND L.lang_id = 1','L')
            ->orderBy($npLink.'.sort ASC');
    
            $search = $npLink.'.name LIKE :search:';
            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent($this->ssp->data_output($this->request->get(), $data,$search));
            return $this->response->send();
        }else{
            $this->response->setStatusCode(403, 'Failed');
            $this->response->setJsonContent(['Truy cập không được phép']);
            return $this->response->send();
        }
    }

    public function getdatasocialsAction(){
        if($this->request->isAjax()){
            $dept_id = $this->session->get('dept_id');
            $npSocial = Social::getNamepace();
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                $npSocial.'.id',
                $npSocial.'.icon',
                $npSocial.'.link',
                $npSocial.'.sort',
                $npSocial.'.status',
                $npSocial.'.name',
            ))
            ->from($npSocial)
            ->where("$npSocial.deleted = 0 AND $npSocial.dept_id = $dept_id")
            ->orderBy($npSocial.'.sort ASC');
    
            $search = $npSocial.'.name LIKE :search:';
            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent($this->ssp->data_output($this->request->get(), $data,$search));
            return $this->response->send();
        }else{
            $this->response->setStatusCode(403, 'Failed');
            $this->response->setJsonContent(['Truy cập không được phép']);
            return $this->response->send();
        }
    }

    // =================================
    // FUNCTION
    // =================================
}
