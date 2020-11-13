<?php
namespace Backend\Modules\Dashboard\Controllers;

class IndexController extends \BackendController
{
    public function indexAction()
    {
        $title = "Bảng điều khiển";
        $this->view->title = $title;
        $this->view->indexActive = $this->request->get('tab','int');
        $this->getJsCss();
    }

    // ===============================
    // API
    // ===============================

    // ===============================
    // FUNCTION
    // ===============================
    private function getJsCss (){
        // Add some local CSS resources

        // And some local JavaScript resources
        $this->assets->addJs(WEB_URL.'/assets/backend/js/modules/dashboard/index.js?v='.VS_SCRIPT);
    }
}

