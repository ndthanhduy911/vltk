<?php
namespace Backend\Modules\Shared\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;

class LocationForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $name = new Text('name');
        $name->setLabel('Tên địa điểm '.requiredLabel());
        $name->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "100",
            'data-error' => "Tên địa điểm chưa hợp lệ",
            'required' => '',
            'placeholder' => 'Ví dụ: Công ty HONEYNET',
            'data-required-error' => "Vui lòng nhập thông tin",
        ));
        $this->add($name);

        $address = new Text('address');
        $address->setLabel('Địa chỉ '.requiredLabel());
        $address->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "150",
            'required' => '',
            'placeholder' => 'Ví dụ: 685 Hưng Phú, Phường 9, Quận 8, Thành phố Hồ Chí Minh',
            'data-error' => "Thông tin không hợp lệ",
            'data-required-error' => "Vui lòng nhập thông tin",
        ));
        $this->add($address);

        $note = new Text('note');
        $note->setLabel('Ghi chú');
        $note->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "150",
            'data-error' => "Thông tin chưa hợp lệ",
            'placeholder' => 'Ví dụ: Địa điểm cung cấp máy móc thiết bị',
            'data-maxlength-error' => "Thông tin không được phép quá 150 ký tự",

        ));
        $this->add($note);
    }
}
