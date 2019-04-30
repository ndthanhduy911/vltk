<?php

namespace Models;

class Pages extends \Phalcon\Mvc\Model
{
    public $id;

    public $title;
    
    public $slug;

    public $attribute_id;

    public $content;

    public $except;

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
                "conditions" => "id = :id: AND dept_id IN (".implode(',',$_SESSION['department_mg']).")",
                "bind" => array('id' => $id),
                "columns" => $columns
            ]);
        }
    }
}