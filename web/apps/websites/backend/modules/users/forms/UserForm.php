<?php
namespace Backend\Modules\Users\Forms;

use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Validation\Validator\PresenceOf;

use Backend\Modules\Users\Models\Roles;
use Models\Departments;

class UserForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {

        // switch ((int) (int)$this->session->get('role')) {
        //     case 1:{
        //             $roles_array = Roles::find(["id > 1"]);
        //             $department = Departments::find();
        //             break;
        //         }

        //     case 2:
        //     case 3:
        //         {
        //             $roles_array = Roles::find(["id >= {$this->session->get('role')}"]);
        //             $department = Departments::find(["id IN (".implode(',',$this->session->get('department_mg')).")"]);
        //             break;
        //         }
        //     default:
        //         echo 'Truy cập không được phép';die;
        //         break;
        // }
        $roles = Roles::find();
        $departments = Departments::find();

        $username = new Text('username');
        $username->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tên đăng nhập',
            'required' => '',
            'data-required-error' => "Vui lòng nhập username.",
            'maxlength' => "100",
            'pattern' => "^[_A-z0-9]{1,}$",
            'data-error' => "tên đăng nhập chưa hợp lệ.",
        ));
        $this->add($username);

        $name = new Text('name');
        $name->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Họ và tên',
            'required' => '',
            'data-required-error' => "Vui lòng điền đầy đủ thông tin.",
            'maxlength' => "100",
            'data-error' => "Họ tên không đúng quy định.",
        ));
        $this->add($name);

        $email = new Email('email');
        $email->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => "Email",
            'data-required-error' => "Vui lòng điền đầy đủ thông tin.",
            'maxlength' => "100",
            'required' => '',
            'data-error' => "Chưa đúng định dạng",
        ));
        $this->add($email);

        $phone = new Text('phone');
        $phone->setAttributes(array(
            'class' => 'form-control',
            'maxlength' => "10",
            'data-error' => "Số điện thoại không đúng quy định.",
            'placeholder' => 'Vui lòng nhập số điện thoại',
            'pattern' => "^(03[23456789]|03|02|08|09|05|07)[0-9]{8}$",
            'required' => '',
            'data-required-error' => "Vui lòng điền đầy đủ thông tin.",
        ));
        $this->add($phone);

        $password = new Password('password');
        $password->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Mật khẩu',
            'required' => '',
            'data-required-error' => "Vui lòng điền đầy đủ thông tin.",
            'maxlength' => "100",
            'data-error' => "Mật khẩu không đúng quy định.",
        ));
        $this->add($password);

        $confirm_password = new Password('confirm_password');
        $confirm_password->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Nhập lại mật khẩu',
            'required' => '',
            'data-required-error' => "Vui lòng điền đầy đủ thông tin.",
            'maxlength' => "100",
            'data-error' => "Mật khẩu không đúng quy định.",
            'data-match' => "#password",
            'data-match-error' => "Mật khẩu không trùng khớp.",
        ));
        $this->add($confirm_password);

        $department_id = new Select('department_id', $departments, array(
            'using' => array('id', 'name'),
            'useEmpty' => true,
            'emptyText' => 'Vui lòng chọn đơn vị',
            'emptyValue' => '',
            'class' => 'form-control',
            'required' => '',
            'data-required-error' => "Vui lòng điền đầy đủ thông tin.",
            'data-error' => "Chưa đúng định dạng",
        ));
        $this->add($department_id);

        $status = new Select('status', [
            1 => "Sử dụng",
            0 => "Dừng",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Vui lòng chọn trạng thái',
            'emptyValue' => '',
            'class' => 'form-control',
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ]);
        $this->add($status);

        $role = new Select('role', $roles, array(
            'using' => array('id', 'name'),
            'useEmpty' => true,
            'emptyText' => 'Vui lòng chọn quyền',
            'emptyValue' => '',
            'class' => 'form-control',
            'required' => '',
            'data-required-error' => "Vui lòng điền đầy đủ thông tin.",
            'data-error' => "Chưa đúng định dạng",
        ));
        $this->add($role);
    }
}
