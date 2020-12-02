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
        $formslang = [];
        $partnerslang = [];
        $partner_content = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$partner = \Partner::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $partner->updatedat = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $partnerlang = \PartnerLang::findFirst(['partnerid = :id: AND langid = :langid:','bind' => ['id' => $partner->id, 'langid' => $lang->id]]);
                if($partnerlang){
                    $formlang = new PartnerLangForm($partnerlang);
                    $partnerslang[$lang->id] = $partnerlang;
                    $formslang[$lang->id] = $formlang;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $partner = new \Partner();
            $partner->deptid = $this->session->get('deptid');
            $partner->createdat = date('Y-m-d H:i:s');
            $partner->updatedat = $partner->createdat;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $formslang[$lang->id] = new PartnerLangForm();
                $partnerslang[$lang->id] = new \PartnerLang();
            }
        }

        $form_partner = new PartnerForm($partner);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_title = $this->request->getPost('title',['string','trim']);
                $p_link = $this->request->getPost('link',['string','trim']);
                $req_partner = [
                    'status' => $this->request->getPost('status',['int']),
                    'image' => $this->request->getPost('image',['string','trim']),
                    'link' => $this->request->getPost('link',['string','trim']),
                ];

                $form_partner->bind($req_partner, $partner);
                if (!$form_partner->isValid()) {
                    foreach ($form_partner->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                foreach ($languages as $key => $lang) {
                    $req_partnerlang[$lang->id] = [
                        'title' => $p_title[$lang->id],
                        'langid' => $lang->id,
                    ];

                    $formslang[$lang->id]->bind($req_partnerlang[$lang->id], $partnerslang[$lang->id]);
                    if (!$formslang[$lang->id]->isValid()) {
                        foreach ($formslang[$lang->id]->getMessages() as $message) {
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
                            $partnerslang[$lang->id]->partnerid = $partner->id;
                            $partnerslang[$lang->id]->save();
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
        $this->view->formslang = $formslang;
        $this->view->form_partner = $form_partner;
        $this->view->partner = $partner;
        $this->view->partnerslang = $partnerslang;
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
            $deptid = $this->session->get('deptid');
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'p.id',
                'p.link',
                'p.image',
                'p.status',
                'p.deptid',
                'p.createdat',
                'pl.title title',
            ))
            ->from(['p' => 'Partner'])
            ->where("p.deleted = 0 AND p.deptid = {$deptid}")
            ->leftJoin('PartnerLang', 'pl.partnerid = p.id AND pl.langid = 1','pl')
            ->orderBy('p.deptid ASC');
    
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
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/admins/partner.js');
    }
}