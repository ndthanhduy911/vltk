<?php

namespace Models;

use Models\SubjectsLang;

class Subjects extends \Phalcon\Mvc\Model
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
        return 'subjects';
    }

    public static function getNamepace (){
        return 'Models\Subjects';
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
            return FRONTEND_URL.'/'.$subject->slug;
        }else{
            return null;
        }
    }

    public static function getTitleById($id = null)
    {
        if($subject = SubjectLang::findFirst(['subject_id = :subject_id:','bind' => ['subject_id' => $id]])){
            return $subject->name;
        }else{
            return null;
        }
    }

    public static function getUrl($dept = NULL, $subject = NULL)
    {
        if($subject && $dept){
            return FRONTEND_URL.($dept->id != 1 ? "/$dept->slug" : '' ).'/subject/'.$subject->slug;
        }else{
            return '';
        }
    }
}