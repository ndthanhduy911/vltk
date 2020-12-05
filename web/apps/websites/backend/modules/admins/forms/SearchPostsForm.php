<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Select;

class SearchPostsForm extends Form
{
    public function initialize($entity = null, $options = null){

        //titleSearch
        $titleSearch = new Text('titleSearch');
        $titleSearch->setLabel('Tiêu đề');
        $titleSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: Lịch thi mới nhất',
            'maxlength' => "100",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($titleSearch);

        //catidSearch
        $deptid = isset($_SESSION['deptid']) ? $_SESSION['deptid'] : 0;
        $cats = $this->modelsManager->createBuilder()
        ->columns(array(
            'c.id',
            'cl.title name',
        ))
        ->from(['c'=>"Categories"])
        ->leftJoin('CategoriesLang', "cl.catid = c.id AND cl.langid = 1",'cl')
        ->orderBy('cl.title ASC')
        ->where("c.deptid = {$deptid}")
        ->getQuery()
        ->execute();
        $catidSearch = new Select('catidSearch', $cats, array(
            'class' => 'form-control form-control-sm',
            'using' => ['id','name'],
            'useEmpty'      => true,
            'emptyValue'    => 'all',
            'emptyText'     => 'Tất cả',
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $catidSearch->setLabel('Chuyên mục');
        $this->add($catidSearch);

        //calendarSearch
        $calendarSearch = new Text('calendarSearch');
        $calendarSearch->setLabel('Ngày đăng');
        $calendarSearch->setAttributes(array(
            'class' => 'form-control form-control-sm date-format singleDatePicker',
            'maxlength' => "10",
            'data-error' => "Ngày tạo chưa hợp lệ",
            'placeholder' => 'Ví dụ: 20/11/2020',
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($calendarSearch);

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
