<?php
class MenuLocation extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("menuslocation");
    }

    public static function getId($deptid, $type){
        if(!$locations = parent::findFirst(["deptid = :did: AND type = :type:",'bind' => ['did' => $deptid,'type' => $type]])){
            return 0;
        }
        return $locations->id;
    }
}