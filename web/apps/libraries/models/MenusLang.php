<?php
namespace Models;

class MenusLang extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $type;
    
    public $param_id;

    public $link;

    public $icon;

    public $parent_id;
    
    public $module;

    public $controller;

    public $action;

    public $slug;
    
    public $status;

    public $created_at;

    public $updated_at;

    public function getSource()
    {
        return 'menus_lang';
    }

    public static function getNamepace (){
        return 'Models\Banners';
    }
}