<?php
namespace Backend\Modules\Master\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Email;

class ProfileForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $username = new Text('username');
        $username->setLabel('Tên đăng nhập:');
        $username->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập thông tin",
            'maxlength' => "100",
            'pattern'=>"^[_A-z0-9]{1,}$",
            'placeholder' => 'Ví dụ: admin',
            'data-error' => "username chưa hợp lệ.",
            'disabled' => '',
        ));
        $this->add($username);

        $gender = new Select('gender', [
            1 => "Nữ",
            2 => "Nam",
        ], [
            'class' => 'form-control form-control-sm',
        ]);
        $gender->setLabel('Giới tính:');
        $this->add($gender);

        $fullname = new Text('fullname');
        $fullname->setLabel('Họ và tên:');
        $fullname->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập thông tin",
            'maxlength' => "100",
            'placeholder' => 'Ví dụ: Quản trị viên',
            'data-error' => "Họ tên không đúng quy định.",
        ));
        $this->add($fullname);

        $email = new Email('email');
        $email->setLabel('E-mail:');
        $email->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'data-required-error' => "Vui lòng nhập thông tin",
            'maxlength' => "100",
            'required' => '',
            'placeholder' => 'Ví dụ: admin@honeynet.vn',
            'data-error' => "Vui lòng nhập đúng email",
            ));
        $this->add($email);
    }
}