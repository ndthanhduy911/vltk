<?php
namespace Backend\Modules\Shared\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Form;

class DeptsForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $name = new Text('name');
        $name->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "100",
            'size' => "100",
            'required' => '',
            'placeholder' => 'Ví dụ: Bộ phận Kỹ thuật',
            'data-error' => "Thông tin không hợp lệ",
            'data-required-error' => "Vui lòng nhập thông tin"
        ));
        $name->setLabel('Tên bộ môn '.requiredLabel());
        $this->add($name);

        $status = new Select('status', [
            1 => "Hoạt động",
            0 => "Khóa",
        ], [
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
            'data-error' => "Thông tin không hợp lệ",
        ]);
        $status->setLabel('Trạng thái '.requiredLabel());
        $this->add($status);

        $dcode = new Text('dcode');
        $dcode->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "4",
            'size' => "4",
            'placeholder' => 'Ví dụ: VLKT',
            'data-error' => "Thông tin không hợp lệ",
        ));
        $dcode->setLabel('Mã bộ môn');
        $this->add($dcode);

        $slug = new Text('slug');
        $slug->setLabel('Slug');
        $slug->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: bai-viet-moi-nhat',
            'maxlength' => "200",
            'size' => '200',
            'data-error' => "Thông tin không hợp lệ",
        ));
        $this->add($slug);

        $links = new Text('links');
        $links->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: https://phys.hcmus.edu.vn',
            'maxlength' => "200",
            'size' => '200',
            'data-error' => "Thông tin không hợp lệ",
        ));
        $links->setLabel('Link');
        $this->add($links);

        $phone = new Text('phone');
        $phone->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Ví dụ: 01234567890',
            'maxlength' => "30",
            'size' => '30',
            'data-error' => "Thông tin không hợp lệ",
        ));
        $phone->setLabel('Số điện thoại');
        $this->add($phone);

        $email = new Email('email');
        $email->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => "E-mail",
            'size' => '100',
            'maxlength' => "100",
            'data-error' => "Thông tin không hợp lệ",
        ));
        $email->setLabel('E-mail');
        $this->add($email);

        $address = new Text('address');
        $address->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Phòng A Tòa Nhà B',
            'size' => 150,
            'data-error' => "Thông tin không hợp lệ",
        ));
        $address->setLabel('Địa chỉ');
        $this->add($address);

        $description = new Text('description');
        $description->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Vật Lý Tin Học',
            'size' => 150,
            'data-error' => "Thông tin không hợp lệ",
        ));
        $description->setLabel('Mô tả');
        $this->add($description);

        $deptType = \Depts::getTreeName(0);
        $parentid = new Select('parentid', $deptType, array(
            'class' => 'form-control form-control-sm',
            'data-error' => "Thông tin không hợp lệ",
            'useEmpty'      => true,
            'emptyValue'    => '0',
            'emptyText'     => 'Không có',
        ));
        $parentid->setLabel('Trực thuộc');
        $this->add($parentid);
    }
}
