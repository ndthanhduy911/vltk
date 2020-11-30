<?php
namespace Backend\Modules\Master\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;

class SearchSyncForm extends Form{
    public function initialize($entity = null, $options = null){
        //yearSearch
        $yearSearch = new Text('yearSearch');
        $yearSearch->setLabel('Năm');
        $yearSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: 2020',
            'maxlength' => "4",
            'size' => "4"
        ));
        $this->add($yearSearch);

        $perL = \Library\Master\Master::checkPermissionDepted('sync','index');
        $deptType = \Depts::getTreeNamePermission($perL);
        $deptidSearch = new Select('deptidSearch', $deptType, array(
            'class' => 'form-control form-control-sm',
            'useEmpty'      => true,
            'emptyValue'    => 'all',
            'emptyText'     => 'Tất cả'
        ));
        $deptidSearch->setLabel('Bộ môn');
        $this->add($deptidSearch);

        //typeidSearch
        $assetType = \AssetType::getAllTree();
        $typeidSearch = new Select('typeidSearch', $assetType, array(
            'class' => 'form-control form-control-sm',
            'useEmpty'      => true,
            'emptyValue'    => '0',
            'emptyText'     => 'Tất cả',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Loại tài sản đúng quy định.",
        ));
        $typeidSearch->setLabel('Loại tài sản');
        $this->add($typeidSearch);

        //packgeSearch
        $paged = new Hidden('paged');
        $paged->setAttributes(array('id' => null));
        $this->add($paged);
    }
}
