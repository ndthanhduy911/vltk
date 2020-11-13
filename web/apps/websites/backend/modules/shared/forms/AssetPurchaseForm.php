<?php
namespace Backend\Modules\Shared\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;

class AssetPurchaseForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $name = new Text('name');
        $name->setLabel('Tên hình thức mua sắm'.requiredLabel());
        $name->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "50",
            'data-error' => "Tên hình thức mua sắm chưa hợp lệ",
            'required' => '',
            'placeholder' => 'Ví dụ: Đấu thầu',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-maxlength-error' => "Tên hình thức mua sắm không được quá 50 ký tự"
        ));
        $this->add($name);

        $note = new Text('note');
        $note->setLabel('Ghi chú');
        $note->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "150",
            'data-error' => "Thông tin chưa hợp lệ",
            'data-maxlength-error' => "Thông tin không quá 150 ký tự",
            'placeholder' => 'Ví dụ: Đấu thầu thực hiện dự án',
        ));
        $this->add($note);
    }
}
