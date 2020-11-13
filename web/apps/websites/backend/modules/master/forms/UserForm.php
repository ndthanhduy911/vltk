<?php
namespace Backend\Modules\Master\Forms;

use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\File;

class UserForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {
        $username = new Text('username');
        $username->setLabel('Tên tài khoản '.requiredLabel());
        $username->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "30",
            'required' => '',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin chưa hợp lệ",
            'placeholder' => 'Ví dụ: admin',
        ));
        $this->add($username);

        $fullname = new Text('fullname');
        $fullname->setLabel('Họ và tên '.requiredLabel());
        $fullname->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "100",
            'required' => '',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin chưa hợp lệ",
            'placeholder' => 'Ví dụ: Quản trị viên',
        ));
        $this->add($fullname);

        $avatar = new File('avatar');
        $this->add($avatar);

        //gender
        $gender = new Select('gender',[
            1              => "Nữ",
            2              => "Nam",
        ], [
            'class'         => 'form-control form-control-sm',
            'useEmpty' => true,
            'emptyText' => 'Giới tính',
            'emptyValue' => '',
        ]);
        $gender->setLabel('Giới tính');
        $this->add($gender);

        $email = new Email('email');
        $email->setLabel('E-mail '.requiredLabel());
        $email->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'data-required-error' => "Vui lòng nhập thông tin",
            'maxlength' => "50",
            'required' => '',
            'placeholder' => 'Ví dụ: admin@honeynet.vn',
            'data-error' => "Vui lòng nhập đúng email",
        ));
        $this->add($email);

        $addpassword = new Password('addpassword');
        $addpassword->setLabel('Mật khẩu '.requiredLabel());
        $addpassword->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập mật khẩu",
            'placeholder' => 'Mật khẩu nên có dài 6-32 ký tự, có ký tự chữ số, chữ hoa và chữ thường, ký tự @#$!%^&*',
            // 'pattern' => "^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$!%^&*])[0-9a-zA-Z@#$!%^&*.]{6,32}$",
            // 'data-error' => "Vui lòng nhập mật khẩu dài 6-32 ký tự, có ký tự chữ số, chữ hoa và chữ thường, ký tự @#$!%^&*",
        ));
        $this->add($addpassword);

        $confirmPassword = new Password('confirmPassword');
        $confirmPassword->setLabel('Nhập lại mật khẩu '.requiredLabel());
        $confirmPassword->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập lại mật khẩu",
            'maxlength' => "32",
            'data-error' => "Mật khẩu không đúng quy định.",
            'data-match' => "#addpassword",
            'placeholder' => 'Mật khẩu nên có dài 6-32 ký tự, có ký tự chữ số, chữ hoa và chữ thường, ký tự @#$!%^&*',
            'data-match-error' => "Mật khẩu không trùng khớp",
        ));
        $this->add($confirmPassword);

        $password = new Password('password');
        $password->setLabel('Mật khẩu');
        $password->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập mật khẩu",
            'maxlength' => "32",
            'placeholder' => 'Mật khẩu nên có dài 6-32 ký tự, có ký tự chữ số, chữ hoa và chữ thường, ký tự @#$!%^&*',
            'data-error' => "Mật khẩu không đúng quy định",
        ));
        $this->add($password);

        $roleid = new Select('roleid', \Role::find(["id != 1"]), array(
            'using' => array('id', 'name'),
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Nhóm người dùng đúng quy định.",
        ));
        $roleid->setLabel('Nhóm người dùng '.requiredLabel());
        $this->add($roleid);

        //status
        $status = new Select('status',[
            1              => "Hoạt động",
            0              => "Khóa",
        ], [
            'class'         => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập thông tin",
        ]);
        $status->setLabel('Trạng thái');
        $this->add($status);
        
        //dept
        $perL = \Library\Master\Master::checkPermissionDepted('user','index');
        $deptType = \Depts::getTreeNamePermission($perL);
        $deptid = new Select('deptid', $deptType, array(
            'class' => 'form-control form-control-sm',
            'data-error' => "Thông tin chưa hợp lệ",
            'required' => '',
            'useEmpty'      => true,
            'emptyValue'    => '',
            'emptyText'     => 'Không có',
            'data-required-error' => "Vui lòng nhập thông tin",
        ));
        $deptid->setLabel('Đơn vị/bộ phận '.requiredLabel());
        $this->add($deptid);
    }
}
