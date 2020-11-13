<?php
namespace Backend\Modules\Dashboard\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;

class SearchReportsForm extends Form{
    public function initialize($entity = null, $options = null){
        //nameSearch
        $nameSearch = new Text('nameSearch');
        $nameSearch->setLabel('Tên nhóm báo cáo');
        $nameSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Thông tư 200/2014',
            'maxlength' => "100",
            'size' => "100"
        ));
        $this->add($nameSearch);

        //paged
        $paged = new Hidden('paged');
        $paged->setAttributes(array('id' => null));
        $this->add($paged);
    }
}
