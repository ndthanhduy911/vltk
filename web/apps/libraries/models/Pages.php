<?php

namespace Models;

class Pages extends \Phalcon\Mvc\Model
{
    public $id;

    public $title;
    
    public $slug;

    public $attribute_id;

    public $content;

    public $excerpt;

    public $status;

    public $dept_id;

    public $created_at;

    public $updated_at;

    public function getSource()
    {
        return 'pages';
    }

    public static function getNamepace (){
        return 'Models\Pages';
    }

    public static function findFirstId($id, $columns = "*")
    {
        if($_SESSION['role'] === 1){
            return parent::findFirst([
                "conditions" => "id = :id:",
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

    public static function getUrlById($id = null)
    {
        if($page = parent::findFirst($id)){
            return FRONTEND_URL.'/'.$page->slug;
        }else{
            return null;
        }
    }

    public static function getTitleById($id = null)
    {
        if($page = parent::findFirst($id)){
            return $page->name;
        }else{
            return null;
        }
    }
}