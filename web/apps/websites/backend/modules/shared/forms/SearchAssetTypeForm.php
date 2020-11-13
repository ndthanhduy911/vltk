<?php
namespace Backend\Modules\Shared\Forms;

use AssetType;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;

class SearchAssetTypeForm extends Form{
    public function initialize($entity = null, $options = null){
        //nameSearch
        $nameSearch = new Text('nameSearch');
        $nameSearch->setLabel('Tên loại tài sản');
        $nameSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Trang thiết bị văn phòng - Bàn làm việc',
            'maxlength' => "100",
            'data-maxlength-error' => "Thông tin không được quá 100 ký tự"
        ));
        $this->add($nameSearch);

        $typeSearch = new Select('typeSearch', \AssetGType::findNoDelete("id,name"), array(
            'using' => ['id','name'],
            'class' => 'form-control form-control-sm',
            'useEmpty'      => true,
            'emptyValue'    => 'all',
            'emptyText'     => 'Tất cả',
            'data-error' => "Phân loại đúng quy định."
        ));
        $typeSearch->setLabel('Phân loại');
        $this->add($typeSearch);

        $codeSearch = new Text('codeSearch');
        $codeSearch->setLabel('Mã loại TS');
        $codeSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: HNNA',
            'maxlength' => "4",
            'size' => '4',
            'data-maxlength-error' => "Thông tin không được quá 4 ký tự"
        ));
        $this->add($codeSearch);


        $assetType = AssetType::getAllTree();
        $parentSearch = new Select('parentSearch', $assetType, array(
            'class' => 'form-control form-control-sm',
            'useEmpty'      => true,
            'emptyValue'    => 'all',
            'emptyText'     => 'Tất cả'
        ));
        $parentSearch->setLabel('Trực thộc');
        $this->add($parentSearch);


        //packgeSearch
        $paged = new Hidden('paged');
        $paged->setAttributes(array('id' => null));
        $this->add($paged);
    }
}
