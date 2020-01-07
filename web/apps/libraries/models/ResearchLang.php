<?php

namespace Models;

class ResearchLang extends \Phalcon\Mvc\Model
{
    public $id;

    public $research_id;
    
    public $lang_id;

    public $title;

    public $content;

    public $excerpt;

    public function getSource()
    {
        return 'research_lang';
    }

    public static function getNamepace (){
        return 'Models\ResearchLang';
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