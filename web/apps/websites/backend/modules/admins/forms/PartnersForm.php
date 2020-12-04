<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;

class PartnersForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        //link
        $link = new Text('link');
        $link->setLabel('Links');
        $link->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: https://phys.hcmus.edu.vn',
            'maxlength' => "200",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($link);

        //sort
        $sort = new Numeric('sort');
        $sort->setLabel('Sắp xếp');
        $sort->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Sắp xếp',
            'maxlength' => "999",
        ));
        $this->add($sort);

        //status
        $status = new Select('status', [
            1 => "Hoạt động",
            0 => "Khóa",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Chọn trạng thái',
            'emptyValue' => '',
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
    }
}
