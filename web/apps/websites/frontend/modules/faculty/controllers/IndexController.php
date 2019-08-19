<?php

namespace Frontend\Modules\Faculty\Controllers;
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
        $this->assets->addJs(FRONTEND_URL.'/assets/frontend/js/modules/faculty/index.js');
    }
}