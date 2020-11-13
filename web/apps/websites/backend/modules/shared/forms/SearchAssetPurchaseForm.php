<?php
namespace Backend\Modules\Shared\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;

class SearchAssetPurchaseForm extends Form{
    public function initialize($entity = null, $options = null){
        //nameSearch
        $nameSearch = new Text('nameSearch');
        $nameSearch->setLabel('Tên hình thức mua sắm');
        $nameSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Đấu thầu',
            'maxlength' => "100",
        ));
        $this->add($nameSearch);

        $idSearch = new Text('idSearch');
        $idSearch->setLabel('ID');
        $idSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: 1',
            'size' => "10",
        ));
        $this->add($idSearch);

        $createdSearch = new Text('createdSearch');
        $createdSearch->setLabel('Ngày tạo');
        $createdSearch->setAttributes(array(
            'class' => 'form-control form-control-sm singleDatePicker',
            'maxlength' => "10",
            'data-error' => "Ngày tạo chưa hợp lệ",
            'placeholder' => 'Ví dụ: 15/05/2020',
        ));
        $this->add($createdSearch);

        //packgeSearch
        $paged = new Hidden('paged');
        $paged->setAttributes(array('id' => null));
        $this->add($paged);
    }
}
