<?php
namespace Models;
class Categories extends \Phalcon\Mvc\Model
{

    public $id;

    public $slug;

    public $name;

    public $description;

    public $status;


    public function getSource()
    {
        return 'categories';
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
