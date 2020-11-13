<?php
namespace Backend\Modules\Master\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Form;


class SyncDetailForm extends Form
{
    public function initialize($entity = null, $options = null)
    {

        //UP
        $aunumber = new Text('aunumber');
        $aunumber->setLabel('Số chứng từ '.requiredLabel());
        $aunumber->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "15",
            'size' => "15",
            'placeholder' => 'Ví du: GT00001',
            'required' => '',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin không hợp lệ"
        ));
        $this->add($aunumber);

        //audate
        $audate = new Text('audate');
        $audate->setLabel('Ngày chứng từ '.requiredLabel());
        $audate->setAttributes(array(
            'class' => 'form-control form-control-sm singleDatePicker',
            'maxlength' => "10",
            'size' => "10",
            'required' => '',
            'placeholder' => 'Ví dụ: 15/05/2020',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin không hợp lệ"
        ));
        $this->add($audate);
        
        $name = new Text('name');
        $name->setLabel('Tên tài sản '.requiredLabel());
        $name->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "100",
            'size' => "100",
            'required' => '',
            'placeholder' => 'Ví dụ: Tài sản A',
            'data-error' => "Thông tin không hợp lệ",
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-maxlength-error' => "Thông tin không được quá 100 ký tự"
        ));
        $this->add($name);

        //specifications
        $specifications = new Text('specifications');
        $specifications->setLabel('Mô tả (Quy cách, thông số kỹ thuật)');
        $specifications->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "255",
            'size' => "255",
            'data-error' => "Nội dung không hợp lệ",
            'placeholder' => 'Ví dụ: (Quy cách, thông số kỹ thuật)'
        ));
        $this->add($specifications);

        $madeid = new Select('madeid', \AssetMadeIn::find(['deleted =0', 'columns' => 'id,name']), array(
            'using' => array('id', 'name'),
            'class' => 'form-control form-control-sm',
            'useEmpty'      => true,
            'emptyValue'    => '0',
            'emptyText'     => 'Chọn',
        ));
        $madeid->setLabel('Nước sản xuất');
        $this->add($madeid);

        $usedyear = new Text('usedyear');
        $usedyear->setLabel('Năm sử dụng');
        $usedyear->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "4",
            'size' => '4',
            'data-error' => "Thông tin không hợp lệ",
            'placeholder' => 'Ví dụ: 2020',
            'data-maxlength-error' => "Thông tin không được quá 4 ký tự",

        ));
        $this->add($usedyear);

        $code = new Text('code');
        $code->setLabel('Mã tài sản '.requiredLabel());
        $code->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "15",
            'size' => "15",
            'required' => '',
            'placeholder' => 'Ví dụ: MTS00001',
            'data-error' => "Thông tin không hợp lệ",
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-maxlength-error' => "Thông tin không được quá 15 ký tự"
        ));
        $this->add($code);


        $costs = new Text('costs');
        $costs->setLabel('Nguyên giá');
        $costs->setAttributes(array(
            'class' => 'form-control form-control-sm numberPrice',
            'placeholder' => '0',
            'data-error' => "Thông tin không hợp lệ",
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-maxlength-error' => "Thông tin không được quá 100 ký tự"
        ));
        $this->add($costs);

        //disfactor
        $disfactor = new Text('disfactor');
        $disfactor->setLabel('Tỷ lệ tính khấu hao (%)');
        $disfactor->setAttributes(array(
            'class' => 'form-control form-control-sm numberCent',
            'data-error' => "Nội dung không hợp lệ",
            'placeholder' => 'VD: 10.00',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin không hợp lệ"
        ));
        $this->add($disfactor);

        //defactor
         $defactor = new Text('defactor');
         $defactor->setLabel('Tỷ lệ tính hao mòn (%)');
         $defactor->setAttributes(array(
             'class' => 'form-control form-control-sm numberCent',
             'data-error' => "Nội dung không hợp lệ",
             'placeholder' => 'VD: 10.00',
             'data-required-error' => "Vui lòng nhập thông tin",
             'data-error' => "Thông tin không hợp lệ"
         ));
         $this->add($defactor);

        $discosts = new Text('discosts');
        $discosts->setLabel('Giá trị khấu hao');
        $discosts->setAttributes(array(
            'class' => 'form-control form-control-sm numberPrice',
            'placeholder' => '0',
            'data-required-error' => "Vui lòng nhập thông tin",
        ));
        $this->add($discosts);

        $decosts = new Text('decosts');
        $decosts->setLabel('Giá trị hao mòn');
        $decosts->setAttributes(array(
            'class' => 'form-control form-control-sm numberPrice',
            'placeholder' => '0',
            'data-required-error' => "Vui lòng nhập thông tin",
        ));
        $this->add($decosts);

        $restcosts = new Text('restcosts');
        $restcosts->setLabel('Giá trị còn lại ghi giảm');
        $restcosts->setAttributes(array(
            'class' => 'form-control form-control-sm numberPrice',
            'placeholder' => '0',
            'data-required-error' => "Vui lòng nhập thông tin",
        ));
        $this->add($restcosts);

        $ddcosts = new Text('ddcosts');
        $ddcosts->setLabel('Tổng giá trị khấu hao(hao mòn)');
        $ddcosts->setAttributes(array(
            'class' => 'form-control form-control-sm numberPrice',
            'placeholder' => '0',
            'data-required-error' => "Vui lòng nhập thông tin",
        ));
        $this->add($ddcosts);

        //accumulated
        $accumulated = new Text('accumulated');
        $accumulated->setLabel('Tổng hao mòn, khấu hao lũy kế');
        $accumulated->setAttributes(array(
            'class' => 'form-control form-control-sm numberPrice',
            'maxlength' => "27",
            'size' => "27",
            'data-error' => "Nội dung không hợp lệ",
            'placeholder' => 'Tổng hao mòn,khấu hao tính đến ngày thêm TS vào hệ thống',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin không hợp lệ"
        ));
        $this->add($accumulated);

        //UP
        $renumber = new Text('renumber');
        $renumber->setLabel('Số chứng từ ghi giảm');
        $renumber->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "15",
            'size' => "15",
            'placeholder' => 'Ví du: GT00001',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin không hợp lệ"
        ));
        $this->add($renumber);

        //redate
        $redate = new Text('redate');
        $redate->setLabel('Ngày chứng từ ghi giảm');
        $redate->setAttributes(array(
            'class' => 'form-control form-control-sm singleDatePicker',
            'maxlength' => "10",
            'size' => "10",
            'placeholder' => 'Ví dụ: 15/05/2020',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin không hợp lệ"
        ));
        $this->add($redate);

        $rereason = new Text('rereason');
        $rereason->setLabel('Lý do ghi giảm');
        $rereason->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "150",
            'size' => '150',
            'data-error' => "Thông tin không hợp lệ",
            'placeholder' => 'Ví dụ: Thanh lý',
            'data-maxlength-error' => "Thông tin không được quá 150 ký tự",

        ));
        $this->add($rereason);
    }
}
