<?php
namespace Backend\Modules\Shared\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;

class SearchSupplierForm extends Form{
    public function initialize($entity = null, $options = null){
        //nameSearch
        $nameSearch = new Text('nameSearch');
        $nameSearch->setLabel('Tên nhà cung cấp');
        $nameSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Công ty A',
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

        $otherSearch = new Text('otherSearch');
        $otherSearch->setLabel('E-mail/ Số điện thoại');
        $otherSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "150",
            'size' => "150",
            'data-error' => "Thông tin chưa hợp lệ",
            'placeholder' => 'Ví dụ: info@honeynet.vn',
        ));
        $this->add($otherSearch);

        //packgeSearch
        $paged = new Hidden('paged');
        $paged->setAttributes(array('id' => null));
        $this->add($paged);
    }
}
