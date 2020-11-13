<?php
namespace Library\Master;
class Master
{
    public function getPermission($controller, $action = 0, $params = 0){

        if(!is_array($controller) && !is_array($action) && !is_array($params)){
            $permission = \Permission::findFirst([
                "controller = '$controller' AND action = '$action' AND params = $params  AND deleted = 0",
                'columns' => 'id',
            ]);
            return $permission ? [$permission->id] : [];

        }elseif(!is_array($controller) && !is_array($action) && is_array($params)){
            $condition = "controller = '$controller' AND action = '$action' AND params IN (".implode(',',$params).")";
        }elseif(!is_array($controller) && is_array($action) && !is_array($params)){
            $condition = "controller = '$controller' AND action IN ('".implode("','",$action)."') AND params = $params";
        }elseif(!is_array($controller) && is_array($action) && is_array($params)){
            $condition = "controller = '$controller' AND action IN ('".implode("','",$action)."') AND params IN (".implode(',',$params).")";
        }elseif(is_array($controller) && !is_array($action) && !is_array($params)){
            $condition = "controller IN ('".implode("','",$controller)."') AND action = '$action' AND params = $params";
        }elseif(is_array($controller) && !is_array($action) && is_array($params)){
            $condition = "controller IN ('".implode("','",$controller)."') AND action = '$action' AND params IN (".implode(',',$params).")";
        }elseif(is_array($controller) && is_array($action) && !is_array($params)){
            $condition = "controller IN ('".implode("','",$controller)."') AND action IN ('".implode("','",$action)."') AND params = $params";
        }elseif(is_array($controller) && is_array($action) && is_array($params)){
            $condition = "controller IN ('".implode("','",$controller)."') AND action IN ('".implode("','",$action)."') AND params IN (".implode(',',$params).")";
        }

        $permission = \Permission::find([
            "$condition AND deleted = 0",
            'columns' => 'id',
        ]);

        return $permission->count() ? array_column($permission->toArray(),'id') : [];
    }

    public function getPermissionList($permission, $roleid){
        if(count($permission)){
            return \PermissionList::findFirst([
                "permissionid IN (".implode(',',$permission).") AND deleted = 0 AND roleid = $roleid",
                'columns' => "id,roleid,permissionid,depted"
            ]);   
        }        
        return false;
    }

    public function checkMaster($_this){
        $controller = $_this->dispatcher->getControllerName();
        $action = $_this->dispatcher->getActionName();
        $params = $_this->dispatcher->getParams();
        $params = count($params) ? 1 : 0;
        $roleid = $_this->session->get('roleid');
        if($roleid == 1){
            return true;
        }

        $permission = $this->getPermission($controller, $action, $params);
        if(!count($permission)){
            return true;
        }
        
        if(!$this->getPermissionList($permission, $roleid)){
            return false;
        };
        return true;
    }

    static function checkPermission($controller, $action = 0, $params = 0, $roleid = false, $ckS = true){
        if(!$roleid){
            $roleid = empty($_SESSION['roleid']) ? 0 : $_SESSION['roleid'];
        }

        if($roleid == 1){
            return true;
        }

        if ($cS = (new Master())->checkSession($controller, $action, $params)) {
            return $cS;
        }

        $permission = (new Master())->getPermission($controller, $action, $params);
        if(!count($permission)){
            (new Master())->saveSession($controller, $action, $params,true);
            return true;
        }
        
        if(!(new Master())->getPermissionList($permission, $roleid)){
            if($ckS){
                (new Master())->saveSession($controller, $action, $params,false);
            }
            return false;
        };
        if($ckS){
            (new Master())->saveSession($controller, $action, $params,true);
        }
        return true;
    }

    static function checkPermissionDepted($controller, $action = 0, $params = 0, $roleid = false, $ckS = true){
        if(!$roleid){
            $roleid = empty($_SESSION['roleid']) ? 0 : $_SESSION['roleid'];
        }
        if($roleid == 1){
            return (object)['depted' => 0];
        }
        if($ckS){
            if ($cS = (new Master())->checkSession($controller, $action, $params,2)) {
                return $cS;
            }
        }

        $permission = (new Master())->getPermission($controller, $action, $params);
        if(!count($permission)){
            if($ckS){
                (new Master())->saveSession($controller, $action, $params,(object)['depted' => 0],2);
            }
            return (object)['depted' => 0];
        }
        if(!$permissionList = (new Master())->getPermissionList($permission, $roleid)){
            if($ckS){
                (new Master())->saveSession($controller, $action, $params,false,2);
            }
            return false;
        };
        if($ckS){
            (new Master())->saveSession($controller, $action, $params,(object)['depted' => (int)$permissionList->depted],2);
        }
        return (object)['depted' => (int)$permissionList->depted];
    }

    static function builderPermission($data,$perL,$alias,$userid = false,$deptid = false){
        if(!$deptid){
            $deptid = isset($_SESSION['deptid']) ? $_SESSION['deptid'] : 0 ;
        }
        if(!$userid){
            $userid = isset($_SESSION['userid']) ? $_SESSION['userid'] : 0 ;
        }

        if($perL->depted == 1){
            $data = $data->inWhere("$alias.deptid",\Depts::getArrayChild($deptid,[$deptid]));
        }elseif ($perL->depted == 2) {
            $data = $data->andWhere("$alias.createdby = :createdby:",['createdby' => $userid]);
            $data = $data->inWhere("$alias.deptid",\Depts::getArrayChild($deptid,[$deptid]));
        }elseif ($perL->depted == 3) {
            $data = $data->andWhere("$alias.deptid = :deptid:",['deptid' => $deptid]);
        }
        return $data;
    }

    private function saveSession($controller, $action, $params,$perL,$type = 1){
        if(is_array($controller)){
            $textController = implode("-",$controller);
        }else{
            $textController = $controller;
        }

        if(is_array($action)){
            $textAction = implode("-",$action);
        }else{
            $textAction = $action;
        }

        if(is_array($params)){
            $textParams = implode("-",$params);
        }else{
            $textParams = $params;
        }

        $text = $type.'_'.$textController.'_'.$textAction.'_'.$textParams;
        $_SESSION[$text] = $perL;

    }

    private function checkSession($controller,$action,$params,$type = 1) {
        if(is_array($controller)){
            $textController = implode("-",$controller);
        }else{
            $textController = $controller;
        }

        if(is_array($action)){
            $textAction = implode("-",$action);
        }else{
            $textAction = $action;
        }

        if(is_array($params)){
            $textParams = implode("-",$params);
        }else{
            $textParams = $params;
        }

        $text = $type.'_'.$textController.'_'.$textAction.'_'.$textParams;
        if(isset($_SESSION[$text])){
            return $_SESSION[$text];
        }
        return false;
    }
}