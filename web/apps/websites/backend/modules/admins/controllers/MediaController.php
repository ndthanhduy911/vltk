<?php
namespace Backend\Modules\Admins\Controllers;
use \Phalcon\Mvc\View;

class MediaController  extends \BackendController {

    public function elfinderAction(){
        $this->view->disableLevel(View::LEVEL_AFTER_TEMPLATE);
        $this->view->pick('templates/elfinder');
    }
}