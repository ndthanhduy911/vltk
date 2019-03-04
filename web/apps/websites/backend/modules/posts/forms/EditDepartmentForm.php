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
use Phalcon\Forms\Element\Email;
use Phalcon\Validation\Validator\Digit as DigitValidator;
use Phalcon\Forms\Element\File;
use Phalcon\Validation\Validator\Email as VaEmail;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Confirmation;
use Phalcon\Validation\Validator\Between;
use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Base\Forms\BaseForm;
use Library\Common as LibraryCommon;
use Models\Unit;

class EditDepartmentForm extends BaseForm
{
    public function initialize($entity = null, $options = null)
    {
        //department name
        $name = new Text(
            'name',
            array(
                'class' => 'form-control',
                'placeholder'   => 'Tên đơn vị',
                'required'      => true,
                'maxlength'     => 255,
                'size'          => 255,
                'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
            ));

        $name->setLabel("Tên đơn vị <strong class=\"text-danger\">*</strong>");
        $this->add($name);

        //department name
        $phone = new Text(
            'phone',
            array(
                'class' => 'form-control',
                'placeholder'   => 'Điện thoại',
                'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
            ));

        $phone->setLabel("Điện thoại <strong class=\"text-danger\">*</strong>");
        $this->add($phone);


        //department name
        $email = new Email(
            'email',
            array(
                'class' => 'form-control',
                'placeholder'   => 'Email',
                'maxlength'     => 255,
                'size'          => 255,
                'data-error'    => 'Chưa đúng định dạng email.',
                // 'pattern'       =>'^[a-z][a-z0-9_-\.]{1,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,3}){1,2}$'
            ));

        $email->setLabel("Email <strong class=\"text-danger\">*</strong>");
        $this->add($email);

        //Description
        $description = new Textarea('description', array(
            'class'         => 'form-control',
            'placeholder'   => 'Giới thiệu',
            'maxlength'     => 255,
            'cols'          => 255,
        ));

        $description->setLabel("Giới thiệu <strong class=\"text-danger\">*</strong>");
        $this->add($description);

        //status
        $status = new Select('status',
        array(
            1 => "Active",
            0 => "Disabled"
        ),
        array(
            'useEmpty'      => true,
            'class'         => 'form-control',
            'emptyText'     => 'Chọn...',
            'emptyValue'    => '',
            'required'      => true,
            'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
        ));

        $status->addValidators([
            new PresenceOf([
                'message' => 'The status is required'
            ]),
        ]);

        $status->setLabel("Trạng thái <strong class=\"text-danger\">*</strong>");
        $this->add($status);
    }
}
