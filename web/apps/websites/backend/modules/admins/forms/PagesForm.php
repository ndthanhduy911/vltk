<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;

class PagesForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {
        //slug
        $slug = new Text('slug');
        $slug->setLabel('Slug');
        $slug->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "200",
            'data-error' => "Thông tin chưa hợp lệ",
        ));
        $this->add($slug);

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

        //attrid
        $attrid = new Select('attrid', \Attributes::find(['status = 1']), array(
            'using' => ['id', 'name'],
            'useEmpty' => true,
            'emptyText' => 'Mặc định',
            'emptyValue' => '0',
            'class' => 'form-control form-control-sm',
            'data-error' => "Thông tin chưa hợp lệ",
        ));
        $attrid->setLabel('Giao diện');
        $this->add($attrid);

        //image
        $image = new Hidden('image');
        $this->add($image);

        //bgimage
        $bgimage = new Hidden('bgimage');
        $this->add($bgimage);
    }
}
