<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Numeric;

class PartnersForm extends Form
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

        //link
        $link = new Text('link');
        $link->setLabel('<i class="fas fa-globe mr-1"></i>Links');
        $link->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: https://phys.hcmus.edu.vn',
            'maxlength' => "200",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($link);

        //sort
        $sort = new Numeric('sort');
        $sort->setLabel('<i class="fas fa-sort mr-1"></i>Sắp xếp');
        $sort->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Sắp xếp',
            'maxlength' => "999",
        ));
        $this->add($sort);
        
        //image
        $image = new Hidden('image');
        $image->setLabel('<i class="fas fa-image mr-1"></i>Ảnh đại diện');
        $image->setUserOption('attr','image');
        $this->add($image);
    }
}
