<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;

class SlideshowsForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {
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
        $status->setLabel('<i class="fas fa-check-circle mr-1"></i>Trạng thái');
        $this->add($status);

        //buttonlink
        $buttonlink = new Text('buttonlink');
        $buttonlink->setLabel('<i class="fas fa-globe mr-1"></i>Liên kết');
        $buttonlink->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: https://phys.hcmus.edu.vn',
            'maxlength' => "200",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($buttonlink);

        //image
        $image = new Hidden('image');
        $image->setLabel('<i class="fas fa-image mr-1"></i>Ảnh đại diện');
        $image->setUserOption('attr','image');
        $this->add($image);

        //bgimage
        $bgimage = new Hidden('bgimage');
        $bgimage->setLabel('<i class="fas fa-image mr-1"></i>Ảnh nền');
        $bgimage->setUserOption('attr','image');
        $this->add($bgimage);
    }
}
