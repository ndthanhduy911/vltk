<?php
namespace Backend\Modules\Master\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Email;

class SyncForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $assetType = \AssetType::getAllTree(0,1);
        $typeid = new Select('typeid', $assetType, array(
            'class' => 'form-control form-control-sm',
            'required' => '',
            'useEmpty'      => true,
            'emptyValue'    => '',
            'emptyText'     => 'Chọn',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Loại tài sản đúng quy định.",
        ));
        $typeid->setLabel('Loại tài sản '.requiredLabel());
        $this->add($typeid);

        $perL = \Library\Master\Master::checkPermissionDepted('backup','sync');
        $deptType = \Depts::getTreeNamePermission($perL);
        $deptid = new Select('deptid', $deptType, array(
            'using' => array('id', 'name'),
            'class' => 'form-control form-control-sm',
            'required' => true,
            // 'useEmpty'      => true,
            // 'emptyValue'    => '0',
            // 'emptyText'     => 'Tất cả',
        ));
        $deptid->setLabel('Bộ môn '.requiredLabel());
        $this->add($deptid);
    }
}