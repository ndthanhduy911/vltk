<?php
namespace Backend\Modules\User\Forms;

use Models\News\Category;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Check;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Radio;
use Phalcon\Forms\Element\File;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\email;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Confirmation;
use Phalcon\Validation\Validator\Between;
use Base\Forms\BaseForm;
use Library\Common as LibraryCommon;

class FormSearchUsers extends BaseForm
{
    public function initialize($entity = null , $options = null)
    {
        $id = new Text('id' , array(
            'class' => '',
        ));
        $id->setLabel("ID");
        $this->add($id);

        $name = new Text('fullname' , array(
            'class' => '',
        ));
        $name->setLabel("Họ và tên");
        $this->add($name);



        $status = new Select('publish' ,
            LibraryCommon::listStatus() ,
            array(
                'useEmpty' => true ,
                'emptyText' => 'Select status' ,
                'emptyValue' => '' ,
                'class' => '',
            )
        );
        $status->setLabel("Trạng thái");

        $this->add($status);
        // Sign Up
        $this->add(new Submit('submit', array(
            'class' => 'btn btn-sm btn-primary',
            'value' => "Search"
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
