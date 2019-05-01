<?php
namespace Backend\Modules\Posts\Forms;


use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\PresenceOf;

use Models\Categories;

class CategoriesForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $title = new Text('title');
        $title->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề.",
            'maxlength' => "255",
            'data-error' => "Tiêu đề không đúng quy định.",
        ));
        $title->addValidators(array(
            new PresenceOf(array(
                'message' => 'Tiêu đề không được bỏ trống.',
            )),
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Tiêu đề không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($title);

        $description = new Textarea('description');
        $description->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tóm tắt',
            'maxlength' => "255",
            'data-error' => "Tóm tắt không đúng quy định.",
            'rows' => 4
        ));
        $description->addValidators(array(
            new StringLength([
                "max" => 255,
                "messageMaximum" => "Tóm tắt không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($description);

        $slug = new Text('slug');
        $slug->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Url',
            'maxlength' => "200",
            'data-error' => "Url không đúng quy định.",
            'required' => '',
            'data-required-error' => "Url không được để trống.",
        ));
        $slug->addValidators(array(
            new StringLength([
                "max" => 200,
                "messageMaximum" => "Tóm tắt không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($slug);

        $cat_id = new Select('cat_id', Categories::find(), array(
            'using' => array('id', 'name'),
            'useEmpty' => true,
            'emptyText' => 'Mặc định',
            'emptyValue' => 0,
            'class' => 'ml-1 form-control-sm pull-right w-100',
            'data-error' => "Chưa đúng định dạng",
        ));
        $cat_id->addValidators(array(
            new PresenceOf(array(
                'message' => 'Đơn vị không được để trống',
            )),
        ));
        $this->add($cat_id);

        $status = new Select('status', [
            1 => "Sử dụng",
            0 => "Dừng",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Vui lòng chọn trạng thái',
            'emptyValue' => '',
            'class' => 'form-control-sm pull-right w-100',
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ]);
        $status->addValidators(array(
            new PresenceOf(array(
                'message' => 'Trạng thái không được để trống.',
            )),
        ));
        $this->add($status);
    }
}
