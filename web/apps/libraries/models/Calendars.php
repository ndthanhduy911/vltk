<?php

class Calendars extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("calendars");
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