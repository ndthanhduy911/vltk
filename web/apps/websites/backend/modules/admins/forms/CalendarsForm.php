<?php
namespace Backend\Modules\Admins\Forms;
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

        $deptid = isset($_SESSION['deptid']) ? $_SESSION['deptid'] : 0;
        $classes = $this->modelsManager->createBuilder()
        ->columns(array(
            'c.id',
            'cl.title title',
        ))
        ->from(['c' => 'Classes'])
        ->leftJoin('ClassesLang', "cl.class_id = c.id AND cl.langid = 1",'cl')
        ->orderBy('cl.title ASC')
        ->where("c.deptid = $deptid")
        ->getQuery()
        ->execute();

        $subjects = $this->modelsManager->createBuilder()
        ->columns(array(
            's.id',
            'sl.title title',
        ))
        ->from(['s' => 'Subjects'])
        ->leftJoin('SubjectsLang', "sl.subject_id = s.id AND sl.langid = 1",'sl')
        ->orderBy('sl.title ASC')
        ->where("s.deptid = $deptid")
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
            'class' => 'form-control date-basic w-100',
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
                    "message" => "Ngày bắt đầu không đúng định dạng thời gian",
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
            'class' => 'form-control time-basic',
            'placeholder' => 'Thời gian bắt đầu (HH:mm)',
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
                    "message" => "Bắt đầu không đúng định dạng thời gian",
                ]
            )
        ));
        $this->add($begin_time);

        $end_time = new Text('end_time');
        $end_time->setAttributes(array(
            'class' => 'form-control time-basic',
            'placeholder' => 'Thời gian kết thúc (HH:mm)',
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
                    "message" => "Kết thúc không đúng định dạng thời gian",
                ]
            )
        ));
        $this->add($end_time);

        $year = new Text('year');
        $year->setAttributes(array(
            'class' => 'form-control year-basic',
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
                    "format"  => "Y",
                    "message" => "Năm không đúng định dạng thời gian",
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

        $location = new Select('location', [
            1 => "CS1: Nguyễn Văn Cừ",
            2 => "CS2: Linh Trung"
        ], [
            'useEmpty' => true,
            'emptyText' => 'Chọn cơ sở',
            'emptyValue' => '',
            'class' => 'form-control pull-right w-100',
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ]);
        $location->addValidators(array(
            new PresenceOf(array(
                'message' => 'Cơ sở không được để trống.',
            )),
        ));
        $this->add($location);

        $room = new Text('room');
        $room->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Phòng học',
            'maxlength' => "200",
        ));
        $room->addValidators(array(
            new StringLength([
                "max" => 200,
                "messageMaximum" => "Phòng hòng không được dài quá 255 ký tự",
            ]),
            new PresenceOf([
                "message" => "Phòng học không được để trống",
            ]),
        ));
        $this->add($room);

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
