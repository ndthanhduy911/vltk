<?php
namespace Backend\Modules\Shared\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;

class AssetMadeInForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $name = new Text('name');
        $name->setLabel('Tên nước sản xuất '.requiredLabel());
        $name->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "100",
            'data-error' => "Thông tin chưa hợp lệ",
            'required' => '',
            'placeholder' => 'Ví dụ: Việt Nam',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-maxlength-error' => "Thông tin không được quá 100 ký tự",
        ));
        $this->add($name);

        $note = new Text('note');
        $note->setLabel('Ghi chú');
        $note->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "150",
            'data-error' => "Thông tin chưa hợp lệ",
            'placeholder' => 'Ví dụ: Thuộc khu vực ĐNA',
            'data-maxlength-error' => "Thông tin không được quá 150 ký tự",

        ));
        $this->add($note);
    }
}
