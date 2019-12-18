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

class DepartmentsForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $code = new Text('code');
        $code->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Viết tắt bộ môn',
            'maxlength' => "30",
        ));
        $code->addValidators(array(
            new StringLength([
                "max" => 30,
                "messageMaximum" => "Viết tắt không được dài quá 30 ký tự",
            ]),
        ));
        $this->add($code);

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

        $phone = new Text('phone');
        $phone->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Số điện thoại bộ môn',
            'maxlength' => "30",
        ));
        $phone->addValidators(array(
            new StringLength([
                "max" => 30,
                "messageMaximum" => "Số điện thoại không được dài quá 30 ký tự",
            ]),
        ));
        $this->add($phone);

        $email = new Email('email');
        $email->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => "E-mail",
            'data-required-error' => "Vui lòng điền đầy đủ thông tin",
            'maxlength' => "100",
            'required' => '',
            'data-error' => "Chưa đúng định dạng e-mail",
        ));
        $email->addValidators(array(
            new PresenceOf(array(
                'message' => 'Địa chỉ e-mail không được để trống',
            )),
            new StringLength([
                "max" => 100,
                "messageMaximum" => "Địa chỉ e-mail không được dài quá 100 ký tự",
            ]),
        ));
        $this->add($email);

        $status = new Select('status', [
            1 => "Hoạt động",
            0 => "Khóa",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Vui lòng chọn trạng thái',
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

        $logo = new Hidden('logo');
        $this->add($logo);

        $icon = new Hidden('icon');
        $this->add($icon);

        $post_connect = new Hidden('post_connect');
        $this->add($post_connect);

        $parent_id = new Hidden('parent_id');
        $this->add($parent_id);

        $level = new Hidden('parent_id');
        $this->add($level);
    }
}
