<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;

class SearchCategoriesForm extends Form{
    public function initialize($entity = null, $options = null){
        //nameSearch
        $nameSearch = new Text('nameSearch');
        $nameSearch->setLabel('Tên chuyên mục');
        $nameSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Tin tức',
            'maxlength' => "100",
            'data-error' => "Thông tin chưa hợp lệ",
            'data-maxlength-error' => "Thông tin không được quá 100 ký tự"
        ));
        $this->add($nameSearch);

        // //parentid
        // $cats = \Categories::getTreeName(0);
        // $parentidSearch = new Select('parentidSearch', $cats, array(
        //     'class' => 'form-control form-control-sm',
        //     'useEmpty'      => true,
        //     'emptyValue'    => '0',
        //     'emptyText'     => 'Tất cả'
        // ));
        // $parentidSearch->setLabel('Trực thộc');
        // $this->add($parentidSearch);

        //statusSearch
        $statusSearch = new Select('statusSearch',[
            1              => "Hoạt động",
            0              => "Khóa",
        ], [
            'class'         => 'form-control form-control-sm',
            'useEmpty'      => true,
            'emptyValue'    => 'all',
            'emptyText'     => 'Tất cả',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $statusSearch->setLabel('Trạng thái');
        $this->add($statusSearch);

        //createdatSearch
        $createdatSearch = new Text('createdatSearch');
        $createdatSearch->setLabel('Ngày tạo');
        $createdatSearch->setAttributes(array(
            'class' => 'form-control form-control-sm date-format singleDatePicker',
            'maxlength' => "10",
            'data-error' => "Thông tin chưa hợp lệ",
            'placeholder' => 'Ví dụ: 20/11/2020'
        ));
        $this->add($createdatSearch);
    }
}
