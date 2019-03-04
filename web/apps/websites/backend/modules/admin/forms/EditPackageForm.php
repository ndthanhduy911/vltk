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
use Models\Unit;

class EditPackageForm extends BaseForm
{
    public function initialize($entity = null, $options = null)
    {
        //package name
        $clientName = new Text(
            'name',
            array(
                'class' => 'form-control',
                'placeholder'   => 'Tên dịch vụ',
                'required'      => true,
                'maxlength'     => 255,
                'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
            ));

        $clientName->setLabel("Tên dịch vụ <strong class=\"text-danger\">*</strong>");
        $this->add($clientName);

        //note
        $note = new TextArea('note',
            array(
                'class'         => 'form-control',
                'placeholder'   => 'Giới thiệu',
                'required'      => true,
                "rows"          => 5,
                'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
            ));
        $note->setLabel("Giới thiệu <strong class=\"text-danger\">*</strong>");
        $this->add($note);

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
                'message' => 'Tình trạng không được để trống'
            ]),
        ]);

        $status->setLabel("Tình trạng <strong class=\"text-danger\">*</strong>");
        $this->add($status);
    }
}
