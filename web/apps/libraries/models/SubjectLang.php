<?php

namespace Models;

class SubjectLang extends \Phalcon\Mvc\Model
{
    public $id;

    public $subject_id;
    
    public $lang_id;

    public $title;

    public $content;

    public $excerpt;

    public function getSource()
    {
        return 'subject_lang';
    }

    public static function getNamepace (){
        return 'Models\SubjectLang';
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