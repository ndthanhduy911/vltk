<?php
namespace Backend\Modules\Posts\Controllers;
use Models\Partner;
use Models\PartnerLang;
use Models\Language;
use Backend\Modules\Posts\Forms\PartnerForm;
use Backend\Modules\Posts\Forms\PartnerLangForm;

class PartnerController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function updateAction($id = 0){
        $forms_lang = [];
        $partners_lang = [];
        $partner_content = [];
        $languages = Language::find(['status = 1']);
        if($id){
            if(!$partner = Partner::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $partner->updated_at = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $partner_lang = PartnerLang::findFirst(['partner_id = :id: AND lang_id = :lang_id:','bind' => ['id' => $partner->id, 'lang_id' => $lang->id]]);
                if($partner_lang){
                    $form_lang = new PartnerLangForm($partner_lang);
                    $partners_lang[$lang->id] = $partner_lang;
                    $forms_lang[$lang->id] = $form_lang;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $partner = new Partner();
            $partner->dept_id = $this->session->get('dept_id');
            $partner->created_at = date('Y-m-d H:i:s');
            $partner->updated_at = $partner->created_at;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $forms_lang[$lang->id] = new PartnerLangForm();
                $partners_lang[$lang->id] = new PartnerLang();
            }
        }

        $form_partner = new PartnerForm($partner);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_title = $this->request->getPost('title');
                $p_link = $this->request->getPost('link');
                $req_partner = [
                    'status' => $this->request->getPost('status'),
                    'featured_image' => $this->request->getPost('featured_image'),
                ];

                $form_partner->bind($req_partner, $partner);
                if (!$form_partner->isValid()) {
                    foreach ($form_partner->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                foreach ($languages as $key => $lang) {
                    $req_partner_lang[$lang->id] = [
                        'title' => $p_title[$lang->id],
                        'lang_id' => $lang->id,
                    ];

                    $forms_lang[$lang->id]->bind($req_partner_lang[$lang->id], $partners_lang[$lang->id]);
                    if (!$forms_lang[$lang->id]->isValid()) {
                        foreach ($forms_lang[$lang->id]->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
                }

                if (!count($error)) {
                    $partner->calendar = $this->helper->datetime_mysql($partner->calendar);
                    if (!$partner->save()) {
                        foreach ($partner->getMessages() as $message) {
                            $this->flashSession->error($message);
                        }
                    } else {
                        foreach ($languages as $key => $lang) {
                            $partners_lang[$lang->id]->partner_id = $partner->id;
                            $partners_lang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(BACKEND_URL.'/partner');
                    }
                }else{
                    foreach ($error as $value) {
                        $this->flashSession->error($value);
                    }
                }
            }else{
                $this->flashSession->error("Token không chính xác");
            }
        }

        $this->view->languages = $languages;
        $this->view->partner_content = $partner_content;
        $this->view->forms_lang = $forms_lang;
        $this->view->form_partner = $form_partner;
        $this->view->partner = $partner;
        $this->view->partners_lang = $partners_lang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->get_js_css();
    }
    
    public function deleteAction($id = null){
        if ($partner = Partner::findFirstId($id)) {
            if (!$partner->delete()) {
                if ($this->request->isAjax()) {
                    foreach ($partner->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $data['error'] = $error;
                    $this->response->setStatusCode(400, 'error');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    foreach ($partner->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                    return $this->response->redirect(BACKEND_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $partner->toArray();
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                    $this->flashSession->success("Xóa bài viết khoản thành công");
                    return $this->response->redirect(BACKEND_URL.'/trashs');
                }

            }
        }else{
            if ($this->request->isAjax()) {
                $data['error'] = 'Không tìm thấy bài viết';
                $this->response->setStatusCode(404, 'Not found');
                $this->response->setJsonContent($data);
                return $this->response->send();
            } else {
                $this->flashSession->error("Không tìm thấy bài viết");
                return $this->response->redirect(BACKEND_URL.'/trashs');
            }
        }
    }

    // =================================
    // API
    // =================================

    public function getdataAction(){
        if($this->request->isAjax()){
            $dept_id = $this->session->get('dept_id');
            $npPartner = Partner::getNamepace();
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                $npPartner.'.id',
                $npPartner.'.link',
                $npPartner.'.featured_image',
                $npPartner.'.status',
                $npPartner.'.dept_id',
                $npPartner.'.created_at',
                'PL.title title',
            ))
            ->from($npPartner)
            ->where("$npPartner.deleted = 0 AND $npPartner.dept_id = $dept_id")
            ->leftJoin('Models\PartnerLang', 'PL.partner_id = '.$npPartner.'.id AND PL.lang_id = 1','PL')
            ->orderBy($npPartner.'.dept_id ASC');
    
            $search = 'PL.title LIKE :search:';
            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent($this->ssp->data_output($this->request->get(), $data,$search));
            return $this->response->send();
        }else{
            $this->response->setStatusCode(403, 'Failed');
            $this->response->setJsonContent(['Truy cập không được phép']);
            return $this->response->send();
        }
    }

    private function get_js_css (){
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/partner.js');
    }
}