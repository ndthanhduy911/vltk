<?php

namespace Models;

class PagesLang extends \Phalcon\Mvc\Model
{
    public $id;

    public $page_id;
    
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
        return parent::findFirst([
            "conditions" => "id = :id:",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);   
    }
}