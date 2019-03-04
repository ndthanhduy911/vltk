<?php

namespace Backend\Modules\User\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Identical;
use Forms\BaseForm;
use Library\Common as LibraryCommon;

class FormCreatePermissionResource extends BaseForm
{
    public function initialize($entity = null, $options = null)
    {
        $id = new Hidden('id');
        $this->add($id);

        $name = new Text('name');

        $name->setLabel('Name');
        $name->setAttributes(array(
            'class' => 'forms-control col-xs-12',
            'placeholder' => 'name'
        ));
        $name->addValidators(array(
            new PresenceOf(array(
                'message' => 'The name is required'
            ))
        ));

        $this->add($name);

        $value = new Text('value');

        $value->setLabel('Giá trị');
        $value->setAttributes(array(
            'class' => 'forms-control col-xs-12',
            'placeholder' => 'value'
        ));
        $value->addValidators(array(
            new PresenceOf(array(
                'message' => 'The value is required'
            ))
        ));
        $this->add($value);

        $status = new Select('status' ,
            LibraryCommon::listStatus() ,
            array(
                'useEmpty' => true ,
                'emptyText' => 'Chọn trạng thái' ,
                'emptyValue' => '' ,
                'class' => 'forms-control col-xs-12',
            )
        );
        $status->setLabel("Trạng thái");
        $status->addValidator(new PresenceOf(array(
            'Message' => 'Status is required'
        )));
        $this->add($status);


        // CSRF
        $csrf = new Hidden('csrf');

        $csrf->addValidator(new Identical(array(
            'value' => $this->security->getSessionToken(),
            'message' => 'CSRF validation failed'
        )));

        $this->add($csrf);

        // Sign Up
        $this->add(new Submit('submit', array(
            'class' => 'btn btn-primary'
        )));
    }

    public function messages($name)
    {
        if($this->getMessagesFor($name))
        {
            foreach ($this->getMessagesFor($name) as $message)
            {
                $this->flash->error($message);
            }
        }
    }

}