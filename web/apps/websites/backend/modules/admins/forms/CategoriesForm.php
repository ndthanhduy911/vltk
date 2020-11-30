<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;

class CategoriesForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {
        //status
        $status = new Select('status', [
            1 => "Hoạt động",
            0 => "Khóa",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Chọn trạng thái',
            'emptyValue' => '',
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin',
            'data-error' => "Thông tin không hợp lệ"
        ]);
        $status->setLabel('Trạng thái '.requiredLabel());
        $this->add($status);

        //parentid
        $cats = \Categories::getTreeName(0,[],'',"--",1);
        $parentid = new Select('parentid', $cats, array(
            'class' => 'form-control form-control-sm',
            'required' => '',
            'useEmpty'      => true,
            'emptyValue'    => '0',
            'emptyText'     => 'Không có',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin không hợp lệ"
        ));
        $parentid->setLabel('Trực thuộc '.requiredLabel());
        $this->add($parentid);

        //slug
        $slug = new Text('slug');
        $slug->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: tin-giao-vu',
            'maxlength' => "200"
        ));
        $slug->setLabel('Slug');
        $this->add($slug);

        //name
        $name = new Text('name');
        $name->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Tin tức',
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề.",
            'maxlength' => "255",
            'data-error' => "Thông tin không hợp lệ"
        ));
        $name->setLabel('Tên chuyên mục');
        $this->add($name);

        //description
        $description = new Textarea('description');
        $description->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Mô tả',
            'maxlength' => "255",
            'rows' => 4,
            'data-error' => "Thông tin không hợp lệ"
        ));
        $description->setLabel('Mô tả');
        $this->add($description);
    }
}
