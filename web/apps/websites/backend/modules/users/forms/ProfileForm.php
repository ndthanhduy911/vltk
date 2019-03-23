<?php
namespace Backend\Modules\Users\Forms;

use Models\Roles as Roles;
use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Regex as RegexValidator;

class ProfileForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $roles = Roles::findFirstId($_SESSION['user_id']);
        if ($this->session->get('role') !== 1) {
            $department = Roles::findFirstId($_SESSION['department_id']);
        } else {
            $department = false;
        }

        $username = new Text('username');
        $username->setLabel('Tài khoản:');
        $username->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tên đăng nhập',
            'required' => '',
            'data-required-error' => "Vui lòng nhập username.",
            'maxlength' => "100",
            'pattern' => "^[_A-z0-9]{1,}$",
            'data-error' => "username chưa hợp lệ.",
            'disabled' => '',
        ));
        $this->add($username);

        $name = new Text('name');
        $name->setLabel('Họ và tên:');
        $name->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Họ & Tên',
            'required' => '',
            'data-required-error' => "Vui lòng nhập Họ & Tên.",
            'maxlength' => "100",
            'data-error' => "Họ & Tên không đúng quy định.",
        ));
        $name->addValidators(array(
            new PresenceOf(array(
                'message' => 'Họ & Tên không được bỏ trống.',
            )),
            new StringLength([
                "max" => 100,
                "messageMaximum" => "Họ & Tên không được dài quá 100 ký tự",
            ]),
        ));
        $this->add($name);

        $email = new Email('mail');
        $email->setLabel('E-mail:');
        $email->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => "E-mail",
            'data-required-error' => "Vui lòng nhập e-mail.",
            'maxlength' => "100",
            'required' => '',
            'data-error' => "Vui lòng nhập đúng e-mail.",
        ));
        $email->addValidators(array(
            new PresenceOf(array(
                'message' => 'E-mail không được bỏ trống.',
            )),
            new StringLength([
                "max" => 100,
                "messageMaximum" => "E-mail không được dài quá 100 ký tự",
            ]),
            new EmailValidator(
                [
                    "message" => "E-mail không đúng định dạng",
                ]
            ),
        ));
        $this->add($email);

        $phone = new Text('phone');
        $phone->setLabel('Số điện thoại:');
        $phone->setAttributes(array(
            'class' => 'form-control',
            'maxlength' => "15",
            'data-minlength' => '10',
            'data-error' => "Số điện thoại không đúng quy định.",
            'pattern' => "^(01[23689]|09|02|08)[0-9]{8}$",
            'required' => '',
            'data-required-error' => "Vui lòng nhập số điện thoại.",
        ));
        $phone->addValidators(array(
            new PresenceOf(array(
                'message' => 'E-mail không được bỏ trống.',
            )),
            new StringLength([
                "max" => 15,
                "messageMaximum" => "E-mail không được dài quá 15 ký tự",
            ]),
            new RegexValidator(
                [
                    "pattern" => "/^(01[23689]|09|02|08)[0-9]{8}$/",
                    "message" => "Số điện thoại chưa đúng",
                ]
            ),
        ));
        $this->add($phone);

        $dept = new Text('dept_name');
        $dept->setLabel('Đơn vị:');
        $dept->setAttributes([
            'class' => "form-control",
            'value' => $department ? $department->name : 'ADMIN',
            'disabled' => true,
        ]);
        $this->add($dept);

        $role = new Text('role_name');
        $role->setLabel('Quyền:');
        $role->setAttributes([
            'class' => "form-control",
            'value' => $roles->name,
            'disabled' => true,
        ]);
        $this->add($role);
    }
}
