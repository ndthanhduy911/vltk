<?php
namespace Backend\Modules\Shared\Forms;

use Depts;
use AssetUnit;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Form;

class DeptsForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $name = new Text('name');
        $name->setLabel('Tên đơn vị/ bộ phận '.requiredLabel());
        $name->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "100",
            'size' => "100",
            'required' => '',
            'data-error' => "Tên đơn vị/ bộ phận chưa hợp lệ",
            'placeholder' => 'Ví dụ: Bộ phận Kỹ thuật',
            'data-required-error' => "Vui lòng nhập thông tin",
        ));
        $this->add($name);

        $dcode = new Text('dcode');
        $dcode->setLabel('Mã đơn vị/ bộ phận '.requiredLabel());
        $dcode->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "13",
            'size' => "13",
            'required' => '',
            'data-error' => "Mã đơn vị/ bộ phận chưa hợp lệ",
            'placeholder' => 'Ví dụ: HNN13131',
            'data-required-error' => "Vui lòng nhập thông tin",
        ));
        $this->add($dcode);

        $qhns = new Text('qhns');
        $qhns->setLabel('Mã QHNS');
        $qhns->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "13",
            'size' => "13",
            'data-error' => "Mã QHNS chưa hợp lệ",
            'placeholder' => 'Ví dụ: 12312312',
            'data-required-error' => "Vui lòng nhập thông tin",
        ));
        $this->add($qhns);

        $address = new Text('address');
        $address->setLabel('Địa chỉ');
        $address->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Phòng A Tòa Nhà B',
            'size' => 150
        ));
        $this->add($address);

        $description = new Text('description');
        $description->setLabel('Mô tả');
        $description->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Bộ phận Kỹ thuật',
            'size' => 150
        ));
        $this->add($description);

        $deptType = Depts::getTreeName(0);
        $parentid = new Select('parentid', $deptType, array(
            'class' => 'form-control form-control-sm',
            'data-error' => "Trực thuộc không đúng quy định.",
            'useEmpty'      => true,
            'emptyValue'    => '0',
            'emptyText'     => 'Không có',
        ));
        $parentid->setLabel('Trực thuộc');
        $this->add($parentid);

        $d_dept = [
            1 => "Có",
            0 => "Không"

        ];
        $isdept = new Select('isdept', $d_dept, array(
            'class' => 'form-control form-control-sm',
            'data-error' => "Đơn vị/bộ phận đúng quy định.",
        ));
        $isdept->setLabel('Là đơn vị');
        $this->add($isdept);

        $lat = new Hidden('lat');
        $this->add($lat);

        $lng = new Hidden('lng');
        $this->add($lng);
    }
}
