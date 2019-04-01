<?php
namespace Backend\Modules\Posts\Forms;


use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Regex as RegexValidator;

class PostsForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $title = new Text('title');
        $title->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề.",
            'maxlength' => "255",
            'data-error' => "Tiêu đề không đúng quy định.",
        ));
        $title->addValidators(array(
            new PresenceOf(array(
                'message' => 'Tiêu đề không được bỏ trống.',
            )),
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Tiêu đề không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($title);

        $except = new Textarea('except');
        $except->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tóm tắt',
            'maxlength' => "255",
            'data-error' => "Tóm tắt không đúng quy định.",
            'rows' => 4
        ));
        $except->addValidators(array(
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Tóm tắt không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($except);

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
