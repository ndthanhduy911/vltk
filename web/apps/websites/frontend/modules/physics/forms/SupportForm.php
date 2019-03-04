<?php
namespace Frontend\Modules\Physics\Forms;

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
use Models\Package;
use Models\Department;

class SupportForm extends BaseForm{
    public function initialize($entity = null, $options = null){
        //package

        $package = json_decode($this->session->get('package_id'));
        if(array_search('all' , $package) !== false){
            $packageList =  Package::find();
        }else{
            $packageList =  Package::find(array(
                'id IN ('.implode(',',$package).')'
            ));
        }
        $package_id= new Select('package_id', $packageList , array(
            'using'                 => array('id', 'name'),
            'class'                 => 'form-control input-sm',
            'useEmpty'              => true,
            'emptyText'             => 'Chọn...',
            'emptyValue'            => '',
            'required'              => 'true',
            'data-required-error'   => "Vui lòng chọn dịch vụ.",
            'style'                 => 'width: 100%; line-height: 34px; height: 34px'
        ));
        $package_id->addValidators([
            new PresenceOf([
                'message'   => 'The package is required'
            ]),
        ]);
        $package_id->setLabel("Dịch vụ <strong class=\"text-danger\">*</strong>");
        $this->add($package_id);

        $department_id= new Select('department_id', Department::find() , array(
            'using'                 => array('id', 'name'),
            'class'                 => 'form-control',
            'useEmpty'              => true,
            'emptyText'             => 'Chọn...',
            'emptyValue'            => '',
            'required'              => true,
            'data-required-error'   => "Vui lòng chọn đơn vị."
        ));
        $department_id->setLabel("Đơn vị <strong class=\"text-danger\">*</strong>");
        $this->add($department_id);


        $req_package= new Radio('req_package', array(
            'class'         => 'form-control',
        ));

        $req_package->setLabel("");
        $this->add($req_package);
        
        //note
        $note = new TextArea('note',[
            'class'         => 'form-control',
            'placeholder'   => 'Ghi chú',
            'maxlength'     => 255,
            'size'          => 255
        ]);
        $note->setLabel("Ghi chú");
        $this->add($note);

        //ticket
        $ticket = new Text('ticket',[
            'class'         => 'form-control',
            'placeholder'   => 'Ghi chú',
            'maxlength'     => 255,
            'size'          => 255,
            'required'      => true,
            'readonly'      => true,
            'disabled'      => true,
        ]);
        $ticket->setLabel("Ghi chú");
        $this->add($ticket);

        //ticket
        $department_other = new Text('department_other',[
            'class'         => 'form-control',
            'placeholder'   => 'Mô tả/ Khác',
            'maxlength'     => 255,
            'size'          => 255,
            'required'      => true,
        ]);
        $department_other->setLabel("Mô tả/ Khác");
        $this->add($department_other);

        $priority= new Select('priority', [
            'low'               => "Chậm",
            'normal'            => "Bình thường",
            'height'            => "Cao",
            'urgent'            => "Khẩn cấp"
        ] , array(
            'class'                 => 'form-control select-style',
            'style'                 => 'height: 36px',
            'required'              => true,
            'data-required-error'   => "Vui lòng chọn độ khẩn cấp."
        ));
        $priority->addValidators([
            new PresenceOf([
                'message'   => 'The priority is required'
            ]),
        ]);
        $priority->setDefault('normal');
        $priority->setLabel("Mức độ ưu tiên <strong class=\"text-danger\">*</strong>");
        $this->add($priority);

        $assess= new Select('assess', [
            '0'                 => "Không đánh giá",
            '1'                 => "Đã hoàn thành",
            '2'                 => "Chưa hoàn thành",
        ] , array(
            'class'                 => 'form-control',
        ));
        $assess->setLabel("Đánh giá");
        $this->add($assess);
    }
}
