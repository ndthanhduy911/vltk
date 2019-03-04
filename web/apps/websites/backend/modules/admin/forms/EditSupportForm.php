<?php

namespace Backend\Modules\Dashboard\Forms;

use Library\Helper\Helper;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Check;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Radio;
use Phalcon\Forms\Element\Email as Email;
use Phalcon\Validation\Validator\Digit as DigitValidator;
use Phalcon\Forms\Element\File;
use Phalcon\Validation\Validator\Email as valEmail;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Confirmation;
use Phalcon\Validation\Validator\Between;
use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Base\Forms\BaseForm;
use Library\Common as LibraryCommon;

use Models\User;

class EditSupportForm extends BaseForm{
    public function initialize($entity = null, $options = null){
        $assign_person_id = new Select('assign_person_id', User::find(), array(
            'using'         => array('id', 'fullname'),
            'class'         => 'form-control input-sm',
            'multiple'      => true,
            'style'         => 'width: 100%',
            'required'      => true,
            'data-required-error' => 'Vui lòng chọn người thực hiện'
        ));
        $assign_person_id->setLabel('<span class="text-danger">Người thực hiện</span>');
        $this->add($assign_person_id);

        $deadline = new Text('deadline', array(
            'class'         => 'form-control  input-sm datetimepicker-input',
            'placeholder'   => '(dd/mm/yyyy hh:mm)',
            'style'         => 'height: 34px;',
            'data-toggle'   => "datetimepicker",
            'data-target'   =>"#deadline",
        ));
        $deadline->setLabel('<span class="text-danger">Ngày hoàn thành</span>');
        $this->add($deadline);

        $des_assign = new Textarea('des_assign', array(
            'class'         => 'form-control',
            'placeholder'   => 'Mô tả',
            'rows'           => 6
        ));
        $des_assign->setLabel('<span class="text-danger">Mô tả nội dung công việc</span>');
        $this->add($des_assign);

        $progress = new Numeric('progress', array(
            'class'         => 'form-control input-sm col-5',
            'placeholder'   => '%',
            'style'         => 'height: 34px;',
            'min'           =>  '0',
            'max'           =>  '100',
            'data-error'    =>  'Đây phải là nguyên từ 0 đến 100'
        ));
        $progress->setLabel('<span class="text-danger">Tiến độ</span>');
        $this->add($progress);

        //status
        $status = new Select('status',[
            1              => "Đã nhận",
            3              => "Đang làm",
            4               => "Sự cố",
            2               => "Xong",

        ], [
            'class'         => 'form-control input-sm',
            'style'         =>  'height: auto'
        ]);

        $status->setLabel('<span class="text-danger">Tình trạng</span>');
        $this->add($status);
    }
}
