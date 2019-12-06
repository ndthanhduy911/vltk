<?php
namespace Models;

class Staff extends \Phalcon\Mvc\Model
{
    public $id;

    public $dept_id;

    public $slug;

    public $featured_image;

    public $is_dean;
    
    public $is_vice_dean;

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

    public static function getDeptPosition($position = null) {
        switch ((int)$position) {
            case 1:
                return "Trưởng bộ môn";
            case 2:
                return "";
                break;
            
            default:
                # code...
                break;
        }
        return $dept_position;
    }
}