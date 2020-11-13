<?php
namespace Backend\Modules\Shared\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;

class SupplierForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $name = new Text('name');
        $name->setLabel('Tên nhà cung cấp '.requiredLabel());
        $name->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "100",
            'size' => "100",
            'data-error' => "Thông tin chưa hợp lệ",
            'required' => '',
            'placeholder' => 'Ví dụ: Công Ty HONEYNET',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-maxlength-error' => "Thông tin không được quá 100 ký tự",
        ));
        $this->add($name);

        $slcode = new Text('slcode');
        $slcode->setLabel('Mã nhà cung cấp '.requiredLabel());
        $slcode->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "9",
            'size' => "9",
            'data-error' => "Thông tin chưa hợp lệ",
            'required' => '',
            'placeholder' => 'Ví dụ: NCK00001',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-maxlength-error' => "Thông tin không được quá 100 ký tự",
        ));
        $this->add($slcode);

        $tin = new Text('tin');
        $tin->setLabel('Mã số thuế');
        $tin->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "20",
            'size' => "20",
            'data-error' => "Thông tin chưa hợp lệ",
            'placeholder' => 'Ví dụ: 0312876547',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-maxlength-error' => "Thông tin không được quá 100 ký tự",
        ));
        $this->add($tin);

        $address = new Text('address');
        $address->setLabel('Địa chỉ '.requiredLabel());
        $address->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "150",
            'size' => "150",
            'required' => '',
            'data-error' => "Thông tin chưa hợp lệ",
            'placeholder' => 'Ví dụ: 10-12 Đinh Tiên Hoàng',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-maxlength-error' => "Thông tin không được quá 150 ký tự",

        ));
        $this->add($address);

        $description = new Text('description');
        $description->setLabel('Mô tả');
        $description->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "150",
            'size' => "150",
            'data-error' => "Thông tin chưa hợp lệ",
            'placeholder' => 'Ví dụ: Đơn vị cung cấp thiết bị, máy móc',
            'data-maxlength-error' => "Thông tin không được quá 150 ký tự",

        ));
        $this->add($description);

        $phone = new Text('phone');
        $phone->setLabel('Số điện thoại');
        $phone->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "20",
            'size' => "20",
            'data-error' => "Thông tin chưa hợp lệ",
            'placeholder' => 'Ví dụ: 0351234556',
            'data-maxlength-error' => "Thông tin không được quá 20 ký tự",

        ));
        $this->add($phone);

        $email = new Text('email');
        $email->setLabel('E-mail');
        $email->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "50",
            'size' => "50",
            'data-error' => "Thông tin chưa hợp lệ",
            'placeholder' => 'Ví dụ: info@honeynet.vn',
            'data-maxlength-error' => "Thông tin không được quá 50 ký tự",

        ));
        $this->add($email);
    }
}
