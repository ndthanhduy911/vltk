<?php
namespace Models;

class MenusLang extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $menu_id;
    
    public $name;

    public $lang_id;

    public function getSource()
    {
        return 'menus_lang';
    }

    public static function getNamepace (){
        return 'Models\MenusLang';
    }
}