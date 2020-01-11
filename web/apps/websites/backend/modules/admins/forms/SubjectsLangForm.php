<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\PresenceOf;

class SubjectsLangForm extends Form
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

        $excerpt = new Textarea('excerpt');
        $excerpt->setAttributes(array(
            'class' => 'form-control',
            'data-error' => "Tóm tắt không đúng quy định.",
            'rows' => 4
        ));
        $this->add($excerpt);

        $content = new Hidden('content');
        $this->add($content);

        $post_id = new Hidden('post_id');
        $this->add($post_id);

        $lang_id = new Hidden('lang_id');
        $this->add($lang_id);
    }
}
