<?php
namespace Backend\Modules\Master\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;

class SearchBackupForm extends Form{
    public function initialize($entity = null, $options = null){
        //nameSearch
        $nameSearch = new Text('nameSearch');
        $nameSearch->setLabel('Tên tập tin');
        $nameSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "100",
            'placeholder' => 'Ví dụ: Sao lưu dữ liệu định kỳ',
        ));
        $this->add($nameSearch);

        //createddate
        $createddateSearch = new Text('createddateSearch');
        $createddateSearch->setLabel('Ngày sao lưu');
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
