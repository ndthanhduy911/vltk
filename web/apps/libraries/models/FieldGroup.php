<?php

class FieldGroup extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("fieldgroup");
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

    public static function findFirstKey($key,$roleid){
        return parent::findFirst([
            'fieldkey = :fkey: AND roleid = :roleid:',
            'bind' => [
                'fkey' => $key,
                'roleid' => $roleid
            ]
        ]);
    }

    public static function findDataStringKey($key){
        $roleid = isset($_SESSION['roleid']) ? $_SESSION['roleid'] : 0;
        if($roleid == 1){
            return true;
        }
        $field =  parent::findFirst([
            'fieldkey = :fkey: AND roleid = :roleid:',
            'bind' => [
                'fkey' => $key,
                'roleid' => $roleid
            ]
        ]);
        return $field ? implode(",",json_decode($field->datas)): "";
    }

    public static function findDataArrayKey($key){
        $roleid = isset($_SESSION['roleid']) ? $_SESSION['roleid'] : 0;
        if($roleid == 1){
            return true;
        }
        $field =  parent::findFirst([
            'fieldkey = :fkey: AND roleid = :roleid:',
            'bind' => [
                'fkey' => $key,
                'roleid' => $roleid
            ]
        ]);
        return $field ? json_decode($field->datas) : [];
    }

    public static function filedGroup($key) {
        $groups =  [
            // 'chekcin' => [
            //     'name' => 'Phiếu nhập',
            //     'filed' => []
            // ],
            // 'checkout' => ['name' => 'Phiếu xuất','filed' => []],
            'asset' =>['costs','isde'],
            'inventory' => ['costs','restcosts','costsreal','restcostsreal'],
            'estimate' => ['costs','restcosts','costsreal','restcostsreal'],
            'furnish' => ['unitprice','costs','budgetcosts','sponsorcosts','careercosts','othercosts','estimatesaccept'],
            'pcplan' => ['unitprice','costs','budgetcosts','sponsorcosts','careercosts','othercosts','estimatesaccept'],
        ];
        return isset($groups[$key]) ? $groups[$key] : []; 
    }
}
