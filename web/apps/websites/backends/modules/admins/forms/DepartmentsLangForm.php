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

class DeptsLangForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $name = new Text('name');
        $name->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề.",
            'maxlength' => "255",
            'data-error' => "Tiêu đề không đúng quy định.",
        ));
        $name->addValidators(array(
            new PresenceOf(array(
                'message' => 'Tiêu đề không được bỏ trống.',
            )),
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Tiêu đề không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($name);

        $description = new Textarea('description');
        $description->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Giới thiệu',
            'maxlength' => "255",
            'data-error' => "Giới thiệu",
            'rows' => 4
        ));
        $this->add($description);

        $address = new Text('address');
        $address->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Địa chỉ',
            'maxlength' => "255",
            'data-error' => "Địa chỉ không đúng quy định.",
        ));
        $address->addValidators(array(
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Địa chỉ không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($address);

        $dept_id = new Hidden('dept_id');
        $this->add($dept_id);

        $lang_id = new Hidden('lang_id');
        $this->add($lang_id);
    }
}
