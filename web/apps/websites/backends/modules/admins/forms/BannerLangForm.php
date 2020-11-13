<?php
namespace Backend\Modules\Admins\Forms;


use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\PresenceOf;

class BannerLangForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $name = new Text('name');
        $name->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề.",
            'maxlength' => "255",
            'data-error' => "Tiêu đề không đúng quy định.",
        ));
        $name->addValidators(array(
            new PresenceOf(array(
                'message' => 'Tiêu đề không được bỏ trống.',
            )),
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Tiêu đề không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($name);

        $button_text = new Text('button_text');
        $button_text->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Text button',
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề.",
            'maxlength' => "15",
            'data-error' => "Text button không đúng quy định.",
        ));
        $button_text->addValidators(array(
            new PresenceOf(array(
                'message' => 'Text button không được bỏ trống.',
            )),
            new StringLength([
                "max" => 15,
                "messageMaximum" => "Text button không được dài quá 15 ký tự",
            ]),
        ));
        $this->add($button_text);

        $description = new Textarea('description');
        $description->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Giới thiệu',
            'data-error' => "Giới thiệu",
            'rows' => 4
        ));
        $this->add($description);

        $content = new Hidden('content');
        $this->add($content);

        $banner_id = new Hidden('banner_id');
        $this->add($banner_id);

        $lang_id = new Hidden('lang_id');
        $this->add($lang_id);
    }
}
