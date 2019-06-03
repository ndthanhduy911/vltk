<?php
namespace Models;
class Categories extends \Phalcon\Mvc\Model
{

    public $id;

    public $slug;

    public $name;

    public $description;

    public $status;

    public $dept_id;

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

    public static function getUrlById($id = null)
    {
        if($cat = parent::findFirst($id)){
            return FRONTEND_URL.'/'.$cat->slug;
        }else{
            return null;
        }
    }

    public static function getTitleById($id = null)
    {
        if($cat = parent::findFirst($id)){
            return $cat->name;
        }else{
            return null;
        }
    }
}
