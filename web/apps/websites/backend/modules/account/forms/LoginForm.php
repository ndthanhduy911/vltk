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
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập tên tài khoản",
            'maxlength' => "100",
            'placeholder' => "Vui lòng nhập tài khoản",
            'data-error' => "Tên tài khoản chưa hợp lệ"
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
        $username->setLabel('Tên tài khoản');
        $this->add($username);


        $password = new Password('password');
        $password->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập tên tài khoản",
            'maxlength' => "32",
            'placeholder' => "Vui lòng nhập mật khẩu",
            'data-error' => "Mật khẩu không đúng quy định"
        ));
        $password->addValidators([
            new PresenceOf([
                'message'   => 'Mật khẩu không được để trống'
            ]),
            new StringLength(
                [
                    "max"            => 32,
                    "messageMaximum" => "Mật khẩu không được quá 60 ký tự",
                ]
            )
        ]);
        $password->setLabel('Mật khẩu');
        $this->add($password);

        $captcha = new Text('captcha');
        $captcha->setAttributes(array(
            'class' => 'form-control form-control-sm',
            // 'placeholder' => 'Mã xác thực',
            'required' => '',
            'data-required-error' => "Vui lòng nhập mã xác thực",
            'maxlength' => "4",
            'size' => "4",
            'pattern' => "^[0-9]{1,}$",
            'placeholder' => "Vui lòng nhập mật mã xác thực",
            'data-error' => "Mã xác thực chưa hợp lệ",
        ));
        $captcha->addValidators([
            new PresenceOf([
                'message'   => 'Mã xác thực không được để trống'
            ]),
            new StringLength(
                [
                    "max"            => 6,
                    "messageMaximum" => "Mã xác thực không được quá 6 ký tự",
                ]
            )
        ]);
        $captcha->setLabel('Mã xác thực');
        $this->add($captcha);
    }
}
