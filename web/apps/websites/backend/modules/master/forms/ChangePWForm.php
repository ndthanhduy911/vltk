<?php
namespace Backend\Modules\Master\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Password;

class ChangePWForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $oldPassword = new Password('oldPassword');
        $oldPassword->setLabel('Mật khẩu hiện tại:');
        $oldPassword->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập mật khẩu hiện tại",
            'minlength' => "6",
            'maxlength' => "32",
            // 'pattern' => "^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{6,32}$",
            'placeholder' => 'Mật khẩu hiện tại',
            'data-error' => "Vui lòng nhập mật khẩu dài 6-32 ký tự, có ký tự chữ số, chữ hoa và chữ.",
            ));
        $this->add($oldPassword);

        $password = new Password('password');
        $password->setLabel('Mật khẩu mới:');
        $password->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập mật khẩu mới",
            'placeholder' => 'Mật khẩu nên có dài 6-32 ký tự, có ký tự chữ số, chữ hoa và chữ thường, ký tự @#$!%^&*',
            // 'pattern' => "^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$!%^&*])[0-9a-zA-Z@#$!%^&*.]{6,32}$",
            // 'data-error' => "Vui lòng nhập mật khẩu dài 6-32 ký tự, có ký tự chữ số, chữ hoa và chữ thường, ký tự @#$!%^&*",
            ));
        $this->add($password);

        $confirmPassword = new Password('confirmpassword');
        $confirmPassword->setLabel('Nhập lại mật khẩu');
        $confirmPassword->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập lại mật khẩu",
            'maxlength' => "100",
            'data-error' => "Mật khẩu không đúng quy định",
            'data-match' => "#password",
            'placeholder' => 'Mật khẩu nên có dài 6-32 ký tự, có ký tự chữ số, chữ hoa và chữ thường, ký tự @#$!%^&*',
            'data-required-error' => "Mật khẩu không trùng khớp",
            ));
        $this->add($confirmPassword);
    }
}