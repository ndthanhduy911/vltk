<?php
/**
 * Created by Nguyen Dang Thanh Duy.
 * Date: 7/18/17
 * Time: 10:10 AM
 */

namespace Backend\Modules\User\Forms;

use Library\Helper\Helper;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Check;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Radio;
use Phalcon\Forms\Element\File;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Confirmation;
use Phalcon\Validation\Validator\Between;
use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Base\Forms\BaseForm;
use Phalcon\Validation\Validator\Digit as DigitValidator;
use Library\Common as LibraryCommon;

use Models\GroupUser;
use Models\Department;

class EditUserForm extends BaseForm
{
    public function initialize($entity = null , $options = null)
    {

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

        //email
        $email = new Email('email', array(
            'class'         => 'form-control',
            'placeholder'   => 'Địa chỉ Email',
            'required'      => true,
            'maxlength'     => 255,
            'data-error'    => 'Vui lòng nhập đúng định dạng email.',
            'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
            // 'pattern'       =>'^[a-z][a-z0-9_\.]{0,100}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$',
        ));
        $email->setLabel("Địa chỉ Email <strong class=\"text-danger\">*</strong>");
        $this->add($email);
        //full name
        $fullname = new Text('fullname', array(
            'class'         => 'form-control',
            'placeholder'   => 'Họ & Tên',
            'required'      => true,
            'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
        ));
        $fullname->setLabel("Họ & Tên <strong class=\"text-danger\">*</strong>");
        $this->add($fullname);

        //address
        $address = new Text('address', array(
            'class' => 'form-control',
            'placeholder'   => 'Địa chỉ',
            'maxlength'     => 255,
            'required'      => true,
            'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
        ));
        $address->setLabel("Địa chỉ <strong class=\"text-danger\">*</strong>");
        $this->add($address);

        //mobile
        $mobile = new Text('mobile', array(
            'class'         => 'form-control',
            'placeholder'   => 'Số điện thoại',
            'size'     => 255,
        ));
        $mobile->setLabel("Điện thoại <strong class=\"text-danger\">*</strong>");
        $this->add($mobile);

        //password
        $password = new Password('password', array(
            'class'         => 'form-control',
            'placeholder'   => 'Mật khẩu',
            'required'      => true,
            'size'     => 255,
            'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
        ));
        $password->setLabel("Mật khẩu <strong class=\"text-danger\">*</strong>");
        $this->add($password);

        //status
        $status = new Select('status',
            array(
                ''          => 'Trạng thái',
                1           => "Active",
                0           => "Disabled"
            ),
            array(
                'class'     => 'form-control',
                'useEmpty'  => false,
                'emptyText' => 'Chọn...',
                'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.',
                'required'  => true));

        $status->addValidators([
            new PresenceOf([
                'message' => 'The status is required'
            ]),
        ]);

        $status->setLabel("Trạng thái <strong class=\"text-danger\">*</strong>");
        $this->add($status);

        //group_id
        $group_id = new Select('group_id', GroupUser::find(['id != 1']),array(
            'using'     => array('id', 'name'),
            'useEmpty'      => true,
            'class'         => 'form-control',
            'emptyText'     => 'Chọn...',
            'emptyValue'    => '',
            'required'      => true,
            'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
        ));

        $group_id->setLabel("Phân quyền <strong class=\"text-danger\">*</strong>");
        $this->add($group_id);

    }
}
