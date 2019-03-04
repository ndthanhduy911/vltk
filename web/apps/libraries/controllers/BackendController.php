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
            $identity = $this->auth->getIdentity();
            if(!$identity){
                header('Location: /account/login/');
            }
        } catch (\Exception $e) {
            $this->flash->error($e->getMessage());
        }

        if(!empty($this->session->has("private"))){
            $private = $this->session->get("private");
        }else{
            $private = RoleMaster::getPrivate();
            $this->session->set("private", $private);
        }
        
        if(!empty($this->session->has("permission"))){
            $permission = $this->session->get("permission");
        }else{
            $permission = RoleMaster::getUserPermission($identity['group_id']);
            $this->session->set("permission", $permission);
        }
        $roleMaster = new RoleMaster($permission,$private, $dispatcher->getControllerName(),$dispatcher->getActionName());
        if($roleMaster->isPrivate()){
            
        }else{
            require ERROR_FILE; die;
        }
    }
}
