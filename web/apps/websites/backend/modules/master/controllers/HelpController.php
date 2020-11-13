<?php
namespace Backend\Modules\Master\Controllers;

class HelpController extends \BackendController
{
    // ===============================
    // PAGE
    // ===============================
    public function indexAction(){
        $title = "Hướng dẫn sử dụng";
        $this->getJsCss();
        $this->view->title = $title;
    }

    public function faqsAction(){
        $title = "Câu hỏi thường gặp";
        $this->getJsCss();
        $this->view->title = $title;
    }

    public function aboutAction()
    {
        $title = "Giới thiệu";
        $this->getJsCss();
        $this->view->title = $title;
    }

    public function contactAction()
    {
        $title = "Liên hệ";
        $this->getJsCss();
        $this->view->title = $title;
    }

    // ===============================
    // FUNCTION
    // ===============================

    private function getJsCss (){
        // And some local JavaScript resources
        // $this->assets->addJs(WEB_URL.'/assets/js/modules/master/logs.js');
    }
}