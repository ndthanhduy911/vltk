<?php
namespace Models;
class Categories extends \Phalcon\Mvc\Model
{

    public $id;

    public $slug;

    public $name;

    public $description;

    public $status;

    public $created_at;

    public $updated_at;


    public function getSource()
    {
        return 'categories';
    }

    public static function getNamepace (){
        return 'Models\Categories';
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
