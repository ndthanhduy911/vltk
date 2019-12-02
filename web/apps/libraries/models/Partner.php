<?php
namespace Models;

class Partner extends \Phalcon\Mvc\Model
{
    public $id;

    public $dept_id;

    public $featured_image;

    public $link;

    public $created_at;
    
    public $updated_at;

    public $status;

    public function getSource()
    {
        return 'partner';
    }

    public static function getNamepace (){
        return 'Models\Partner';
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