<?php
namespace Backend\Modules\Admins\Forms;

use Models\Classes;
use Models\Subjects;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Date as DateValidator;
class CalendarsForm extends Form
{
    public function initialize($entity = null, $options = null)
    {

        $dept_id = isset($_SESSION['dept_id']) ? $_SESSION['dept_id'] : 0;
        $npClasses = Classes::getNamepace();
        $classes = $this->modelsManager->createBuilder()
        ->columns(array(
            $npClasses.'.id',
            'CL.title title',
        ))
        ->from($npClasses)
        ->join('Models\ClassesLang', "CL.class_id = $npClasses.id AND CL.lang_id = 1",'CL')
        ->orderBy('CL.title ASC')
        ->where("$npClasses.dept_id = $dept_id")
        ->getQuery()
        ->execute();

        $npSubjects = Subjects::getNamepace();
        $subjects = $this->modelsManager->createBuilder()
        ->columns(array(
            $npSubjects.'.id',
            'CL.title title',
        ))
        ->from($npSubjects)
        ->join('Models\SubjectsLang', "CL.subject_id = $npSubjects.id AND CL.lang_id = 1",'CL')
        ->orderBy('CL.title ASC')
        ->where("$npSubjects.dept_id = $dept_id")
        ->getQuery()
        ->execute();

        $class_id = new Select('class_id', $classes, array(
            'using' => array('id', 'title'),
            'class' => 'form-control',
            'data-error' => "Chưa đúng định dạng",
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin',
        ));
        $class_id->addValidators(array(
            new PresenceOf(array(
                'message' => 'Lớp học không được để trống',
            )),
        ));
        $this->add($class_id);

        $subject_id = new Select('subject_id', $subjects, array(
            'using' => array('id', 'title'),
            'class' => 'form-control',
            'data-error' => "Chưa đúng định dạng",
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin',
        ));
        $subject_id->addValidators(array(
            new PresenceOf(array(
                'message' => 'Môn học không được để trống',
            )),
        ));
        $this->add($subject_id);

        $begin_date = new Text('begin_date');
        $begin_date->setAttributes(array(
            'class' => 'form-control-sm date-basic w-100',
            'placeholder' => 'dd/mm/yyyy',
            'maxlength' => "10",
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin',
            // 'pattern' =>"^(0[1-9]|1\d|2\d|3[01])\/(0[1-9]|1[0-2])\/(19|20)\d{2}$",
            // 'data-pattern-error' => "Định đạng không đúng. Chỉ cho phép ngày theo định dạng dd/mm/yyyy"
        ));
        $begin_date->addValidators(array(
            new PresenceOf(array(
                'message' => 'Ngày bắt đầu không được để trống',
            )),
            new DateValidator(
                [
                    "format"  => "d/m/Y",
                    "message" => "Không đúng định dạng thời gian",
                ]
            )
        ));
        $this->add($begin_date);

        $day = new Select('day', [
            'Monday' => "Thứ Hai",
            'Tuesday' => "Thứ Ba",
            'Wednesday' => "Thứ Tư",
            'Thursday' => "Thứ Năm",
            'Friday' => "Thứ Sáu",
            'Saturday' => "Thứ Bảy",
            'Sunday' => "Chủ Nhật",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Chọn thứ',
            'emptyValue' => '',
            'class' => 'form-control',
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ]);
        $day->addValidators(array(
            new PresenceOf(array(
                'message' => 'Thứ không được để trống.',
            )),
        ));
        $this->add($day);

        $begin_time = new Text('begin_time');
        $begin_time->setAttributes(array(
            'class' => 'form-control-sm time-basic',
            'placeholder' => 'HH/mm',
            'maxlength' => "10",
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin',
            // 'pattern' =>"^(0[1-9]|1\d|2\d|3[01])\/(0[1-9]|1[0-2])\/(19|20)\d{2}$",
            // 'data-pattern-error' => "Định đạng không đúng. Chỉ cho phép ngày theo định dạng dd/mm/yyyy"
        ));
        $begin_time->addValidators(array(
            new PresenceOf(array(
                'message' => 'Thời gian bắt đầu không được để trống',
            )),
            new DateValidator(
                [
                    "format"  => "H:i",
                    "message" => "Không đúng định dạng thời gian",
                ]
            )
        ));
        $this->add($begin_time);

        $end_time = new Text('end_time');
        $end_time->setAttributes(array(
            'class' => 'form-control-sm time-basic',
            'placeholder' => 'HH/mm',
            'maxlength' => "10",
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin',
            // 'pattern' =>"^(0[1-9]|1\d|2\d|3[01])\/(0[1-9]|1[0-2])\/(19|20)\d{2}$",
            // 'data-pattern-error' => "Định đạng không đúng. Chỉ cho phép ngày theo định dạng dd/mm/yyyy"
        ));
        $end_time->addValidators(array(
            new PresenceOf(array(
                'message' => 'Thời gian kết thúc không được để trống',
            )),
            new DateValidator(
                [
                    "format"  => "H:i",
                    "message" => "Không đúng định dạng thời gian",
                ]
            )
        ));
        $this->add($end_time);

        $year = new Text('year');
        $year->setAttributes(array(
            'class' => 'form-control-sm time-basic',
            'placeholder' => 'YYYY',
            'maxlength' => "4",
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin',
            // 'pattern' =>"^(0[1-9]|1\d|2\d|3[01])\/(0[1-9]|1[0-2])\/(19|20)\d{2}$",
            // 'data-pattern-error' => "Định đạng không đúng. Chỉ cho phép ngày theo định dạng dd/mm/yyyy"
        ));
        $year->addValidators(array(
            new PresenceOf(array(
                'message' => 'Năm không được để trống',
            )),
            new DateValidator(
                [
                    "format"  => "yyyy",
                    "message" => "Không đúng định dạng thời gian",
                ]
            )
        ));
        $this->add($year);

        $semester = new Select('semester', [
            1 => "1",
            2 => "2",
            3 => "3",

        ], [
            'useEmpty' => true,
            'emptyText' => 'Chọn học kỳ',
            'emptyValue' => '',
            'class' => 'form-control pull-right w-100',
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ]);
        $semester->addValidators(array(
            new PresenceOf(array(
                'message' => 'Học kỳ không được để trống.',
            )),
        ));
        $this->add($semester);
        

        $location = new Text('location');
        $location->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Phòng học',
            'required' => '',
            'data-required-error' => "Vui lòng nhập đầy đủ thông tin",
            'maxlength' => "255",
            'data-error' => "Phòng học không đúng quy định.",
        ));
        $location->addValidators(array(
            new PresenceOf(array(
                'message' => 'Phòng học không được bỏ trống.',
            )),
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Phòng học không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($location);

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

        $featured_image = new Hidden('featured_image');
        $this->add($featured_image);

        $background_image = new Hidden('background_image');
        $this->add($background_image);

        $deleted = new Hidden('deleted');
        $this->add($deleted);
    }
}
