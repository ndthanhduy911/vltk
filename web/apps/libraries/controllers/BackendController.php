<?php

use Library\RoleMaster\RoleMaster;
use Models\Departments;
use Models\Language;
use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;

class BackendController extends Controller
{

    public function getBackendUrl()
    {
        return $this->getDi()->get('config')->application->backendUrl;
    }

    public function beforeExecuteRoute(Dispatcher $dispatcher)
    {
        if (!$this->session->has("short_name")) {
            $lang_short = Language::findFirst(["actived = 1 AND status = 1",'columns' => 'id, name']);
            $this->session->set("short_name", $lang_short ? strtolower($lang_short->short_name) : 'vie');
            $this->session->set("lang_id", $lang_short ? strtolower($lang_short->id) : 1);
        }
        if ($this->session->has("user_id")) {
            if ($this->session->has("private")) {
                $private = $this->session->get("private");
            } else {
                $private = RoleMaster::getPrivate();
                $this->session->set("private", $private);
            }
            if ($this->session->has("permission")) {
                $permission = $this->session->get("permission");
            } else {
                $permission = RoleMaster::getUserPermission($this->session->get('role'));
                $this->session->set("permission", $permission);
            }
            $roleMaster = new RoleMaster($permission, $private, $dispatcher->getControllerName(), $dispatcher->getActionName());
            if ($roleMaster->isPrivate()) {
                $this->view->dept_code = Departments::findFirstId($this->session->get('dept_id'))->code;
            } else {
                echo "Không có quyền truy cập";
                die;
            }
        } else {
            return $this->response->redirect($this->getBackendUrl().'/account/login');
        }
    }
}
