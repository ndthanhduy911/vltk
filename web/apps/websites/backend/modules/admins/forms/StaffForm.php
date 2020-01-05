<?php
namespace Backend\Modules\Admins\Forms;

use Models\Departments;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Date as DateValidator;

class StaffForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $slug = new Text('slug');
        $slug->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Slug',
            'maxlength' => "200",
        ));
        $slug->addValidators(array(
            new StringLength([
                "max" => 200,
                "messageMaximum" => "Slug không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($slug);

        $npDept = Departments::getNamepace();
        $depts = $this->modelsManager->createBuilder()
        ->columns(array(
            $npDept.'.id',
            'DL.name name',
        ))
        ->from($npDept)
        ->join('Models\DepartmentsLang', "DL.dept_id = $npDept.id AND DL.lang_id = 1",'DL')
        ->orderBy('DL.id ASC')
        ->where("$npDept.status = 1")
        ->getQuery()
        ->execute();

        $dept_id = new Select('dept_id', $depts, array(
            'using' => array('id', 'name'),
            'class' => 'form-control pull-right w-100',
            'useEmpty' => true,
            'emptyText' => 'Chọn bộ môn',
            'emptyValue' => '',
            'data-error' => "Chưa đúng định dạng",
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ));
        $dept_id->addValidators(array(
            new PresenceOf(array(
                'message' => 'Bộ môn không được để trống',
            )),
        ));
        $this->add($dept_id);

        $status = new Select('status', [
            1 => "Hoạt động",
            0 => "Khóa",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Chọn trạng thái',
            'emptyValue' => '',
            'class' => 'form-control pull-right w-100',
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ]);
        $status->addValidators(array(
            new PresenceOf(array(
                'message' => 'Trạng thái không được để trống.',
            )),
        ));
        $this->add($status);

        $dean = new Select('dean', [
            1 => "Trưởng khoa",
            2 => "Phó trưởng khoa",
        ], [
            'class' => 'form-control',
            'useEmpty' => true,
            'emptyText' => 'Không có',
            'emptyValue' => '',
        ]);
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
        ]);
        $this->add($dept_position);

        $email = new Text('email');
        $email->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Địa chỉ e-mail',
            'maxlength' => "150",
        ));
        $email->addValidators(array(
            new StringLength([
                "max" => 150,
                "messageMaximum" => "Email không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($email);

        $sort = new Numeric('sort');
        $sort->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Sắp xếp',
            'maxlength' => "999",
        ));
        $this->add($sort);


        $featured_image = new Hidden('featured_image');
        $this->add($featured_image);

        $deleted = new Hidden('deleted');
        $this->add($deleted);
    }
}
