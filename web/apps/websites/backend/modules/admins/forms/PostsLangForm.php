<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;

class PostsLangForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {
        $title = new Text('title');
        $title->setLabel('Tiêu đề');
        $title->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'maxlength' => "255",
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Tiêu đề không đúng quy định.",
        ));
        $this->add($title);

        $excerpt = new Textarea('excerpt');
        $excerpt->setLabel('Tóm tắt');
        $excerpt->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Tóm tắt',
            'maxlength' => "255",
            'data-error' => "Tóm tắt không đúng quy định.",
            'rows' => 4
        ));
        $this->add($excerpt);
    }
}
