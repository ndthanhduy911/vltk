<?php

namespace Models;

class CalendarsLang extends \Phalcon\Mvc\Model
{
    public $id;

    public $calendar_id;
    
    public $lang_id;

    public $excerpt;

    public function getSource()
    {
        return 'calendars_lang';
    }

    public static function getNamepace (){
        return 'Models\CalendarsLang';
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