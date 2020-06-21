<?php
namespace Backend\Modules\Account\Forms;

use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Text;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\StringLength;

class LoginForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {
        $username = new Text('username');
        $username->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tên đăng nhập',
            'required' => '',
            'data-required-error' => "Vui lòng nhập thông tin",
            'maxlength' => "100",
            'pattern' => "^[_A-z0-9]{1,}$",
            'data-error' => "Thông tin không hợp lệ",
        ));
        $username->addValidators([
            new PresenceOf([
                'message'   => 'Tài khoản không được để trống'
            ]),
            new StringLength(
                [
                    "max"            => 100,
                    "messageMaximum" => "Tài khoản không được quá 100 ký tự",
                ]
            )
        ]);
        $this->add($username);


        $password = new Password('password');
        $password->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Mật khẩu',
            'required' => '',
            'data-required-error' => "Vui lòng nhập thông tin",
            'maxlength' => "60",
            'data-error' => "Thông tin không hợp lệ",
        ));
        $password->addValidators([
            new PresenceOf([
                'message'   => 'Mật khẩu không được để trống'
            ]),
            new StringLength(
                [
                    "max"            => 60,
                    "messageMaximum" => "Mật khẩu không được quá 60 ký tự",
                ]
            )
        ]);
        $this->add($password);
    }
}
