<?php
namespace Backend\Modules\Shared\Forms;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;

class SearchEmployeeForm extends Form{
    public function initialize($entity = null, $options = null){
        //nameSearch
        $nameSearch = new Text('nameSearch');
        $nameSearch->setLabel('Tên nhân viên');
        $nameSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Nguyễn Văn A',
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

        $perL = \Library\Master\Master::checkPermissionDepted('employee','index');
        $deptType = \Depts::getTreeNamePermission($perL);
        $deptidSearch = new Select('deptidSearch', $deptType, array(
            'class' => 'form-control form-control-sm',
            'useEmpty'      => true,
            'emptyValue'    => 'all',
            'emptyText'     => 'Tất cả'
        ));
        $deptidSearch->setLabel('Đơn vị/bộ phận');
        $this->add($deptidSearch);

        //packgeSearch
        $paged = new Hidden('paged');
        $paged->setAttributes(array('id' => null));
        $this->add($paged);
    }
}
