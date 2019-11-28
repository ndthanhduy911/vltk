<?php
namespace Models;

class Link extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $icon;
    
    public $name;

    public $link;

    public $sort;

    public $dept_id;
    
    public $location;

    public $created_at;

    public $update_at;

    public $status;

    public function getSource()
    {
        return 'link';
    }

    public static function getNamepace (){
        return 'Models\Link';
    }
}