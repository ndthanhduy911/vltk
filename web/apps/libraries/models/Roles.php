<?php
class Roles extends \Phalcon\Mvc\Model
{

    public $id;

    public $name;

    public $permission_id;

    public $active;

    public function getSource()
    {
        return 'roles';
    }

    public static function findFirstId($id, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "id = :id:",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);
    }
}
