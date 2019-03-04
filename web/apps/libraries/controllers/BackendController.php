<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;
use Library\RoleMaster\RoleMaster;
use Models\Permission;

class BackendController extends Controller
{    
    public function beforeExecuteRoute(Dispatcher $dispatcher)
    {
        try {

        } catch (\Exception $e) {
            $this->flash->error($e->getMessage());
        }
    }
}
