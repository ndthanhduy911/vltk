<?php
namespace Backend\Modules\Admins\Forms;


use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\PresenceOf;

class BannerForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $button_link = new Text('button_link');
        $button_link->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Link',
            'maxlength' => "200",
        ));
        $button_link->addValidators(array(
            new StringLength([
                "max" => 200,
                "messageMaximum" => "Links không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($button_link);

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

        $image = new Hidden('image');
        $this->add($image);

        $deleted = new Hidden('deleted');
        $this->add($deleted);
    }
}
