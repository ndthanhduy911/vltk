<?php

namespace Backend\Modules\User\Forms;

use Models\Users\Groups;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Check;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\File;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\email;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Confirmation;
use Phalcon\Validation\Validator\Regex as RegexValidator;

class FormCreateUser extends Form
{
	public function initialize($entity = null, $options = null)
    {

        // Tên
        $name = new Text('fullname');

        $name->setLabel('Fullname');
        $name->setAttributes(array(
            'ng-model' => 'user.fullname',
            'class' => 'form-control ',
            'placeholder' => 'Fullname'
        ));
        $name->addValidators(array(
            new PresenceOf(array(

            ))
        ));

        $this->add($name);

        // Username
        $username = new Text('username');

        $username->setLabel('Username');
        $username->setAttributes(array(
            'class' => 'form-control ',
        ));
        $username->addValidators(array(
            new PresenceOf(array(

            )),
            new RegexValidator(array(
                'pattern' => '/^[a-zA-Z\d_.]{5,20}$/',

            ))
        ));

        $this->add($username);

        // Email
        $email = new Text('email');

        $email->setLabel('Email');
        $email->setAttributes(array(
            'class' => 'form-control ',
        ));

//        $email->addValidators(array(
//            new PresenceOf(array(
//                'message' => 'The e-mail is required'
//            )),
//            new email(array(
//                'message' => 'The e-mail is not valid'
//            ))
//        ));

        $this->add($email);
        //old password
        $oldpassword = new Password('oldpassword');

        $oldpassword->setLabel('Old Password');
        $oldpassword->setAttributes(array(
            'class' => 'form-control ',
            'placeholder' => 'Old password'
        ));
        $this->add($oldpassword);
        // Password
        $password = new Password('password');

        $password->setLabel('Password');
        $password->setAttributes(array(
            'class' => 'form-control ',
            'placeholder' => 'Password'
        ));

        if ($options['edit'] == false) {
            $password->addValidators(array(
                new PresenceOf(array(
                    'message' => 'The password is required'
                )),
                new StringLength(array(
                    'min' => 8,
                    'messageMinimum' => 'Password is too short. Minimum 8 characters'
                )),
                new Confirmation(array(
                    'message' => 'Password doesn\'t match confirmation',
                    'with' => 'confirmPassword'
                ))
            ));
        }

        $this->add($password);

        // Confirm Password
        $confirmPassword = new Password('confirmPassword');

        $confirmPassword->setLabel('Confirm Password');
        $confirmPassword->setAttributes(array(
            'class' => 'form-control ',
            'placeholder' => 'Confirm password'
        ));

        if ($options['edit'] == false) {
            $confirmPassword->addValidators(array(
                new PresenceOf(array(
                    'message' => 'The confirmation password is required'
                ))
            ));
        }

        $this->add($confirmPassword);

        if ($options['profile'] == false) {
            $group = new Select('group_id',
                Groups::find(),
                array('using' =>
                    array('id', 'name'),
                    'useEmpty' => true,
                    'emptyText' => 'Select users group',
                    'emptyValue' => '',
                    'class' => 'form-control '
                ));
            $group->setLabel('Selete group');
            $group->addValidators(array(
                new PresenceOf(array(

                ))
            ));

            $this->add($group);
        }


//        Tạo Publish
        /*$publish = new Select('publish',
            array(
                '0' => 'Vô hiệu hóa',
                '1' => 'Hoạt động'
            ),
            array('using' =>
                array('id', 'name'),
                'useEmpty' => true,
                'emptyText' => 'Kích hoạt ...',
                'emptyValue' => '',
                'class' => 'form-control'
            )
        );
        $publish->setLabel('Kích hoạt');
        $publish->addValidators(array(
            new PresenceOf(array(
                'message' => 'The publish is required'
                ))
        ));
        $this->add($publish);*/



        // CSRF
//        $csrf = new Hidden('csrf');
//
//        $csrf->addValidator(new Identical(array(
//            'value' => $this->security->getSessionToken(),
//            'message' => 'CSRF validation failed'
//        )));
//
//        $this->add($csrf);

        // Sign Up
        $submit = new Submit('submit', array(
            'class' => 'btn btn-primary'
        ));
        $submit->setLabel('Lưu');
        $this->add($submit);
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