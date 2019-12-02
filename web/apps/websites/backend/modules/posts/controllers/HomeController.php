<?php
namespace Backend\Modules\Posts\Controllers;
use Models\Staff;
use Models\StaffLang;
use Backend\Modules\Posts\Forms\StaffForm;
use Backend\Modules\Posts\Forms\StaffLangForm;
use Models\HomeSetting;

class HomeController  extends \BackendController {

    public function indexAction(){
        $this->view->setting1 = HomeSetting::findFirst(1);
        $this->view->setting2 = HomeSetting::findFirst(2);
        $this->view->setting3 = HomeSetting::findFirst(3);
        $this->view->setting4 = HomeSetting::findFirst(4);
        $this->view->setting5 = HomeSetting::findFirst(5);
        $this->view->setting6 = HomeSetting::findFirst(6);
        $this->get_js_css();
    }

    public function updateAction($id = 0){

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