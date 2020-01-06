<?php
namespace Models;

class SubjectLang extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $subject_id;
    
    public $lang_id;

    public $title;

    public $content;

    public function getSource()
    {
        return 'subject_lang';
    }

    public static function getNamepace (){
        return 'Models\SubjectLang';
    }
}