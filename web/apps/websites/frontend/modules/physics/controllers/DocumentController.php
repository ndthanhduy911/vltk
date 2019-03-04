<?php

namespace Frontend\Modules\Physics\Controllers;

use Library\Helper\Helper;
use Phalcon\Mvc\View;

class DocumentController extends \FrontendController
{
    public function indexAction(){
        $this->view->setRenderLevel(
            View::LEVEL_ACTION_VIEW
        );
    }
}