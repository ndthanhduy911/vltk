<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;

class OptionsLangForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $lang = null)
    {
        $title = new Text('title');
        $title->setLabel('<i class="fas fa-book mr-1"></i> Tên Khoa/ bộ môn');
        $attr = [
            'class' => "form-control form-control-sm",
            'placeholder' => 'Tên Khoa/ bộ môn',
            'required' => '',
            'maxlength' => "150",
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin không hợp lệ"
        ];
        $attr = cFL($attr,$lang,'title');
        $title->setAttributes($attr);
        $this->add($title);

        $address = new Text('address');
        $address->setLabel('<i class="fas fa-building mr-1"></i>Địa chỉ');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Địa chỉ',
            'maxlength' => "255",
            'data-error' => "Thông tin không hợp lệ"
        ];
        $attr = cFL($attr,$lang,'address');
        $address->setAttributes($attr);
        $this->add($address);


        $excerpt = new Textarea('excerpt');
        $excerpt->setLabel('<i class="fas fa-tags mr-1"></i> Mô tả');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Mô tả',
            'maxlength' => "255",
            'data-error' => "Thông tin không hợp lệ",
            'rows' => 4
        ];
        $attr = cFL($attr,$lang,'excerpt');
        $excerpt->setAttributes($attr);
        $this->add($excerpt);
    }
}
