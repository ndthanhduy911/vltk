<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Select;

class SearchStaffsForm extends Form
{
    public function initialize($entity = null, $options = null){

        //titleSearch
        $titleSearch = new Text('titleSearch');
        $titleSearch->setLabel('Họ & tên');
        $titleSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: GS.TS. CHÂU VĂN TẠO',
            'maxlength' => "100",
        ));
        $this->add($titleSearch);

        //emailSearch
        $emailSearch = new Text('emailSearch');
        $emailSearch->setLabel('E-mail');
        $emailSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: cvtao@hcmus.edu.vn',
            'maxlength' => "100"
        ));
        $this->add($emailSearch);

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
