<?php
namespace Backend\Modules\Shared\Forms;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;

class SearchCategoriesForm extends Form{
    public function initialize($entity = null, $options = null){
        //nameSearch
        $nameSearch = new Text('nameSearch');
        $nameSearch->setLabel('Tên bộ môn');
        $nameSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Bộ phận Kỹ thuật',
            'maxlength' => "100",
            'data-maxlength-error' => "Thông tin không được quá 100 ký tự"
        ));
        $this->add($nameSearch);

        //parentid
        $cats = \Categories::getTreeName(0);
        $parentidSearch = new Select('parentidSearch', $cats, array(
            'class' => 'form-control form-control-sm',
            'useEmpty'      => true,
            'emptyValue'    => '0',
            'emptyText'     => 'Tất cả'
        ));
        $parentidSearch->setLabel('Trực thộc');
        $this->add($parentidSearch);

        //dcode
        $dcodeSearch = new Text('dcodeSearch');
        $dcodeSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: VLKT',
            'size' => "11",
        ));
        $dcodeSearch->setLabel('Mã bộ môn');
        $this->add($dcodeSearch);
    }
}
