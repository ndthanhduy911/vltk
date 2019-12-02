<?php
namespace Models;

class Banner extends \Phalcon\Mvc\Model
{
    public $id;

    public $dept_id;

    public $image;

    public $button_link;

    public $created_at;
    
    public $updated_at;

    public $status;

    public function getSource()
    {
        return 'banner';
    }

    public static function getNamepace (){
        return 'Models\Banner';
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