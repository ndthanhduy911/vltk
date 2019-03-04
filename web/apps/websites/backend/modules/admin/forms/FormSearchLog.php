<?php
namespace Backend\Modules\Dashboard\Forms;

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
use Models\Users\Users;

class FormSearchLog extends BaseForm
{
    public function initialize($entity = null , $options = null)
    {


        $name = new Text('name' , array(
            'class' => '',
        ));
        $name->setLabel("Tiêu để");
        $this->add($name);

        $identity = $this->auth->getIdentity();
        if($identity['group_id'] == 1) {
            $type = new Select('userid', Users::find(), array('using' => array('id', 'fullname'), 'useEmpty' => true, 'emptyText' => 'User manager', 'emptyValue' => '', 'class' => ''));
            $type->setLabel('Loại tin tức');
            $this->add($type);
        }

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
