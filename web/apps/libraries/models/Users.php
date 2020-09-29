<?php
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

    public $dept_id;

    public $dept_mg;

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
                "conditions" => "id = :id: AND dept_id IN (".implode(',',$_SESSION['dept_mg']).")",
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
}
