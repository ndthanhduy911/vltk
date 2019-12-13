<?php

namespace Models;

class PagesLang extends \Phalcon\Mvc\Model
{
    public $id;

    public $dept_id;
    
    public $lang_id;

    public $title;

    public $content;

    public $excerpt;

    public function getSource()
    {
        return 'pages_lang';
    }

    public static function getNamepace (){
        return 'Models\PagesLang';
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
}