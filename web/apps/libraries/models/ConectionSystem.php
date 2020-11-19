<?php
class ConectionSystem extends \ModelCore
{

    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("conection");
    }

    public function getSource()
    {
        return 'conection';
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