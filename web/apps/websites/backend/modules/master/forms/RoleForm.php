<?php
namespace Backend\Modules\Master\Forms;

use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;

class RoleForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $name = new Text('name');
        $name->setLabel('Tên nhóm người dùng '.requiredLabel());
        $name->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "100",
            'data-error' => "Tên nhóm người dùng chưa hợp lệ",
            'required' => '',
            'placeholder' => 'Ví dụ: Quản trị viên',
            'data-required-error' => "Vui lòng nhập thông tin",
        ));
        $this->add($name);

        //status
        $status = new Select('status',[
            1              => "Hoạt động",
            0              => "Khóa",
        ], [
            'class'         => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập thông tin",
        ]);
        $status->setLabel('Trạng thái '.requiredLabel());
        $this->add($status);

        $createdby = new Hidden('createdby');
        $this->add($createdby);
    }
}
