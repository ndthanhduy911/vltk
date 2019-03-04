<?php

namespace Backend\Modules\Dashboard\Forms;

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

class EditClientForm extends BaseForm{
    public function initialize($entity = null, $options = null){
        //client name
        $name = new Text('name',[
            'class'         => 'form-control',
            'placeholder'   => 'Họ và tên',
            'required'      => true,
            'maxlength'     => 255,
            'minlength'     => 5,
            'size'          => 255,
            'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
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
            'placeholder'   => 'Địa chỉ',
            'required'      => true,
            'maxlength'     => 255,
            'size'          => 255,
            'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
        ]);
        $address->addValidators([
            new PresenceOf([
                'message'   => 'The address is required'
            ]),
        ]);
        $address->setLabel("Địa chỉ <strong class=\"text-danger\">*</strong>");
        $this->add($address);

        //department
        $department_id = new Select('department_id',Department::find(['id != 1']), [
            'using'         => array('id', 'name'),
            'class'         => 'form-control',
            'useEmpty'      => true,
            'emptyText'     => 'Chọn...',
            'emptyValue'     => '',
            'data-live-search' => "true",
            'required'      => true,
            'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
        ]);

        $department_id->setLabel("Đơn vị <strong class=\"text-danger\">*</strong>");
        $this->add($department_id);

        $email = new Email('email',[
            'class'         => 'form-control',
            'placeholder'   => 'Email',
            'required'      => true,
            'maxlength'     => 255,
            'size'          => 255,
            'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
        ]);
        $email->addValidators([
            new PresenceOf([
                'message'   => 'The Email name is required'
            ]),
        ]);
        $email->setLabel("Email <strong class=\"text-danger\">*</strong>");
        $this->add($email);

        $phone = new Text('phone',[
            'class'         => 'form-control',
            'placeholder'   => 'Điện thoại',
            'required'      => true,
            'size'          => 255,
            'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
        ]);
        $phone->addValidators([
            new PresenceOf([
                'message'   => 'The phone is required'
            ]),
        ]);
        $phone->setLabel("Điện thoại <strong class=\"text-danger\">*</strong>");
        $this->add($phone);

        //status
        $status = new Select('status',[
            ''              => 'Chọn...',
            1               => "Active",
            0               => "Disabled"
        ], [
            'class'         => 'form-control',
            'useEmpty'      => false,
            'emptyText'     => 'Chọn...',
            'required'      => true,
            'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
        ]);

        $status->addValidators([
            new PresenceOf([
                'message'   => 'The status is required'
            ]),
        ]);

        $status->setLabel("Tình trạng <strong class=\"text-danger\">*</strong>");
        $this->add($status);
    }
}
