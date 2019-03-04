<?php
namespace Frontend\Modules\Physics\Forms;

use Library\Helper\Helper;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Check;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Radio;
use Phalcon\Forms\Element\Email as Email;
use Phalcon\Validation\Validator\Digit as DigitValidator;
use Phalcon\Forms\Element\File;
use Phalcon\Validation\Validator\Email as valEmail;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Confirmation;
use Phalcon\Validation\Validator\Between;
use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Base\Forms\BaseForm;
use Library\Common as LibraryCommon;
use Models\Department;

class RegisterForm extends BaseForm{
    public function initialize($entity = null, $options = null){
        //client name
        $name = new Text('name',[
            'class'         => 'form-control',
            'placeholder'   => 'Họ và tên',
            'required'      => true,
            'maxlength'     => 255,
            'minlength'     => 5,
            'size'          => 255,
            'data-required-error'   =>  "Vui lòng nhập họ và tên của bạn.",
            'data-error'            =>  "Chưa đúng định dạng."
        ]);
        $name->addValidators([
            new PresenceOf([
                'message'   => 'The client name is required'
            ]),
        ]);
        $name->setLabel("Họ và tên <strong class=\"text-danger\">*</strong>");
        $this->add($name);

        //address
        $address = new Text('address',[
            'class'         => 'form-control',
            'placeholder'   => 'Địa chỉ liên hệ',
            'required'      => true,
            'maxlength'     => 255,
            'size'          => 255,
            'data-required-error'   =>  "Vui lòng nhập địa chỉ liên hệ của bạn.",
            'data-error'            =>  "Chưa đúng định dạng."
        ]);
        $address->addValidators([
            new PresenceOf([
                'message'   => 'The address is required'
            ]),
        ]);
        $address->setLabel("Địa chỉ liên hệ <strong class=\"text-danger\">*</strong>");
        $this->add($address);

        //address
        $department_id = new Select('department_id',Department::find(['id != 1']), [
            'using'         => array('id', 'name'),
            'class'         => 'form-control',
            'required'      => true
        ]);

        $department_id->setLabel("Đơn vị <strong class=\"text-danger\">*</strong>");
        $this->add($department_id);

        $email = new Email('email',[
            'class'         => 'form-control',
            'placeholder'   => 'Email',
            'required'      => true,
            'minlength'     => 5,
            'size'          => 255,
            'data-required-error'   =>  "Vui lòng nhập email của bạn.",
            'data-error'            =>  "Chưa đúng định dạng."
        ]);
        $email->setLabel("Email <strong class=\"text-danger\">*</strong>");
        $this->add($email);

        $phone = new Text('phone',[
            'class'         => 'form-control',
            'placeholder'   => 'Số điện thoại',
            'required'      => true,
            'size'          => 255,
            'data-required-error'   =>  "Vui lòng nhập số điện thoại của bạn.",
            'data-error'            =>  "Chưa đúng định dạng."
        ]);
        $phone->addValidators([
            new PresenceOf([
                'message'   => 'The phone is required'
            ]),
        ]);
        $phone->setLabel("Số điện thoại <strong class=\"text-danger\">*</strong>");
        $this->add($phone);

        $password = new Password('password',[
            'class'         => 'form-control',
            'placeholder'   => 'Nhập mật khẩu',
            'required'      => true,
            'maxlength'     => 150,
            'data-required-error'   =>  "Vui lòng nhập mật khẩu của bạn.",
            'data-error'            =>  "Chưa đúng định dạng."
        ]);
        $password->setLabel("Mật khẩu <strong class=\"text-danger\">*</strong>");
        $this->add($password);

        $confrim_password = new Password('confrim_password',[
            'class'         => 'form-control',
            'placeholder'   => 'Xác nhận mật khẩu',
            'required'      => true,
            'maxlength'     => 150,
            'data-match'    => "#password",
            'data-required-error'   =>  "Vui lòng nhập nhập lại mật khẩu của bạn.",
            'data-error'            =>  "Mật khẩu không trùng khớp."
        ]);
        $confrim_password->setLabel("Xác nhận Mật khẩu <strong class=\"text-danger\">*</strong>");
        $this->add($confrim_password);

        //status
        $status = new Select('status',[
            ''              => 'Status',
            1               => "Active",
            0               => "Disabled"
        ], [
            'class'         => 'form-control',
            'useEmpty'      => false,
            'emptyText'     => 'Chọn...',
            'required'      => true
        ]);

        $status->setLabel("Tình trạng <strong class=\"text-danger\">*</strong>");
        $this->add($status);
    }
}
