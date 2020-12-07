<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\PresenceOf;
class ClassesForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $slug = new Text('slug');
        $slug->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "200",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $slug->addValidators(array(
            new StringLength([
                "max" => 200,
                "messageMaximum" => "Slug không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($slug);

        $code = new Text('code');
        $code->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Mã lớp',
            'maxlength' => "200",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $code->addValidators(array(
            new StringLength([
                "max" => 20,
                "messageMaximum" => "Mã lớp không được dài quá 20 ký tự",
            ]),
        ));
        $this->add($code);

        $status = new Select('status', [
            1 => "Hoạt động",
            0 => "Khóa",
        ], [
            'class' => 'form-control pull-right w-100',
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $status->addValidators(array(
            new PresenceOf(array(
                'message' => 'Trạng thái không được để trống.',
            )),
        ));
        $this->add($status);

        $image = new Hidden('image');
        $this->add($image);

        $background_image = new Hidden('background_image');
        $this->add($background_image);

        $deleted = new Hidden('deleted');
        $this->add($deleted);
    }
}
