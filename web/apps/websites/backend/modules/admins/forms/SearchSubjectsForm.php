<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Select;

class SearchSubjectsForm extends Form
{
    public function initialize($entity = null, $options = null){

        //titleSearch
        $titleSearch = new Text('titleSearch');
        $titleSearch->setLabel('Tiêu đề');
        $titleSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Vật lý đại cương',
            'maxlength' => "100",
        ));
        $this->add($titleSearch);

        //codeSearch
        $codeSearch = new Text('codeSearch');
        $codeSearch->setLabel('Mã môn học');
        $codeSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: VLTH00001',
            'maxlength' => "20"
        ));
        $this->add($codeSearch);

        //createdatSearch
        $createdatSearch = new Text('createdatSearch');
        $createdatSearch->setLabel('Ngày đăng');
        $createdatSearch->setAttributes(array(
            'class' => 'form-control form-control-sm date-format singleDatePicker',
            'maxlength' => "10",
            'placeholder' => 'Ví dụ: 20/11/2020',
            'data-error' => "Ngày đăng chưa hợp lệ",
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