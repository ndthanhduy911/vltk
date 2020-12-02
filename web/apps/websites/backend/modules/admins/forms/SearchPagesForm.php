<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Select;

class SearchPagesForm extends Form
{
    public function initialize($entity = null, $options = null){

        //titleSearch
        $titleSearch = new Text('titleSearch');
        $titleSearch->setLabel('Tiêu đề');
        $titleSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Trang tin tức',
            'maxlength' => "255",
        ));
        $this->add($titleSearch);

        //createdatSearch
        $createdatSearch = new Text('createdatSearch');
        $createdatSearch->setLabel('Ngày đăng');
        $createdatSearch->setAttributes(array(
            'class' => 'form-control form-control-sm date-format singleDatePicker',
            'maxlength' => "10",
            'data-error' => "Ngày đăng chưa hợp lệ",
            'placeholder' => 'Ví dụ: 20/11/2020'
        ));
        $this->add($createdatSearch);

        //statusSearch
        $statusSearch = new Select('statusSearch',[
            1              => "Hoạt động",
            0              => "Khóa",
        ], [
            'class'         => 'form-control form-control-sm',
            'useEmpty'      => true,
            'emptyValue'    => 'all',
            'emptyText'     => 'Tất cả',
        ]);
        $statusSearch->setLabel('Trạng thái');
        $this->add($statusSearch);
    }
}
