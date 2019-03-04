<?php
/**
 * Created by Nguyen Dang Thanh Duy.
 * Date: 7/18/17
 * Time: 10:10 AM
 */

namespace Backend\Modules\User\Forms;

use Library\Helper\Helper;
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
use Phalcon\Forms\Element\Email;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Confirmation;
use Phalcon\Validation\Validator\Between;
use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Base\Forms\BaseForm;
use Library\Common as LibraryCommon;

class AddUserForm extends BaseForm
{
    public function initialize($entity = null , $options = null)
    {
        $id = new Hidden('id', array(
            'class' => 'form-control',
        ));
        $id->setLabel("ID");
        $this->add($id);

        $email = new Email('email', array(
            'class' => 'form-control',
            'placeholder' => 'Email',
            'required' => true,
        ));
        $email->setLabel("Email");
        $this->add($email);

        $fullname = new Text('fullname', array(
            'class' => 'form-control',
            'placeholder' => 'Fullname',
            'required' => true,
        ));
        $fullname->setLabel("Fullname");
        $this->add($fullname);

        $password = new Password('password', array(
            'class' => 'form-control',
            'placeholder' => 'Password',
            'required' => true,
        ));
        $password->setLabel("Password");
        $this->add($password);

        $confirmPassword = new Password('confirmPassword', array(
            'class' => 'form-control',
            'placeholder' => 'Confirm password',
            'required' => true,
        ));
        $confirmPassword->setLabel("Confirm Password");
        $this->add($confirmPassword);

        $status = new Select('status', LibraryCommon::listUserStatus(), array(
        	'useEmpty' => true, 
        	'emptyText' => 'Select status', 
        	'emptyValue' => '', 
        	'class' => 'form-control',
        	'required' => true
        ));
        $status->setLabel("Status");
        $this->add($status);

        // Submit button
        $this->add(new Submit('submit', array(
            'class' => 'btn btn-primary',
            'value' => "Save"
        )));
    }
}
