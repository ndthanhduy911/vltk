<?php
namespace Models;
class CategoriesLang extends \Phalcon\Mvc\Model
{

    public $id;


    public $name;

    public $description;

    public $created_at;

    public $updated_at;


    public function getSource()
    {
        return 'categories';
    }

    public static function getNamepace (){
        return 'Models\CategoriesLang';
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
