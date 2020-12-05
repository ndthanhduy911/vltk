<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Select;

class SearchSlideshowsForm extends Form
{
    public function initialize($entity = null, $options = null){

        //titleSearch
        $titleSearch = new Text('titleSearch');
        $titleSearch->setLabel('Tiêu đề');
        $titleSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Ngày hội chuyên ngành',
            'maxlength' => "255",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($titleSearch);

        //createdatSearch
        $createdatSearch = new Text('createdatSearch');
        $createdatSearch->setLabel('Ngày đăng');
        $createdatSearch->setAttributes(array(
            'class' => 'form-control form-control-sm date-format singleDatePicker',
            'maxlength' => "10",
            'placeholder' => 'Ví dụ: 20/11/2020',
            'data-error' => "Thông tin chưa hợp lệ"
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
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $statusSearch->setLabel('Trạng thái');
        $this->add($statusSearch);
    }
}
