<?php

namespace Backend\Modules\User\Forms;

use Base\Forms\BaseForm;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Identical;
use Library\Common as LibraryCommon;

class FormCreateUserGroup extends BaseForm
{
    public function initialize($entity = null, $options = null)
    {
        $name = new Text('name');

        $name->setLabel('Name');
        $name->setAttributes(array(
            'class' => 'form-control',
        ));
        $name->addValidators(array(
            new PresenceOf(array(
                'message' => 'The name is required'
            ))
        ));

        $this->add($name);



        $status = new Select('publish' ,
            LibraryCommon::listStatus() ,
            array(
                'useEmpty' => true ,
                'emptyText' => 'Selete status' ,
                'emptyValue' => '' ,
                'class' => 'form-control',
            )
        );
        $status->setLabel("Status");
        $status->addValidator(new PresenceOf(array(
            'Message' => 'Status is required'
        )));
        $this->add($status);

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