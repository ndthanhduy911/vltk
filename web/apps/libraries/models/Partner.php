<?php
namespace Models;

class Partner extends \Phalcon\Mvc\Model
{
    public $id;

    public $dept_id;

    public $image;

    public $link;

    public $created_at;
    
    public $updated_at;

    public $status;

    public $sort;

    public function getSource()
    {
        return 'partner';
    }

    public static function getNamepace (){
        return 'Models\Partner';
    }
}