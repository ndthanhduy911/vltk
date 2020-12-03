<?php
namespace Backend\Modules\Master\Forms;


use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;

class SearchTrashsForm extends Form{
    public function initialize($entity = null, $options = null){
        //typeSearch
        $typeSearch = new Text('typeSearch');
        $typeSearch->setLabel('Tiêu đề');
        $typeSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: posts',
            'maxlength' => "100",
        ));
        $this->add($typeSearch);
    }
}
