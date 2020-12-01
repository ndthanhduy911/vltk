<?php
namespace Library\RoleMaster;
use Models\Roles;
use Models\Permission;


class RoleMaster
{

    private $_controllerName = null;
    private $_actionName = null;
    private $_userPermission = []; // Cac controller, action cua user co quyen truy cap
    private $_private = []; // Cac controller, action phai co quyen moi duoc truy cap

    function __construct($userPermission = [],$private= [], $controllerName=null, $actionName=null) {
        $this->_userPermission = $userPermission;
        $this->_actionName = $actionName;
        $this->_controllerName = $controllerName;
        $this->_private = $private;
    }

    //Ham get cac quyen cua user
    static function getUserPermission($roleID){
        $arrayPermission = [];
        if(!empty($roleID)){
            if($permission = Roles::findFirst($roleID)){
                if(!$permission->active){
                    return $arrayPermission;
                }
                $permissionList = json_decode($permission->permission_id);
                foreach ($permissionList as $id) {
                    if($permissionArray = Permission::findFirst($id)){
                        if((int)$id === 1){
                            return 1;
                        }
                        if($permissionArray->status){
                            if(isset($arrayPermission[$permissionArray->controller])){
                                array_push($arrayPermission[$permissionArray->controller], $permissionArray->action);
                            }else{
                                $arrayPermission[$permissionArray->controller][0] = $permissionArray->action;
                            }
                        }
                    }
                }
                return $arrayPermission;
            }else {
                return $arrayPermission;
            }
        }else{
            return $arrayPermission;
        }
    }

    //Ham get cac private
    static function getPrivate(){
        $private = [];
        $privateTmp = Permission::find(['id != 1 AND status =1']);
        foreach ($privateTmp as $key => $value) {
            if(isset($private[$value->controller])){
                array_push($private[$value->controller], $value->action);
            }else{
                $private[$value->controller][0] = $value->action;
            }
        }
        return $private;
    }

    //Ham kiem tra hien thi noi dung
    static function isPermission($permission, $controllerName, $actionName = null){
        if($permission === 1){
            return true;
        }
        if(empty($permission[$controllerName])){
            return false;
        }
        if(!$permission[$controllerName][0]){
            return true;
        }
        if(array_search($actionName,$permission[$controllerName]) !== false){
            return true;
        }
        return false;
    }

    //Kiem tra user co quyen truy cap
    function isPrivate(){
        if($this->_userPermission === 1){
            return true;
        }
        if($this->checkController()){
            return true;            
        }else{
            if($this->checkAction()){
                return true;
            }
            return false;
        }
    }

    //Kiem tra controller nay co duoc truy cap hay khong
    // True la duoc quyen truy cap
    function checkController(){
        if(!isset($this->_private[$this->_controllerName])){
            return true;
        }
        return false;
    }

    //KIem tra action nay co duoc truy cap khong
    // True la duoc chap nhan
    function checkAction(){

        if(array_search($this->_actionName,$this->_private[$this->_controllerName]) === false){
            return true;
        }

        if(!isset($this->_userPermission[$this->_controllerName])){
            return false;
        }

        if(!$this->_userPermission[$this->_controllerName][0]){
            return true;
        }

        if(array_search($this->_actionName,$this->_userPermission[$this->_controllerName]) === false){
            return false;
        }

        return true;
    }

    //KIem tra danh sách khu vuc co duoc truy cap khong
    // True la duoc chap nhan
    function checkDeptList($array_check = [] , $roles = []){
        if($_SESSION['role'] === 1)
            return true;
        if(!empty($array_check)){
            for ($i=0; $i < count($array_check); $i++) { 
                if(!in_array($array_check[$i],$roles)){
                    return false;
                }
            }
            return true;
        }

        return false;
    }

    function checkDeptId($id , $roles = []){
        if($_SESSION['role'] === 1)
            return true;
        if($id){
            if(in_array((string)$id,$roles))
                return true;
        }

        return false;
    }
}