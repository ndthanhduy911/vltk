<?php
namespace Backend\Modules\Users\Forms;

use Library\Helper\Helper as Helper;
use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\File;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\InclusionIn;

use Models\Roles;
use Models\Departments;

class UserForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {
        if((int)$this->session->get('role') !== 1){
            $departments = Departments::find(["id IN (".implode(',',$this->session->get('dept_mg')).")"]);
            $roles = Roles::find(["id != 1"]);
        }else{
            $roles = Roles::find();
            $departments = Departments::find();
        }

        $username = new Text('username');
        $username->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tên đăng nhập',
            'required' => '',
            'data-required-error' => "Vui lòng nhập username.",
            'maxlength' => "100",
            'pattern' => "^[_A-z0-9]{1,}$",
            'data-error' => "tên đăng nhập chưa hợp lệ",
        ));
        $username->addValidators(array(
            new PresenceOf(array(
                'message' => 'Tên tài khoản không được để trống',
            )),
            new StringLength([
                "max" => 100,
                "messageMaximum" => "Tên tài khoản không được dài quá 100 ký tự",
            ]),
        ));
        $this->add($username);

        $name = new Text('name');
        $name->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Họ và tên',
            'required' => '',
            'data-required-error' => "Vui lòng điền đầy đủ thông tin.",
            'maxlength' => "100",
            'data-error' => "Họ tên không đúng quy định",
        ));
        $name->addValidators(array(
            new PresenceOf(array(
                'message' => 'Họ & Tên không được để trống',
            )),
            new StringLength([
                "max" => 100,
                "messageMaximum" => "Họ & Tên không được dài quá 100 ký tự",
            ]),
        ));
        $this->add($name);

        $email = new Email('email');
        $email->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => "E-mail",
            'data-required-error' => "Vui lòng điền đầy đủ thông tin",
            'maxlength' => "100",
            'required' => '',
            'data-error' => "Chưa đúng định dạng e-mail",
        ));
        $email->addValidators(array(
            new PresenceOf(array(
                'message' => 'Địa chỉ e-mail không được để trống',
            )),
            new StringLength([
                "max" => 100,
                "messageMaximum" => "Địa chỉ e-mail không được dài quá 100 ký tự",
            ]),
        ));
        $this->add($email);

        $avatar = new File('avatar');
        $avatar->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => "Ảnh đại diện",
            'data-error' => "Chưa đúng định dạng",
        ));
        $this->add($avatar);

        $phone = new Text('phone');
        $phone->setAttributes(array(
            'class' => 'form-control',
            'maxlength' => "10",
            'data-error' => "Số điện thoại không đúng quy định.",
            'placeholder' => 'Vui lòng nhập số điện thoại',
            'pattern' => "^(03[23456789]|03|02|08|09|05|07)[0-9]{8}$",
            'required' => '',
            'data-required-error' => "Vui lòng điền đầy đủ thông tin",
        ));
        $phone->addValidators(array(
            new PresenceOf(array(
                'message' => 'Số điện thoại không được để trống',
            )),
            new StringLength([
                "max" => 100,
                "messageMaximum" => "Số điện thoại không được dài quá 100 ký tự",
            ]),
        ));
        $this->add($phone);

        $password = new Password('password');
        $password->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Mật khẩu',
            'required' => '',
            'data-required-error' => "Vui lòng điền đầy đủ thông tin",
            'maxlength' => "100",
            'minlength' => "6",
            'data-error' => "Mật khẩu có trên 6 ký tự",
        ));
        $password->addValidators(array(
            new PresenceOf(array(
                'message' => 'Mật khẩu không được để trống',
            )),
            new StringLength([
                "max" => 100,
                "min" => 6,
                "messageMinimum" => "Mật khẩu phải dài hơn 5 ký tự",
                "messageMaximum" => "Mật khẩu không được dài quá 100 ký tự",
            ]),
        ));
        $this->add($password);

        $confirm_password = new Password('confirm_password');
        $confirm_password->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Nhập lại mật khẩu',
            'required' => '',
            'data-required-error' => "Vui lòng điền đầy đủ thông tin",
            'maxlength' => "100",
            'data-error' => "Mật khẩu không đúng quy định.",
            'data-match' => "#password",
            'data-match-error' => "Mật khẩu không trùng khớp.",
        ));
        $this->add($confirm_password);

        $dept_id = new Select('dept_id', $departments, array(
            'using' => array('id', 'name'),
            'useEmpty' => true,
            'emptyText' => 'Vui lòng chọn đơn vị',
            'emptyValue' => '',
            'class' => 'form-control select2-basic',
            'required' => '',
            'data-required-error' => "Vui lòng điền đầy đủ thông tin",
            'data-error' => "Chưa đúng định dạng",
        ));
        $dept_id->addValidators(array(
            new PresenceOf(array(
                'message' => 'Đơn vị không được để trống',
            )),
        ));
        $this->add($dept_id);

        $status = new Select('status', [
            1 => "Sử dụng",
            0 => "Khóa",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Vui lòng chọn trạng thái',
            'emptyValue' => '',
            'class' => 'form-control',
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ]);
        $status->addValidators(array(
            new PresenceOf(array(
                'message' => 'Trạng thái không được để trống.',
            )),
            new InclusionIn([
                'message'   => 'Trạng thái không hợp lệ',
                'domain'    => [0 , 1, 4]
            ])
        ));
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
        $role->addValidators(array(
            new PresenceOf(array(
                'message' => 'Quyền không được để trống',
            )),
            new InclusionIn([
                'message'   => 'Quyền không hợp lệ',
                'domain'    => Helper::flatten($roles->toArray())
            ])
        ));
        $this->add($role);
    }
}
