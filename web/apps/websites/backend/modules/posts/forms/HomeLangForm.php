<?php
namespace Backend\Modules\Posts\Forms;


use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Date as DateValidator;

class HomeLangForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $specialized_title = new Text('specialized_title');
        $specialized_title->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề.",
            'maxlength' => "255",
            'data-error' => "Tiêu đề không đúng quy định.",
        ));
        $specialized_title->addValidators(array(
            new PresenceOf(array(
                'message' => 'Tiêu đề không được bỏ trống.',
            )),
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Tiêu đề không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($specialized_title);

        $staff_title = new Text('staff_title');
        $staff_title->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề.",
            'maxlength' => "255",
            'data-error' => "Tiêu đề không đúng quy định.",
        ));
        $staff_title->addValidators(array(
            new PresenceOf(array(
                'message' => 'Tiêu đề không được bỏ trống.',
            )),
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Tiêu đề không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($staff_title);

        $staff_des = new Textarea('staff_des');
        $staff_des->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Giới thiệu',
            'maxlength' => "255",
            'data-error' => "Giới thiệu",
            'rows' => 4
        ));
        $this->add($staff_des);

        $partner_title = new Text('partner_title');
        $partner_title->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề.",
            'maxlength' => "255",
            'data-error' => "Tiêu đề không đúng quy định.",
        ));
        $partner_title->addValidators(array(
            new PresenceOf(array(
                'message' => 'Tiêu đề không được bỏ trống.',
            )),
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Tiêu đề không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($partner_title);

        $partner_des = new Textarea('partner_des');
        $partner_des->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Giới thiệu',
            'maxlength' => "255",
            'data-error' => "Giới thiệu",
            'rows' => 4
        ));
        $this->add($partner_des);

        $contact_title = new Text('contact_title');
        $contact_title->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề.",
            'maxlength' => "255",
            'data-error' => "Tiêu đề không đúng quy định.",
        ));
        $contact_title->addValidators(array(
            new PresenceOf(array(
                'message' => 'Tiêu đề không được bỏ trống.',
            )),
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Tiêu đề không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($contact_title);

        $contact_des = new Textarea('contact_des');
        $contact_des->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Giới thiệu',
            'maxlength' => "255",
            'data-error' => "Giới thiệu",
            'rows' => 4
        ));
        $this->add($contact_des);

        $home_id = new Hidden('home_id');
        $this->add($home_id);

        $lang_id = new Hidden('lang_id');
        $this->add($lang_id);
    }
}
