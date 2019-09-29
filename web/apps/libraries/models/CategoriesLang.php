<?php
namespace Models;
class CategoriesLang extends \Phalcon\Mvc\Model
{

    public $id;

    public $cat_id;

    public $lang_id;

    public $name;

    public $description;


    public function getSource()
    {
        return 'categories_lang';
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
