<?php
namespace Backend\Modules\Users\Forms;

use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\StringLength;

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
        $oldPassword->addValidators(array(
            new PresenceOf(array(
                'message' => 'Mật khẩu hiện tại không được bỏ trống.',
            )),
            new StringLength([
                "max" => 100,
                "messageMaximum" => "Mật khẩu hiện tại không được dài quá 100 ký tự",
            ]),
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
        $password->addValidators(array(
            new PresenceOf(array(
                'message' => 'Mật khẩu hiện tại không được bỏ trống.',
            )),
            new StringLength([
                "max" => 100,
                "messageMaximum" => "Mật khẩu hiện tại không được dài quá 100 ký tự",
            ]),
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
