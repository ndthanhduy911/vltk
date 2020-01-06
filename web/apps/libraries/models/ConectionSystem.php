<?php
namespace Models;

class ConectionSystem extends \Phalcon\Mvc\Model
{
    public $id;

    public $dept_id;

    public $type;

    public $number;

    public $created_at;
    
    public $updated_at;

    public function getSource()
    {
        return 'conection';
    }

    public static function getNamepace (){
        return 'Models\ConectionSystem';
    }

    public static function findFirstId($id, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "id = :id:",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);
    }

    public static function countType($type, $dept_id)
    {
        $count = 0;

        $count = parent::findFirst([
            "conditions" => "type = :type: AND dept_id = :dept_id:",
            "bind" => ['type' => $type, 'dept_id' => $dept_id]
        ]);

        return $count ? $count->number : 0;
    }

    public static function plus($type, $dept_id)
    {
        $number = 0;
        $conetion = parent::findFirst([
            "conditions" => "type = :type: AND dept_id = :dept_id:",
            "bind" => ['type' => $type, 'dept_id' => $dept_id]
        ]);

        if($conetion){
            $conetion->number = (int)$conetion->number + 1;
            $number = $conetion->number;
            $conetion->save();
        }

        return $number;
    }
}