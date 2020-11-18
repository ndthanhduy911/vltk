<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;

class PostsForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {
        //calendar
        $calendar = new Text('calendar');
        $calendar->setLabel('Ngày đăng');
        $calendar->setAttributes(array(
            'class' => 'form-control form-control-sm singleDateTimePicker',
            'maxlength' => "16",
            'sỉze' => "16",
            'placeholder' => 'Ví dụ: 20/11/2020 12:00',
            // 'pattern' =>"^(0[1-9]|1\d|2\d|3[01])\/(0[1-9]|1[0-2])\/(19|20)\d{2}$",
            // 'data-pattern-error' => "Định đạng không đúng. Chỉ cho phép ngày theo định dạng dd/mm/yyyy",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($calendar);
        
        //slug
        $slug = new Text('slug');
        $slug->setLabel('Slug');
        $slug->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "200",
            'data-error' => "Thông tin chưa hợp lệ",
        ));
        $this->add($slug);

        //catid
        $deptid = isset($_SESSION['deptid']) ? $_SESSION['deptid'] : 0;
        $cats = $this->modelsManager->createBuilder()
        ->columns(array(
            'c.id',
            'cl.name name',
        ))
        ->from(['c'=>"Categories"])
        ->leftJoin('CategoriesLang', "cl.catid = c.id AND cl.langid = 1",'cl')
        ->orderBy('cl.name ASC')
        ->where("c.deptid = {$deptid}")
        ->getQuery()
        ->execute();
        $catid = new Select('catid', $cats, array(
            'using' => array('id', 'name'),
            'class' => 'form-control form-control-sm',
            'data-error' => "Thông tin chưa hợp lệ",
        ));
        $catid->setLabel('Chuyên mục');
        $this->add($catid);

        //status
        $status = new Select('status', [
            1 => "Hoạt động",
            0 => "Khóa",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Chọn trạng thái',
            'emptyValue' => '',
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => 'Vui lòng nhập thông tin',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $status->setLabel('Trạng thái');
        $this->add($status);
        
        //image
        $image = new Hidden('image');
        $this->add($image);
    }
}
