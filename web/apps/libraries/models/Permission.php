<?php
class Permission extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("permission");
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

    public static function getPermissionByType($groupid, $roleid,$type = 0){
        return Permission::findFirst(['type = :type: AND deleted = 0 AND groups = :groupid: AND role = :roleid:','bind' => ['type' => $type,'groupid' => $groupid,'roleid' => $roleid]]);
    }
}
