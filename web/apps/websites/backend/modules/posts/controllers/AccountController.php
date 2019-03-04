<?php

namespace Backend\Modules\Admin\Controllers;
use Phalcon\Mvc\View;

class AccountController  extends \BackendController
{
    public function loginAction() {
        $this->view->setRenderLevel(
            View::LEVEL_ACTION_VIEW
        );
    }

    public function logutAction() {
        $this->session->destroy();
    }
}
