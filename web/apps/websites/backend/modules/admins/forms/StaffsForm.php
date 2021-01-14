<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Form;
class StaffsForm extends Form
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

        //deptid
        $sdeptid = isset($_SESSION['deptid']) ? $_SESSION['deptid'] : 0;
        $depts = \Depts::getTreeName(0);
        $deptid = new Select('deptid', $depts, [
            'class' => 'form-control form-control-sm',
            'useEmpty' => true,
            'emptyText' => 'Không có',
            'emptyValue' => '',
            'required' => '',
            'data-required-error' => 'Vui lòng nhập thông tin',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $deptid->setLabel('<i class="fas fa-building mr-1"></i>Khoa/ bộ môn');
        if($sdeptid != 1){
            $deptid->setUserOption('attr','disabled');
        }
        $this->add($deptid);

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
        $dean->setLabel('<i class="fas fa-school mr-1"></i>Chức vụ Khoa');
        if($sdeptid != 1){
            $dean->setUserOption('attr','disabled');
        }
        $this->add($dean);

        $deptposition = new Select('deptposition', [
            1 => "Trưởng bộ môn",
            2 => "Phó bộ môn",
            3 => "Giáo vụ bộ môn",
            4 => "Giảng viên cơ hữu",
            5 => "Cán bộ thỉnh giảng",
            6 => "Nhân viên",
        ], [
            'class' => 'form-control form-control-sm',
            'useEmpty' => true,
            'emptyText' => 'Chọn chức vụ',
            'emptyValue' => '',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $deptposition->setLabel('<i class="fas fa-graduation-cap mr-1"></i>Chức vụ Bộ môn');
        $this->add($deptposition);

        $email = new Text('email');
        $email->setLabel('<i class="fas fa-envelope mr-1"></i>E-mail');
        $email->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: cvtao@hcmus.edu.vn',
            'maxlength' => "100",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($email);

        $slug = new Text('slug');
        $slug->setLabel('<i class="fas fa-globe mr-1"></i>Slug');
        $slug->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "200",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($slug);

        if($_SESSION['deptid'] == 1){
            $sort = new Numeric('sort');
            $sort->setAttributes(array(
                'class' => 'form-control form-control-sm',
                'placeholder' => 'Sắp xếp',
                'maxlength' => "999",
                'data-error' => "Thông tin chưa hợp lệ"
            ));
            $sort->setLabel('<i class="fas fa-sort mr-1"></i>Sắp xếp');
            $this->add($sort);
        }else{
            $dsort = new Numeric('dsort');
            $dsort->setAttributes(array(
                'class' => 'form-control form-control-sm',
                'placeholder' => 'Sắp xếp',
                'maxlength' => "999",
                'data-error' => "Thông tin chưa hợp lệ"
            ));
            $dsort->setLabel('<i class="fas fa-sort mr-1"></i>Sắp xếp');
            $this->add($dsort);
        }
        
        //image
        $image = new Hidden('image');
        $image->setLabel('<i class="fas fa-image mr-1"></i>Ảnh đại diện');
        $image->setUserOption('attr','image');
        $this->add($image);
    }
}
