<?php
class ConectionSystem extends \Phalcon\Mvc\Model
{

    public function getSource()
    {
        return 'conection';
    }

    public static function findFirstId($id, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "id = :id:",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);
    }

    public static function countType($type, $deptid)
    {
        $count = 0;

        $count = parent::findFirst([
            "conditions" => "type = :type: AND deptid = :deptid:",
            "bind" => ['type' => $type, 'deptid' => $deptid]
        ]);

        return $count ? $count->number : 0;
    }

    public static function plus($type, $deptid)
    {
        $number = 0;
        $conetion = parent::findFirst([
            "conditions" => "type = :type: AND deptid = :deptid:",
            "bind" => ['type' => $type, 'deptid' => $deptid]
        ]);

        if($conetion){
            $conetion->number = (int)$conetion->number + 1;
            $number = $conetion->number;
            $conetion->save();
        }

        return $number;
    }
}