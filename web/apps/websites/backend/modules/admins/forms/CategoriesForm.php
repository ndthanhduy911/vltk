<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;

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
            'data-required-error' => 'Vui lòng nhập thông tin',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $status->setLabel('Trạng thái');
        $this->add($status);

        //parentid
        // $cats = \Categories::getTreeName(0,[],'',"--",1);
        // $parentid = new Select('parentid', $cats, array(
        //     'class' => 'form-control form-control-sm',
        //     'required' => '',
        //     'useEmpty'      => true,
        //     'emptyValue'    => '0',
        //     'emptyText'     => 'Không có',
        //     'data-required-error' => "Vui lòng nhập thông tin",
        //     'data-error' => "Thông tin không hợp lệ"
        // ));
        // $parentid->setLabel('Trực thuộc '.requiredLabel());
        // $this->add($parentid);

        //slug
        $slug = new Text('slug');
        $slug->setLabel('Slug');
        $slug->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "200",
            'data-error' => "Thông tin chưa hợp lệ",
        ));
        $this->add($slug);

        //image
        $image = new Hidden('image');
        $this->add($image);
    }
}
