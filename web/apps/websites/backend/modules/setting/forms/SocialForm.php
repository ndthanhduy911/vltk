<?php
namespace Backend\Modules\Setting\Forms;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\PresenceOf;

class SocialForm extends Form
{
    public function initialize($entity = null, $options = null)
    {

        $name = new Text('name');
        $name->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tiêu đề',
            'maxlength' => "200",
        ));
        $name->addValidators(array(
            new StringLength([
                "max" => 200,
                "messageMaximum" => "Tiêu đề không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($name);

        $link = new Text('link');
        $link->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Link',
            'maxlength' => "200",
        ));
        $link->addValidators(array(
            new StringLength([
                "max" => 200,
                "messageMaximum" => "Link không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($link);

        $sort = new Numeric('sort');
        $sort->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Sắp xếp',
        ));
        $this->add($sort);

        $icon = new Select('icon', [
            'fa-' => "fa-1",
            'fa-' => "fa-2",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Chọn biểu tượng',
            'emptyValue' => '',
            'class' => 'form-control',
        ]);
        $this->add($icon);

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

        $dept_id = new Hidden('dept_id');
        $this->add($dept_id);

        $deleted = new Hidden('deleted');
        $this->add($deleted);
    }
}
