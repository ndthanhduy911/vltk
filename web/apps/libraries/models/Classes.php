<?php

namespace Models;

use Models\ClassesLang;

class Classes extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $slug;

    public $status;

    public $code;

    public $dept_id;

    public $featured_image;

    public $background_image;

    public $created_at;

    public $updated_at;

    public $deleted;

    public function getSource()
    {
        return 'classes';
    }

    public static function getNamepace (){
        return 'Models\Classes';
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
        
        if($class = parent::findFirst($id)){
            return WEB_URL.'/'.$class->slug;
        }else{
            return null;
        }
    }

    public static function getTitleById($id = null)
    {
        if($class = ClassesLang::findFirst(['class_id = :class_id:','bind' => ['class_id' => $id]])){
            return $class->name;
        }else{
            return null;
        }
    }

    public static function getUrl($dept = NULL, $class = NULL)
    {
        if($class && $dept){
            return WEB_URL.($dept->id != 1 ? "/$dept->slug" : '' ).'/class/'.$class->slug;
        }else{
            return '';
        }
    }
}