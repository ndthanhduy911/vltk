<?php
namespace Models;

class Staff extends \Phalcon\Mvc\Model
{
    public $id;

    public $dept_id;

    public $slug;

    public $image;

    public $created_at;
    
    public $updated_at;

    public $status;

    public function getSource()
    {
        return 'staff';
    }

    public static function getNamepace (){
        return 'Models\Staff';
    }
}