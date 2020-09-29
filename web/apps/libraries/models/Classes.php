<?php

class Classes extends \Phalcon\Mvc\Model
{
    
    public function getSource()
    {
        return 'classes';
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