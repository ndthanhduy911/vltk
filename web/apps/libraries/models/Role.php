<?php
use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\StringLength;

class Role extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("role");
    }

    public function getSource()
    {
        return 'role';
    }

    public function vdUpdate($try=false)
    {
        $validator = new Validation();

        //name
        $validator->add(
            'name',
            new StringLength([
                "max"            => 100,
                "messageMaximum" => "Tên nhóm người dùng không được quá 100 ký tự",
            ])
        );
        $validator->add(
            'name',
            new PresenceOf([
                'message'   => 'Tên nhóm người dùng không được để trống'
            ])
        );

        //status
        $validator->add(
            'status',
            new PresenceOf([
                'message'   => 'Trạng thái không được để trống'
            ])
        );

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
