<?php

namespace Models;

use Models\ResearchLang;

class Research extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $slug;

    public $attribute_id;

    public $status;

    public $dept_id;

    public $created_at;

    public $updated_at;

    public $featured_image;

    public $background_image;

    public $deleted;

    public function getSource()
    {
        return 'research';
    }

    public static function getNamepace (){
        return 'Models\Research';
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
        
        if($research = parent::findFirst($id)){
            return FRONTEND_URL.'/'.$research->slug;
        }else{
            return null;
        }
    }

    public static function getTitleById($id = null)
    {
        if($research = ResearchLang::findFirst(['research_id = :research_id:','bind' => ['research_id' => $id]])){
            return $research->name;
        }else{
            return null;
        }
    }

    public static function getUrl($dept = NULL, $research = NULL)
    {
        if($research && $dept){
            return FRONTEND_URL.($dept->id != 1 ? "/$dept->slug" : '' ).'/research/'.$research->slug;
        }else{
            return '';
        }
    }
}