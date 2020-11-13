<?php
namespace Backend\Modules\Shared\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;

class AssetOriginForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $name = new Text('name');
        $name->setLabel('Tên nguồn gốc hình thành '.requiredLabel());
        $name->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "100",
            'data-error' => "Thông tin chưa hợp lệ",
            'required' => '',
            'placeholder' => 'Ví dụ: Mua sắm',
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
            'placeholder' => 'Ví dụ: Mua sắm online',
            'data-maxlength-error' => "Thông tin không được quá 150 ký tự",

        ));
        $this->add($note);
    }
}
