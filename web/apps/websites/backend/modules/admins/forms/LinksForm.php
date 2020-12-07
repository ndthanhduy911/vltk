<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
class LinksForm extends Form
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

        //icon
        $icon = new Text('icon');
        $icon->setLabel('<i class="fas fa-adjust mr-1"></i>Biểu tượng');
        $icon->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: fa fa-book',
            'maxlength' => "30",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($icon);

        //link
        $link = new Text('link');
        $link->setLabel('<i class="fas fa-globe mr-1"></i>Link');
        $link->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: https://phys.hcmus.edu.vn/',
            'maxlength' => "200",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($link);

        //sort
        $sort = new Text('sort');
        $sort->setLabel('<i class="fas fa-sort mr-1"></i>Sắp xếp');
        $sort->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: 0',
            'maxlength' => "10",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($sort);
    }
}
