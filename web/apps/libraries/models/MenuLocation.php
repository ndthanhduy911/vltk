<?php
namespace Models;

class MenuLocation extends \Phalcon\Mvc\Model
{
    public $id;

    public $dept_id;

    public $name;

    public $description;

    public $status;

    public $created_at;

    public $updated_at;

    public function getSource()
    {
        return 'menu_location';
    }

    public static function getNamepace (){
        return 'Models\MenuLocation';
    }
}