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
use Phalcon\Validation\Validator\Digit as DigitValidator;
use Phalcon\Forms\Element\File;
use Phalcon\Validation\Validator\Email;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Confirmation;
use Phalcon\Validation\Validator\Between;
use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Base\Forms\BaseForm;
use Library\Common as LibraryCommon;

class EditPermissionForm extends BaseForm
{
    public function initialize($entity = null, $options = null)
    {
        //permission name
        $name = new Text(
            'name',
            array(
                'class' => 'form-control',
                'placeholder'   => 'Tên quyền',
                'required'      => true,
                'maxlength'     => 255,
                'data-error'    => 'Vui lòng nhập tên quyền.'
            ));
        $name->setLabel("Tên quyền <strong class=\"text-danger\">*</strong>");
        $this->add($name);

        //description
        $description = new TextArea('description',
            array(
                'class'         => 'form-control',
                'placeholder'   => 'Giới thiệu',
                'required'      => true,
                "rows"          => 5,
                'data-error'    => 'Vui lòng nhập giới thiệu về quyền'
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
            'required'      => true
        ));

        $status->addValidators([
            new PresenceOf([
                'message' => 'Tình trạng không được để trống'
            ]),
        ]);

        $status->setLabel("Tình trạng <strong class=\"text-danger\">*</strong>");
        $this->add($status);
    }
}
