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
        $dcode->setLabel('<i class="fas fa-book mr-1"></i>Tên viết tắt');
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
        $phone->setLabel('<i class="fas fa-phone mr-1"></i>Số điện thoại');
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
        $email->setLabel('<i class="fas fa-envelope mr-1"></i>E-mail');
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
        $link->setLabel('<i class="fas fa-globe mr-1"></i>Links');
        $link->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Link (Nếu bộ môn có website riêng)',
            'maxlength' => "200",
            'size' => "200",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($link);

        //image
        $image = new Hidden('image');
        $image->setLabel('<i class="fas fa-image mr-1"></i>Ảnh đại diện');
        $image->setUserOption('attr','image');
        $this->add($image);

        //icon
        $icon = new Hidden('icon');
        $icon->setLabel('<i class="fas fa-image mr-1"></i>Ảnh favicon');
        $icon->setUserOption('attr','image');
        $this->add($icon);

        //logo
        $logo = new Hidden('logo');
        $logo->setLabel('<i class="fas fa-image mr-1"></i>Ảnh logo');
        $logo->setUserOption('attr','image');
        $this->add($logo);
    }
}
