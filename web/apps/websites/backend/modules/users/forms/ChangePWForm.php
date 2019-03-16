<?php
namespace Backend\Modules\Users\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Password;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Confirmation;

class ChangePWForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $oldPassword = new Password('oldPassword');
        $oldPassword->setLabel('Mật khẩu hiện tại:');
        $oldPassword->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Mật khẩu hiện tại',
            'required' => '',
            'data-required-error' => "Vui lòng nhập mật khẩu hiện tại.",
            'maxlength' => "100",
            'data-error' => "Mật khẩu không đúng quy định.",
            ));
        $this->add($oldPassword);

        $password = new Password('password');
        $password->setLabel('Mật khẩu mới:');
        $password->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Mật khẩu mới',
            'required' => '',
            'data-required-error' => "Vui lòng nhập mật khẩu mới.",
            'maxlength' => "100",
            'data-error' => "Mật khẩu không đúng quy định.",
            ));
        $this->add($password);

        $confirmPassword = new Password('confirmpassword');
        $confirmPassword->setLabel('Nhập lại mật khẩu:');
        $confirmPassword->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Nhập lại mật khẩu',
            'required' => '',
            'data-required-error' => "Vui lòng nhập lại mật khẩu.",
            'maxlength' => "100",
            'data-error' => "Mật khẩu không đúng quy định.",
            'data-match' => "#password",
            'data-required-error' => "Mật khẩu không trùng khớp.",
            ));
        $this->add($confirmPassword);
    }
}