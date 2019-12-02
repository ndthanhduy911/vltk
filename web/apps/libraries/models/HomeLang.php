<?php
namespace Models;

class HomeLang extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $home_id;
    
    public $lang_id;

    public $name;

    public $description;

    public function getSource()
    {
        return 'home_lang';
    }

    public static function getNamepace (){
        return 'Models\HomeLang';
    }
}