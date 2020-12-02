<?php
class PermissionList extends \ModelCore
{

    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("permissionlist");
    }

    public function vdUpdate($try=false){
        $validator = new \Phalcon\Validation();
        if($try){
            if(!$this->validate($validator)){
                foreach ($this->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
        }
        return $this->validate($validator);
    }
}
