<?php

namespace Frontend\Modules\Faculty\Controllers;
use Phalcon\Mvc\View;

class IndexController extends \FrontendController
{
    public function indexAction(){
        $this->get_js_css();
    }

    public function changelanguage($lang_id = 1){
        $this->session->set("lang_new", $lang_id);
        $this->response->setStatusCode(200, 'OK');
        $this->response->setJsonContent(['lang_id' => $lang_id]);
        return $this->response->send();
    }

    // =================================
    // FUNCTION
    // =================================
    private function get_js_css (){
        $this->assets->addJs(FRONTEND_URL.'/assets/frontend/js/modules/faculty/index.js');
    }
}