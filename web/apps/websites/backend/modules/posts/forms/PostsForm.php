<?php
namespace Backend\Modules\Posts\Forms;


use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Regex as RegexValidator;

class PostsForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $title = new Text('title');
        $title->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề.",
            'maxlength' => "255",
            'data-error' => "Tiêu đề không đúng quy định.",
        ));
        $title->addValidators(array(
            new PresenceOf(array(
                'message' => 'Tiêu đề không được bỏ trống.',
            )),
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Tiêu đề không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($title);

        $except = new Textarea('except');
        $except->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tóm tắt',
            'maxlength' => "255",
            'data-error' => "Tóm tắt không đúng quy định.",
            'rows' => 4
        ));
        $except->addValidators(array(
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Tóm tắt không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($except);
    }
}
