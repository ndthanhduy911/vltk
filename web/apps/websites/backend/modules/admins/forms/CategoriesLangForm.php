<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;

class CategoriesLangForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $lang = null)
    {
        $name = new Text('name');
        $name->setLabel('<i class="fas fa-book mr-1"></i>Tiêu đề');
        $attr = [
            'class' => "form-control form-control-sm",
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'maxlength' => "255",
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin chưa hợp lệ",
        ];
        $attr = cFL($attr,$lang,'name');
        $name->setAttributes($attr);
        $this->add($name);

        $description = new Textarea('description');
        $description->setLabel('<i class="fas fa-tags mr-1"></i>Tóm tắt');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Tóm tắt',
            'maxlength' => "255",
            'data-error' => "Thông tin chưa hợp lệ",
            'rows' => 4
        ];
        $attr = cFL($attr,$lang,'description');
        $description->setAttributes($attr);
        $this->add($description);
    }
}
