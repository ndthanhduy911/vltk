<?php
namespace Models;

class Social extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $icon;
    
    public $link;

    public $name;

    public $sort;
    
    public $dept;

    public $created_at;

    public $update_at;

    public $status;

    public function getSource()
    {
        return 'social';
    }

    public static function getNamepace (){
        return 'Models\Social';
    }
}