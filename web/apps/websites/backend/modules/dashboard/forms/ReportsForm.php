<?php
namespace Backend\Modules\Dashboard\Forms;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\File;

class ReportsForm extends Form{
    public function initialize($entity = null, $options = null){
        $perL = \Library\Master\Master::checkPermissionDepted('reports','index');
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

        $deptid1 = new Select('deptid1', $deptType, array(
            'using' => array('id', 'name'),
            'class' => 'form-control form-control-sm',
            'required' => true,
            'useEmpty'      => true,
            'emptyValue'    => '0',
            'emptyText'     => 'Tất cả',
        ));
        $deptid1->setLabel('Bộ môn '.requiredLabel());
        $this->add($deptid1);

        $year = new Text('year');
        $year->setLabel('Năm báo cáo '.requiredLabel());
        $year->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: 2020',
            'required' => true,
            'size' => "4",
            'maxlength' => '4',
            'minlength' => '4',
            'data-maxlength-error' => "Thông tin không được quá 4 ký tự",
            'data-error' => "Thông tin không hợp lệ",
        ));
        $this->add($year);

        //typefile
        $typefile = new Select('typefile',[
            1              => "EXCEL",
            // 2              => "PDF",
        ], [
            'class'         => 'form-control form-control-sm',
        ]);
        $typefile->setLabel('Hình thức báo cáo '.requiredLabel());
        $this->add($typefile);

        //typeid
        $assetType = \AssetType::getAllTree();
        $typeid = new Select('typeid', $assetType, array(
            'class' => 'form-control form-control-sm',
            'required' => true,
            'useEmpty'      => true,
            'emptyValue'    => '0',
            'emptyText'     => 'Tất cả',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Loại tài sản đúng quy định.",
        ));
        $typeid->setLabel('Loại tài sản '.requiredLabel());
        $this->add($typeid);

        //typeid1
        $assetType1 = \AssetType::getAllTree(0,1);
        $typeid1 = new Select('typeid1', $assetType1, array(
            'class' => 'form-control form-control-sm',
            'required' => true,
            'useEmpty'      => true,
            'emptyValue'    => '0',
            'emptyText'     => 'Tất cả',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Loại tài sản đúng quy định.",
        ));
        $typeid1->setLabel('Loại tài sản '.requiredLabel());
        $this->add($typeid1);

        //typeid2
        $assetType2 = \AssetType::getAllTree(0,2);
        $typeid2 = new Select('typeid2', $assetType2, array(
            'class' => 'form-control form-control-sm',
            'required' => true,
            'useEmpty'      => true,
            'emptyValue'    => '0',
            'emptyText'     => 'Tất cả',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Loại tài sản đúng quy định.",
        ));
        $typeid2->setLabel('Loại tài sản '.requiredLabel());
        $this->add($typeid2);

        $name = new Text('name');
        $name->setLabel('Tiêu đề báo cáo '.requiredLabel());
        $name->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Sổ theo dõi TSCĐ tại nơi sử dụng',
            'required' => true,
            'size' => "100",
            'maxlength' => '100',
            'data-maxlength-error' => "Thông tin không được quá 100 ký tự",
            'data-error' => "Thông tin không hợp lệ",
        ));
        $this->add($name);

        $icon = new Text('icon');
        $icon->setLabel('Biểu tượng');
        $icon->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: fas fa-address-book',
            'size' => "30",
            'maxlength' => '30',
            'data-maxlength-error' => "Thông tin không được quá 30 ký tự",
            'data-error' => "Thông tin không hợp lệ",
        ));
        $this->add($icon);

        $des = new Text('des');
        $des->setLabel('Mô tả '.requiredLabel());
        $des->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: ',
            'required' => true,
            'size' => "250",
            'maxlength' => '250',
            'data-maxlength-error' => "Thông tin không được quá 100 ký tự",
            'data-error' => "Thông tin không hợp lệ",
        ));
        $this->add($des);

        $image = new File('image');
        $image->setLabel('Ảnh đại diện');
        $image->setAttributes(array(
            'class' => 'form-control form-control-sm',
            "multiple" => true,
            'accept' => '.png,.jpg,.jgeg'
        ));
        $this->add($image);
    }
}
