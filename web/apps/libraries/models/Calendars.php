<?php

namespace Models;

use Models\CalendarsLang;

class Calendars extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $slug;

    public $status;

    public $dept_id;

    public $created_at;

    public $updated_at;

    public $featured_image;

    public $background_image;

    public $deleted;

    public function getSource()
    {
        return 'calendars';
    }

    public static function getNamepace (){
        return 'Models\Calendars';
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
            return FRONTEND_URL.'/'.$calendar->slug;
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
            return FRONTEND_URL.($dept->id != 1 ? "/$dept->slug" : '' ).'/calendar/'.$calendar->slug;
        }else{
            return '';
        }
    }
}