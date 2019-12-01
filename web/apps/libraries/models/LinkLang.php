<?php
namespace Models;



class LinkLang extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $lang_id;
    
    public $link_id;

    public $name;

    public function getSource()
    {
        return 'link_lang';
    }

    public static function getNamepace (){
        return 'Models\LinkLang';
    }
}