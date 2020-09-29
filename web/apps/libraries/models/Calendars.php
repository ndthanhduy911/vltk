<?php

use Models\CalendarsLang;

class Calendars extends \Phalcon\Mvc\Model
{
    public $id;

    public $status;

    public $dept_id;

    public $created_at;

    public $updated_at;

    public $featured_image;

    public $background_image;

    public $deleted;

    public $class_id;

    public $subject_id;

    public $year;

    public $semester;

    public $location;

    public $begin_date;

    public $day;

    public $begin_time;

    public $end_time;

    public $room;



    public function getSource()
    {
        return 'calendars';
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
        
        if($calendar = parent::findFirst($id)){
            return WEB_URL.'/'.$calendar->slug;
        }else{
            return null;
        }
    }

    public static function getTitleById($id = null)
    {
        if($calendar = CalendarsLang::findFirst(['calendar_id = :calendar_id:','bind' => ['calendar_id' => $id]])){
            return $calendar->name;
        }else{
            return null;
        }
    }

    public static function getUrl($dept = NULL, $calendar = NULL)
    {
        if($calendar && $dept){
            return WEB_URL.($dept->id != 1 ? "/$dept->slug" : '' ).'/calendar/'.$calendar->slug;
        }else{
            return '';
        }
    }
}