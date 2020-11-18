<?php
use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\StringLength;

class Duty extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("duty");
    }

    public function getSource()
    {
        return 'duty';
    }

    public function vdUpdate($try=false)
    {
        $validator = new Validation();

        //name
        $validator->add(
            'name',
            new StringLength([
                "max"            => 100,
                "messageMaximum" => "Tên chức vụ không được quá 100 ký tự",
            ])
        );
        $validator->add(
            'name',
            new PresenceOf([
                'message'   => 'Tên chức vụ không được để trống'
            ])
        );

        //note
        $validator->add(
            'note',
            new StringLength([
                "max"            => 150,
                "messageMaximum" => "Ghi chú không được quá 150 ký tự",
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
