<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\PartnerForm;
use Backend\Modules\Admins\Forms\PartnerLangForm;

class PartnerController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function updateAction($id = 0){
        $forms_lang = [];
        $partners_lang = [];
        $partner_content = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$partner = \Partner::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $partner->updated_at = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $partner_lang = \PartnerLang::findFirst(['partner_id = :id: AND lang_id = :lang_id:','bind' => ['id' => $partner->id, 'lang_id' => $lang->id]]);
                if($partner_lang){
                    $form_lang = new PartnerLangForm($partner_lang);
                    $partners_lang[$lang->id] = $partner_lang;
                    $forms_lang[$lang->id] = $form_lang;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $partner = new \Partner();
            $partner->dept_id = $this->session->get('dept_id');
            $partner->created_at = date('Y-m-d H:i:s');
            $partner->updated_at = $partner->created_at;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $forms_lang[$lang->id] = new PartnerLangForm();
                $partners_lang[$lang->id] = new \PartnerLang();
            }
        }

        $form_partner = new PartnerForm($partner);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_title = $this->request->getPost('title',['string','trim']);
                $p_link = $this->request->getPost('link',['string','trim']);
                $req_partner = [
                    'status' => $this->request->getPost('status',['int','trim']),
                    'featured_image' => $this->request->getPost('featured_image',['string','trim']),
                    'link' => $this->request->getPost('link',['string','trim']),
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
                    $partner->calendar = $this->helper->datetimeMysql($partner->calendar);
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
                        return $this->response->redirect(WEB_ADMIN_URL.'/partner');
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
        if ($partner = \Partner::findFirstId($id)) {
            $partner->deleted = 1;
            if (!$partner->save()) {
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
                    return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
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
                    return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
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
                return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
            }
        }
    }

    // =================================
    // API
    // =================================

    public function getdataAction(){
        if($this->request->isAjax()){
            $dept_id = $this->session->get('dept_id');
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'p.id',
                'p.link',
                'p.featured_image',
                'p.status',
                'p.dept_id',
                'p.created_at',
                'pl.title title',
            ))
            ->from(['p' => 'Partner'])
            ->where("p.deleted = 0 AND p.dept_id = {$dept_id}")
            ->leftJoin('PartnerLang', 'pl.partner_id = p.id AND pl.lang_id = 1','pl')
            ->orderBy('p.dept_id ASC');
    
            $search = 'pl.title LIKE :search:';
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