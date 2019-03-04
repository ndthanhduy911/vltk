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

class SettingForm extends BaseForm{
    public function initialize($entity = null, $options = null){
        //login title
        $login_title = new TextArea('login_title',[
            'class'         => 'form-control',
            'placeholder'   => 'Tiêu đề đăng nhập',
            'maxlength'     => 255,
            'size'          => 255,
            'rows'          => 4
        ]);
        $login_title->setLabel("Tiêu đề đăng nhập:");
        $this->add($login_title);

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

        $status->addValidators([
            new PresenceOf([
                'message'   => 'The status is required'
            ]),
        ]);

        $status->setLabel("Tình trạng <strong class=\"text-danger\">*</strong>");
        $this->add($status);
    }
}
