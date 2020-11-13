<?php
namespace Backend\Modules\Master\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;

class SearchRoleForm extends Form{
    public function initialize($entity = null, $options = null){
        //nameSearch
        $nameSearch = new Text('nameSearch');
        $nameSearch->setLabel('Tên nhóm người dùng');
        $nameSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "100",
            'placeholder' => 'Ví dụ: Quản trị viên',
        ));
        $this->add($nameSearch);

        //statusSearch
        $statusSearch = new Select('statusSearch',[
            "all"              => "Tất cả",
            1              => "Hoạt động",
            0              => "Khóa",
        ], [
            'class'         => 'form-control form-control-sm',
        ]);
        $statusSearch->setLabel('Trạng thái');
        $this->add($statusSearch);

        //createddate
        $createddateSearch = new Text('createddateSearch');
        $createddateSearch->setLabel('Ngày tạo');
        $createddateSearch->setAttributes(array(
            'class' => 'form-control form-control-sm singleDatePicker',
            'maxlength' => "10",
            'placeholder' => 'Ví dụ: 15/05/2020',
        ));
        $this->add($createddateSearch);

        //packgeSearch
        $paged = new Hidden('paged');
        $paged->setAttributes(array('id' => null));
        $this->add($paged);
    }
}
