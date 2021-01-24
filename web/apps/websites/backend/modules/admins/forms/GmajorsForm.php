<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;

class GmajorsForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {
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
        $status->setLabel('<i class="fas fa-check-circle mr-1"></i>Trạng thái');
        $this->add($status);

        //slug
        $slug = new Text('slug');
        $slug->setLabel('<i class="fas fa-globe mr-1"></i>Slug');
        $slug->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "200",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($slug);

        //attrid
        $attrid = new Select('attrid', \Attributes::find(['status = 1']), array(
            'using' => ['id', 'name'],
            'useEmpty' => true,
            'emptyText' => 'Mặc định',
            'emptyValue' => '0',
            'class' => 'form-control form-control-sm',
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $attrid->setLabel('<i class="fas fa-columns mr-1"></i>Giao diện');
        $this->add($attrid);

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
