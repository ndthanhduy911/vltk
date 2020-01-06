<?php
namespace Models;

class ReasearchLang extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $research_id;
    
    public $lang_id;

    public $title;

    public $content;

    public function getSource()
    {
        return 'research_lang';
    }

    public static function getNamepace (){
        return 'Models\ResearchLang';
    }
}