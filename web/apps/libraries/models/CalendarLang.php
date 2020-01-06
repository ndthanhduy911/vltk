<?php
namespace Models;

class CalendarLang extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $calendar_id;
    
    public $lang_id;

    public $title;

    public $content;

    public function getSource()
    {
        return 'calendar_lang';
    }

    public static function getNamepace (){
        return 'Models\CalendarLang';
    }
}