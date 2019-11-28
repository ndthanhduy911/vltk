<?php
namespace Backend\Modules\Setting\Forms;


use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\PresenceOf;

use Models\MenuLocation;

class MenuLocationForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $name = new Text('name');
        $name->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Nhập tên vị trí',
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin',
            'maxlength' => "255",
            'data-error' => "Nội dung không đúng quy định",
        ));
        $name->addValidators(array(
            new PresenceOf(array(
                'message' => 'Tên vị trí không được bỏ trống.',
            )),
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Tên vị trí không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($name);

        $description = new Textarea('description');
        $description->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Nhập mô tả',
            'maxlength' => "255",
            'data-error' => "Nội dung không đúng quy định",
            'rows' => 4
        ));
        $description->addValidators(array(
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Mô tả không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($description);

        $status = new Select('status', [
            1 => "Hoạt động",
            0 => "Khóa",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Chọn trạng thái',
            'emptyValue' => '',
            'class' => 'form-control',
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin',
        ]);
        $status->addValidators(array(
            new PresenceOf(array(
                'message' => 'Trạng thái không được để trống.',
            )),
        ));
        $this->add($status);
    }
}
