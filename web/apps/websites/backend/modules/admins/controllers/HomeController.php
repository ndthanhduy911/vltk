<?php
namespace Backend\Modules\Admins\Controllers;
use Models\Language;
use Models\Home;
use Models\HomeLang;
use Backend\Modules\Admins\Forms\HomeForm;
use Backend\Modules\Admins\Forms\HomeLangForm;

class HomeController  extends \BackendController {

    public function indexAction(){
        $forms_lang = [];
        $homes_lang = [];
        $languages = Language::find(['status = 1']);
        $dept_id = $this->session->get('dept_id');
        if(!$home = Home::findFirstByDept_id($dept_id)){
            echo 'Không tìm thấy dữ liệu'; die;
        }
        $home->updated_at = date('Y-m-d H:i:s');
        $title = 'Cài đặt';
        foreach ($languages as $key => $lang) {
            $home_lang = HomeLang::findFirst(['home_id = :home_id: AND lang_id = :lang_id:','bind' => ['home_id' => $home->id, 'lang_id' => $lang->id]]);
            if($home_lang){
                $form_lang = new HomeLangForm($home_lang);
                $homes_lang[$lang->id] = $home_lang;
                $forms_lang[$lang->id] = $form_lang;
            }else{
                echo 'Nội dung không phù hợp'; die;
            }
        }   

        $form_home = new HomeForm($home);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_specialized_title = $this->request->getPost('specialized_title');
                $p_staff_title = $this->request->getPost('staff_title');
                $p_staff_des = $this->request->getPost('staff_des');
                $p_partner_title = $this->request->getPost('partner_title');
                $p_partner_des = $this->request->getPost('partner_des');
                $p_contact_title = $this->request->getPost('contact_title');
                $p_contact_des = $this->request->getPost('contact_des');
                $req_home = [
                    'specialized_bg' => $this->request->getPost('specialized_bg'),
                    'partner_bg' => $this->request->getPost('partner_bg'),
                    '' => $this->request->getPost(''),
                ];

                $req_home[''] = $req_home[''] ? json_encode($req_home ['']) : NULL;

                $form_home->bind($req_home, $home);
                if (!$form_home->isValid()) {
                    foreach ($form_home->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                foreach ($languages as $key => $lang) {
                    $req_home_lang[$lang->id] = [
                        'specialized_title' => $p_specialized_title[$lang->id],
                        'staff_title' => $p_staff_title[$lang->id],
                        'staff_des' => $p_staff_des[$lang->id],
                        'partner_title' => $p_partner_title[$lang->id],
                        'partner_des' => $p_partner_des[$lang->id],
                        'contact_title' => $p_contact_title[$lang->id],
                        'contact_des' => $p_contact_des[$lang->id],
                        'lang_id' => $lang->id,
                    ];

                    $forms_lang[$lang->id]->bind($req_home_lang[$lang->id], $homes_lang[$lang->id]);
                    if (!$forms_lang[$lang->id]->isValid()) {
                        foreach ($forms_lang[$lang->id]->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
                }

                if (!count($error)) {
                    if (!$home->save()) {
                        foreach ($home->getMessages() as $message) {
                            $this->flashSession->error($message);
                        }
                    } else {
                        foreach ($languages as $key => $lang) {
                            $homes_lang[$lang->id]->home_id = $home->id;
                            $homes_lang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(BACKEND_URL.'/home');
                    }
                }else{
                    foreach ($error as $value) {
                        $this->flashSession->error($value);
                    }
                }
            }else{
                $this->flashSession->error("Token không chính xác");
                return $this->response->redirect(BACKEND_URL.'/home');
            }
        }

        $this->view->languages = $languages;
        $this->view->forms_lang = $forms_lang;
        $this->view->form_home = $form_home;
        $this->view->home = $home;
        $this->view->dept_id = $dept_id;
        $this->view->homes_lang = $homes_lang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->get_js_css();
    }

    // =================================
    // API
    // =================================


    // =================================
    // FUNCTION
    // =================================

    private function get_js_css (){
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/home.js');
    }
}