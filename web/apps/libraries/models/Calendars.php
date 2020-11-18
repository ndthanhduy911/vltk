<?php

class Calendars extends \ModelCore
{
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
        if($calendar = CalendarsLang::findFirst(['calendarid = :calendarid:','bind' => ['calendarid' => $id]])){
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