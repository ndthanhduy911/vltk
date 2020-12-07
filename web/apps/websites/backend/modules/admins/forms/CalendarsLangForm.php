<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\PresenceOf;

class CalendarsLangForm extends Form
{
    public function initialize($entity = null, $options = null)
    {

        $excerpt = new Textarea('excerpt');
        $excerpt->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Mô tả/ Chú thích',
            'maxlength' => "255",
            'data-error' => "Mô tả/ Chú thích không đúng quy định.",
            'rows' => 4
        ));

        $excerpt->addValidators(array(
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Mô tả/chú thích không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($excerpt);

        $calendarid = new Hidden('calendarid');
        $this->add($calendarid);

        $langid = new Hidden('langid');
        $this->add($langid);
    }
}
