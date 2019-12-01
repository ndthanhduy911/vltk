<?php
namespace Models;



class HomeSetting extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $dept_id;

    public $type;

    public $setting;

    public $sort;

    public $name;

    public function getSource()
    {
        return 'home_setting';
    }

    public static function getNamepace (){
        return 'Models\HomeSetting';
    }
}