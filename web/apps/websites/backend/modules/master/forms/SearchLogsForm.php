<?php
namespace Backend\Modules\Master\Forms;


use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;

class SearchLogsForm extends Form{
    public function initialize($entity = null, $options = null){
        //nameSearch
        $nameSearch = new Text('nameSearch');
        $nameSearch->setLabel('Tiêu đề');
        $nameSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Đăng nhập hệ thống',
            'maxlength' => "100",
        ));
        $this->add($nameSearch);

        //typeidSearch
        $typeidSearch = new Select('typeidSearch',[
            "all"              => "Tất cả",
            1              => "Thêm mới",
            2              => "Chỉnh sửa",
            3              => "Xóa",
            4              => "Đăng nhập",
        ], [
            'class'         => 'form-control form-control-sm',
        ]);
        $typeidSearch->setLabel('Loại nhật ký');
        $this->add($typeidSearch);

        //packgeSearch
        $paged = new Hidden('paged');
        $paged->setAttributes(array('id' => null));
        $this->add($paged);
    }
}
