<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;

class OptionsForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {
        //dcode
        $dcode = new Text('dcode');
        $dcode->setLabel('Tên viết tắt');
        $dcode->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: VLKT',
            'maxlength' => "20",
            'size' => "20",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($dcode);

        //phone
        $phone = new Text('phone');
        $phone->setLabel('Số điện thoại');
        $phone->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: VLKT',
            'maxlength' => "20",
            'size' => "20",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($phone);

        //email
        $email = new Text('email');
        $email->setLabel('E-mail');
        $email->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: VLKT',
            'maxlength' => "20",
            'size' => "20",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($email);

        //link
        $link = new Text('link');
        $link->setLabel('E-mail');
        $link->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Link (Nếu bộ môn có website riêng)',
            'maxlength' => "200",
            'size' => "200",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($link);

        //status
        $status = new Select('status', [
            1 => "Hoạt động",
            0 => "Khóa",
        ], [
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => 'Vui lòng nhập thông tin',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $status->setLabel('Trạng thái');
        $this->add($status);

        //image
        $image = new Hidden('image');
        $this->add($image);

        //icon
        $icon = new Hidden('icon');
        $this->add($icon);

        //logo
        $logo = new Hidden('logo');
        $this->add($logo);
    }
}
