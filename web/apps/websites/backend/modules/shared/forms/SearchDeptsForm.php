<?php
namespace Backend\Modules\Shared\Forms;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;

class SearchDeptsForm extends Form{
    public function initialize($entity = null, $options = null){
        //nameSearch
        $nameSearch = new Text('nameSearch');
        $nameSearch->setLabel('Tên đơn vị/ bộ phận');
        $nameSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Bộ phận Kỹ thuật',
            'maxlength' => "100",
            'data-maxlength-error' => "Thông tin không được quá 100 ký tự"
        ));
        $this->add($nameSearch);

        $depts = \Depts::getTreeName(0);
        $parentSearch = new Select('parentSearch', $depts, array(
            'class' => 'form-control form-control-sm',
            'useEmpty'      => true,
            'emptyValue'    => 'all',
            'emptyText'     => 'Tất cả'
        ));
        $parentSearch->setLabel('Trực thộc');
        $this->add($parentSearch);

        $dcodeSearch = new Text('dcodeSearch');
        $dcodeSearch->setLabel('Mã đơn vị/bộ phận');
        $dcodeSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: HNN1223234',
            'size' => "11",
        ));
        $this->add($dcodeSearch);

        //packgeSearch
        $paged = new Hidden('paged');
        $paged->setAttributes(array('id' => null));
        $this->add($paged);
    }
}
