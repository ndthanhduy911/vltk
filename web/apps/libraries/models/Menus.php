<?php
namespace Models;

class Menus extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $name;
    
    public $dept_id;

    public $image;

    public $title;

    public $description;
    
    public $button_link;

    public $button_text;

    public $created_at;

    public $updated_at;

    public function getSource()
    {
        return 'menus';
    }

    public static function getNamepace (){
        return 'Models\Menus';
    }
}