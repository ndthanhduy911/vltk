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
use Models\Package;

class EditFaqForm extends BaseForm
{
    public function initialize($entity = null, $options = null)
    {
        //package name
        $ask = new TextArea(
            'ask',
            array(
                'class' => 'form-control',
                'placeholder'   => 'Câu hỏi',
                'required'      => true,
                'row'           => 4,
                'data-error'    => 'Vui lòng nhập câu hỏi.'
            ));

        $ask->setLabel("Câu hỏi <strong class=\"text-danger\">*</strong>");
        $this->add($ask);

        //answer name
        $answer = new TextArea(
            'answer',
            array(
                'class' => 'form-control',
                'placeholder'   => 'Trả lời',
                'row'           => 30,
                'data-error'    => 'Vui lòng nhập câu trả lời.'
            ));

        $answer->setLabel("Trả lời <strong class=\"text-danger\">*</strong>");
        $this->add($answer);

        $package_id = new Select('package_id', Package::find(), array(
            'using'         => array('id', 'name'),
            'class'         => 'form-control',
            'useEmpty'      => true,
            'emptyText'     => 'Chọn...',
            'required'      => true,
            'emptyValue'    => '',
        ));
        $package_id->setLabel("Dịch vụ <strong class=\"text-danger\">*</strong>");
        $this->add($package_id);


        //status
        $location = new Select('location',
        array(
            1 => "Quản trị",
            2 => "Người dùng",
            3 => "Tất cả"
            
        ),
        array(
            'useEmpty'      => true,
            'class'         => 'form-control',
            'emptyText'     => 'Chọn...',
            'emptyValue'    => '',
            'required'      => true
        ));

        $location->setLabel("Hiển thị <strong class=\"text-danger\">*</strong>");
        $this->add($location);

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
