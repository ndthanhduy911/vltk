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

class EditLanguageForm extends BaseForm
{
    public function initialize($entity = null, $options = null)
    {
        $lang_id = new Hidden('lang_id',
        array(
            'required'      => true,
        ));
        $this->add($lang_id);

        $lang_cl = new Hidden('lang_cl',
        array(
            'required'      => true,
        ));
        $this->add($lang_cl);

        //lang_vi
        $lang_vi = new TextArea('lang_vi',
            array(
                'class'         => 'form-control',
                'placeholder'   => 'Nhập nội dung Tiếng Việt',
                'required'      => true,
                "rows"          => 3,
                'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
            ));
        $lang_vi->setLabel("Tiếng Việt");
        $this->add($lang_vi);

        //lang_en
        $lang_en = new TextArea('lang_en',
        array(
            'class'         => 'form-control',
            'placeholder'   => 'Nhập nội dung Tiếng Anh',
            'required'      => true,
            "rows"          => 3,
            'data-required-error'    => 'Vui lòng nhập đầy đủ thông tin.'
        ));
        $lang_en->setLabel("Tiếng Anh");
        $this->add($lang_en);

    }
}
