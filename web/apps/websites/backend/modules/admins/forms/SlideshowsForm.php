<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;

class SlideshowsForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {
        //buttonlink
        $buttonlink = new Text('buttonlink');
        $buttonlink->setLabel('Liên kết');
        $buttonlink->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: https://phys.hcmus.edu.vn',
            'maxlength' => "200",
            'data-error' => "Thông tin chưa hợp lệ",
        ));
        $this->add($buttonlink);

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
