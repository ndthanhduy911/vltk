<?php
namespace Backend\Modules\Shared\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;

class SearchAssetUnitForm extends Form{
    public function initialize($entity = null, $options = null){
        //nameSearch
        $nameSearch = new Text('nameSearch');
        $nameSearch->setLabel('Tên đơn vị tính');
        $nameSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: máy',
            'maxlength' => "30",
            'data-maxlength-error' => "Đơn vị tính phải bé hơn 30 ký tự",
            'data-error' => "Thông tin không hợp lệ"
        ));
        $this->add($nameSearch);

        $idSearch = new Text('idSearch');
        $idSearch->setLabel('ID');
        $idSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: 1',
            'maxlength' => "11",
            'data-maxlength-error' => "Thông tin không được quá 11 ký tự"
        ));
        $this->add($idSearch);

        $createdSearch = new Text('createdSearch');
        $createdSearch->setLabel('Ngày tạo');
        $createdSearch->setAttributes(array(
            'class' => 'form-control form-control-sm date-format singleDatePicker',
            'maxlength' => "10",
            'data-error' => "Ngày tạo chưa hợp lệ",
            'placeholder' => 'Ví dụ: 15/05/2020'
        ));
        $this->add($createdSearch);

        //packgeSearch
        $paged = new Hidden('paged');
        $this->add($paged);
    }
}
