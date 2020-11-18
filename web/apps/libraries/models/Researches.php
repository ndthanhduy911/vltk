<?php

class Researches extends \ModelCore
{
    public function getSource()
    {
        return 'researches';
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
            return WEB_URL.'/'.$research->slug;
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
            return WEB_URL.($dept->id != 1 ? "/$dept->slug" : '' ).'/research/'.$research->slug;
        }else{
            return '';
        }
    }
}