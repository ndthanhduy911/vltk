<?php
namespace Models;

class Staff extends \Phalcon\Mvc\Model
{
    public $id;

    public $dept_id;

    public $slug;

    public $email;

    public $featured_image;

    public $dean;

    public $dept_position;

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

    public static function findFirstId($id, $columns = "*")
    {
        
        return parent::findFirst([
            "conditions" => "id = :id:",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);
    }
}