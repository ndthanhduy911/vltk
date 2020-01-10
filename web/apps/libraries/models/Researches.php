<?php

namespace Models;

use Models\ResearchesLang;

class Researches extends \Phalcon\Mvc\Model
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
        return 'researches';
    }

    public static function getNamepace (){
        return 'Models\Researches';
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
        if($research = ResearchesLang::findFirst(['research_id = :research_id:','bind' => ['research_id' => $id]])){
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