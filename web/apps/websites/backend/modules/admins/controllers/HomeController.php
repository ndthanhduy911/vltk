<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\HomeForm;
use Backend\Modules\Admins\Forms\HomeLangForm;

class HomeController  extends \BackendController {

    public function indexAction(){
        $formslang = [];
        $homeslang = [];
        $languages = \Language::find(['status = 1']);
        $deptid = $this->session->get('deptid');
        if(!$home = \Home::findFirstByDept_id($deptid)){
            echo 'Không tìm thấy dữ liệu'; die;
        }
        $home->updatedat = date('Y-m-d H:i:s');
        $title = 'Cài đặt';
        foreach ($languages as $key => $lang) {
            $homelang = \HomeLang::findFirst(['home_id = :home_id: AND langid = :langid:','bind' => ['home_id' => $home->id, 'langid' => $lang->id]]);
            if($homelang){
                $formlang = new HomeLangForm($homelang);
                $homeslang[$lang->id] = $homelang;
                $formslang[$lang->id] = $formlang;
            }else{
                echo 'Nội dung không phù hợp'; die;
            }
        }   

        $form_home = new HomeForm($home);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_specialized_title = $this->request->getPost('specialized_title',['string','trim']);
                $p_staff_title = $this->request->getPost('staff_title',['string','trim']);
                $p_staff_des = $this->request->getPost('staff_des',['string','trim']);
                $p_partner_title = $this->request->getPost('partner_title',['string','trim']);
                $p_partner_des = $this->request->getPost('partner_des',['string','trim']);
                $p_contact_title = $this->request->getPost('contact_title',['string','trim']);
                $p_contact_des = $this->request->getPost('contact_des',['string','trim']);
                $req_home = [
                    'specialized_bg' => $this->request->getPost('specialized_bg',['string','trim']),
                    'partner_bg' => $this->request->getPost('partner_bg',['string','trim']),
                    'cat_list' => $this->request->getPost('cat_list',['string','trim']),
                ];
                $req_home['cat_list'] = $req_home['cat_list'] ? json_encode($req_home ['cat_list']) : NULL;
                $form_home->bind($req_home, $home);
                if (!$form_home->isValid()) {
                    foreach ($form_home->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                foreach ($languages as $key => $lang) {
                    $req_homelang[$lang->id] = [
                        'specialized_title' => $p_specialized_title[$lang->id],
                        'staff_title' => $p_staff_title[$lang->id],
                        'staff_des' => $p_staff_des[$lang->id],
                        'partner_title' => $p_partner_title[$lang->id],
                        'partner_des' => $p_partner_des[$lang->id],
                        'contact_title' => $p_contact_title[$lang->id],
                        'contact_des' => $p_contact_des[$lang->id],
                        'langid' => $lang->id,
                    ];

                    $formslang[$lang->id]->bind($req_homelang[$lang->id], $homeslang[$lang->id]);
                    if (!$formslang[$lang->id]->isValid()) {
                        foreach ($formslang[$lang->id]->getMessages() as $message) {
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
                            $homeslang[$lang->id]->home_id = $home->id;
                            $homeslang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(WEB_ADMIN_URL.'/home');
                    }
                }else{
                    foreach ($error as $value) {
                        $this->flashSession->error($value);
                    }
                }
            }else{
                $this->flashSession->error("Token không chính xác");
                return $this->response->redirect(WEB_ADMIN_URL.'/home');
            }
        }

        $this->view->languages = $languages;
        $this->view->formslang = $formslang;
        $this->view->form_home = $form_home;
        $this->view->home = $home;
        $this->view->deptid = $deptid;
        $this->view->homeslang = $homeslang;
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
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/admins/home.js');
    }
}