<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
class StaffsForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $slug = new Text('slug');
        $slug->setLabel('Slug');
        $slug->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "200",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($slug);

        $email = new Text('email');
        $email->setLabel('E-mail');
        $email->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: cvtao@hcmus.edu.vn',
            'maxlength' => "100",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($email);

        $dean = new Select('dean', [
            1 => "Trưởng khoa",
            2 => "Phó trưởng khoa",
        ], [
            'class' => 'form-control form-control-sm',
            'useEmpty' => true,
            'emptyText' => 'Không có',
            'emptyValue' => '',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $dean->setLabel('Chức vụ Khoa');
        $this->add($dean);

        $dept_position = new Select('dept_position', [
            1 => "Trưởng bộ môn",
            2 => "Phó bộ môn",
            3 => "Giáo vụ bộ môn",
            4 => "Giảng viên cơ hữu",
            5 => "Cán bộ thỉnh giảng",
            6 => "Nhân viên",
        ], [
            'class' => 'form-control',
            'useEmpty' => true,
            'emptyText' => 'Chọn chức vụ',
            'emptyValue' => '',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $dept_position->setLabel('Chức vụ Bộ môn');
        $this->add($dept_position);

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

        $sort = new Numeric('sort');
        $sort->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Sắp xếp',
            'maxlength' => "999",
        ));
        $this->add($sort);

        //image
        $image = new Hidden('image');
        $this->add($image);

        //bgimage
        $bgimage = new Hidden('bgimage');
        $this->add($bgimage);
    }
}
