<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;

class OptionsLangForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $lang = null)
    {
        $name = new Text('name');
        $name->setLabel('Tiêu đề');
        $attr = [
            'class' => "form-control form-control-sm",
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'maxlength' => "255",
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin không hợp lệ"
        ];
        $attr = cFL($attr,$lang,'name');
        $name->setAttributes($attr);
        $this->add($name);

        $address = new Textarea('address');
        $address->setLabel('Địa chỉ');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Địa chỉ',
            'maxlength' => "255",
            'data-error' => "Thông tin không hợp lệ",
            'rows' => 4
        ];
        $attr = cFL($attr,$lang,'address');
        $address->setAttributes($attr);
        $this->add($address);
    }
}
