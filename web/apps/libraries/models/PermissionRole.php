<?php

class PermissionRole extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("permissionrole");
    }

    public function getSource()
    {
        return 'permissionrole';
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
