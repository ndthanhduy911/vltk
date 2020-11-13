<?php
namespace Backend\Modules\Shared\Forms;

use AssetType;
use AssetUnit;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Check;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Form;

class AssetTypeForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $name = new Text('name');
        $name->setLabel('Tên loại tài sản '.requiredLabel());
        $name->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "100",
            'data-error' => "Tên loại tài sản chưa hợp lệ",
            'required' => '',
            'placeholder' => 'Ví dụ: Trang thiết bị văn phòng - Bàn làm việc',
            'data-required-error' => "Vui lòng nhập thông tin",
        ));
        $this->add($name);
        //gtype
        $type = new Select('type', \AssetGType::findNoDelete("id,name"), array(
            'using' => ['id','name'],
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin không đúng quy định.",
        ));
        $type->setLabel('Phân loại '.requiredLabel());
        $this->add($type);
        //isde
        $isde = new Check('isde');
        $isde->setLabel('Có tính hao mòn tài sản');
        $isde->setAttributes(array(
            'class' => 'custom-control-input',
            'value' => '1',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin không hợp lệ"
        ));
        $this->add($isde);
        //detype
        $deTypeArray = [
            '1' => 'Theo năm',
            '2' => 'Theo tháng',
        ];
        $detype = new Select('detype', $deTypeArray, array(
            'class' => 'form-control form-control-sm',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin không hợp lệ"
        ));
        $detype->setLabel('Tính hao mòn '.requiredLabel());
        $this->add($detype);

        $code = new Text('code');
        $code->setLabel('Mã loại tài sản '.requiredLabel());
        $code->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'size' => "4",
            'maxlength' => "4",
            'data-error' => "Mã loại tài sản phải là chữ IN HOA, có thể kết hợp với số, tối đa 4 ký tự",
            'required' => '',
            'placeholder' => 'Ví dụ: HNN1',
            'data-required-error' => "Vui lòng nhập thông tin",
        ));
        $this->add($code);

        $period = new Numeric('period');
        $period->setLabel('Thời gian tính hao mòn '.requiredLabel());
        $period->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'min' => "1",
            'max' => "1000",
            'data-min-error' => "Thời gian tính hao mòn tối thiểu là 1",
            'data-max-error' => "Thời gian tính hao mòn tối đa là 1000",
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thời gian tính hao mòn phải là số nguyên",
            'placeholder' => 'Ví dụ: 10',
        ));
        $this->add($period);

        $typefactor = new Text('typefactor');
        $typefactor->setLabel('Tỷ lệ tính hao mòn (%) '.requiredLabel());
        $typefactor->setAttributes(array(
            'class' => 'form-control form-control-sm numberCent',
            'data-error' => "Tỷ lệ tính hao mòn (%) phải là số thực",
            'placeholder' => 'Ví dụ: 10',
            'data-required-error' => "Vui lòng nhập thông tin",
            'maxlength' => 5
        ));
        $this->add($typefactor);

        $note = new Text('note');
        $note->setLabel('Ghi chú');
        $note->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Ghi chú',
            'size' => 250,
            'maxlength' => "250",
            'data-maxlength-error' => "Nội dung không được quá 250 ký tự",
        ));
        $this->add($note);
        if(!empty($entity->type)){
            $assetType = AssetType::getTreeName(0,[],'',"--",$entity->type);
        }else{
            $assetType = AssetType::getTreeName(0,[],'',"--",1);
        }

        $parentid = new Select('parentid', $assetType, array(
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Trực thuộc không đúng quy định.",
            'useEmpty'      => true,
            'emptyValue'    => '0',
            'emptyText'     => 'Không có',
        ));
        $parentid->setLabel('Trực thuộc'.requiredLabel());
        $this->add($parentid);

        $unitid = new Select('unitid', AssetUnit::find(["deleted = 0"]), array(
            'using' => array('id', 'name'),
            'class' => 'form-control form-control-sm',
            'data-error' => "Đơn vị tính không đúng quy định.",
            'useEmpty'      => true,
            'emptyValue'    => '0',
            'emptyText'     => 'Không có',
        ));
        $unitid->setLabel('Đơn vị tính');
        $this->add($unitid);

        $d_status = [
            1 => "Hoạt động",
            0 => "Khóa"

        ];
        $status = new Select('status', $d_status, array(
            'class' => 'form-control form-control-sm',
            'data-error' => "Trạng thái đúng quy định.",
        ));
        $status->setLabel('Trạng thái');
        $this->add($status);
    }
}
