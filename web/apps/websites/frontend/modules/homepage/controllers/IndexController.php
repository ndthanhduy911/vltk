<?php

namespace Frontend\Modules\HomePage\Controllers;
use Phalcon\Mvc\View;

class IndexController extends \FrontendController
{
    public function indexAction(){
        $this->get_js_css();
    }

    // =================================
    // FUNCTION
    // =================================
    private function get_js_css (){
        $this->assets->addJs(FRONTEND_URL.'/assets/frontend/js/modules/homepage/index.js');
    }
}