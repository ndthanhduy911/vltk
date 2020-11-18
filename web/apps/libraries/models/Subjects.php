<?php

class Subjects extends \ModelCore
{
    public function getSource()
    {
        return 'subjects';
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
        
        if($subject = parent::findFirst($id)){
            return WEB_URL.'/'.$subject->slug;
        }else{
            return null;
        }
    }

    public static function getTitleById($id = null)
    {
        if($subject = SubjectsLang::findFirst(['subjectid = :subjectid:','bind' => ['subjectid' => $id]])){
            return $subject->name;
        }else{
            return null;
        }
    }

    public static function getUrl($dept = NULL, $subject = NULL)
    {
        if($subject && $dept){
            return WEB_URL.($dept->id != 1 ? "/$dept->slug" : '' ).'/subject/'.$subject->slug;
        }else{
            return '';
        }
    }
}