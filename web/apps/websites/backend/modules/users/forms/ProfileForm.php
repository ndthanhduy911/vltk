<?php
namespace Backend\Modules\Users\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Check;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\File;
use Phalcon\Forms\Element\Email;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Confirmation;
use Models\Roles as Roles;

class ProfileForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $roles = Roles::findFirstId($_SESSION['user_id']);
        if($this->session->get('role') !== 1){
            $department = Roles::findFirstId($_SESSION['department_id']);
        }else{
            $department = false ;
        }

        $username = new Text('username');
        $username->setLabel('Username:');
        $username->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tên đăng nhập',
            'required' => '',
            'data-required-error' => "Vui lòng nhập username.",
            'maxlength' => "100",
            'pattern'=>"^[_A-z0-9]{1,}$",
            'data-error' => "username chưa hợp lệ.",
            'disabled' => '',
            ));
        $this->add($username);


        $name = new Text('name');

        $name->setLabel('Họ và tên:');
        $name->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Họ và tên',
            'required' => '',
            'data-required-error' => "Vui lòng nhập Họ và tên.",
            'maxlength' => "100",
            'data-error' => "Họ tên không đúng quy định.",
        ));

        $this->add($name);

        $email = new Email('mail');
        $email->setLabel('Email:');
        $email->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => "Email",
            'data-required-error' => "Vui lòng nhập email.",
            'maxlength' => "100",
            'required' => '',
            'data-error' => "Vui lòng nhập đúng email.",
            ));
        $this->add($email);

        $phone = new Text('phone');
        $phone->setLabel('Số điện thoại:');
        $phone->setAttributes(array(
            'class' => 'form-control',
            'maxlength' => "15",
            'data-minlength'=>'10',
            'data-error' => "Số điện thoại không đúng quy định.",
            'pattern' => "^(01[23689]|09|02|08)[0-9]{8}$",
            'required' => '',
            'data-required-error' => "Vui lòng nhập số điện thoại.",
            ));
        $this->add($phone);

        $dept = new Text('dept_name');
        $dept->setLabel('Đơn vị:');
        $dept->setAttributes([
            'class'         => "form-control",
            'value'         => $department ? $department->name : 'ADMIN',
            'disabled'      => true,
        ]);
        $this->add($dept);

        $role = new Text('role_name');
        $role->setLabel('Quyền:');
        $role->setAttributes([
            'class'         => "form-control",
            'value'         => $roles->name,
            'disabled'      => true,
        ]);
        $this->add($role);

    }
}