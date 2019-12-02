<?php
namespace Models;

class BannerLang extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $banner_id;
    
    public $lang_id;

    public $name;

    public $description;
    
    public $button_text;

    public function getSource()
    {
        return 'banner_lang';
    }

    public static function getNamepace (){
        return 'Models\BannerLang';
    }
}