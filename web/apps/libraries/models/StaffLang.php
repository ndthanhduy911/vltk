<?php
namespace Models;

class StaffLang extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $staff_id;
    
    public $lang_id;

    public $title;

    public $regency;

    public $content;

    public function getSource()
    {
        return 'staff_lang';
    }

    public static function getNamepace (){
        return 'Models\StaffLang';
    }
}