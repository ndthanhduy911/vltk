<?php
namespace Backend\Modules\Shared\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;

class AssetUnitForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $name = new Text('name');
        $name->setLabel('Tên đơn vị tính'.requiredLabel());
        $name->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "100",
            'data-error' => "Tên đơn vị tính chưa hợp lệ",
            'required' => '',
            'placeholder' => 'Ví dụ: máy',
            'data-required-error' => "Vui lòng nhập thông tin",
        ));
        $this->add($name);

        $note = new Text('note');
        $note->setLabel('Ghi chú');
        $note->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "150",
            'data-error' => "Thông tin chưa hợp lệ",
            'placeholder' => 'Ví dụ: Đơn vị tính dùng cho máy móc, thiết bị',
            'data-maxlength-error' => "Thông tin không được phép quá 150 ký tự",

        ));
        $this->add($note);
    }
}
