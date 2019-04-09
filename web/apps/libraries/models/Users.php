<?php
namespace Models;

class Users extends \Phalcon\Mvc\Model
{
    public $id;

    public $name;

    public $username;

    public $password;

    public $email;

    public $phone;

    public $avatar;

    public $role;

    public $department_id;

    public $department_mg;

    public $status;

    public $created_at;

    public $updated_at;

    public function getSource()
    {
        return 'users';
    }

    public static function findFirstId($id, $columns = "*")
    {
        if($_SESSION['role'] === 1){
            return parent::findFirst([
                "conditions" => "id = :id: AND status != 4",
                "bind" => array('id' => $id),
                "columns" => $columns
            ]);
        }else{
            return parent::findFirst([
                "conditions" => "id = :id: AND department_id IN (".implode(',',$_SESSION['department_mg']).")",
                "bind" => array('id' => $id),
                "columns" => $columns
            ]);
        }
    }

    public static function findFirstUsername($username, $columns = "*")
    {

        return parent::findFirst([
            "conditions" => "username = :username: AND status !=4",
            "bind" => array('username' => $username),
            "columns" => $columns
        ]);
    }

    public static function getNamepace (){
        return 'Models\Users';
    }
}
