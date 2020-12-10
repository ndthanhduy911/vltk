<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;

class PostsForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {
        //status
        $status = new Select('status', [
            1 => "Hoạt động",
            0 => "Khóa",
        ], [
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => 'Vui lòng nhập thông tin',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $status->setLabel('<i class="fas fa-check-circle mr-1"></i>Trạng thái');
        $this->add($status);

        //calendar
        $calendar = new Text('calendar');
        $calendar->setLabel('<i class="fas fa-calendar mr-1"></i>Ngày đăng');
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
        $slug->setLabel('<i class="fas fa-globe mr-1"></i>Slug');
        $slug->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "200",
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($slug);

        //catid
        $perL = \Library\Master\Master::checkPermissionDepted('posts', 'update');
        $cats = $this->modelsManager->createBuilder()
        ->columns([
            'c.id',
            'cl.title'
        ])
        ->from(['c'=>"Categories"])
        ->leftJoin('CategoriesLang', "cl.catid = c.id AND cl.langid = 1",'cl')
        ->where("c.deleted = 0")
        ->orderBy('cl.title ASC');
        $cats = \Library\Master\Master::builderPermission($cats,$perL,'c');
        $cats = $cats->getQuery()
        ->execute();

        $catid = new Select('catid', $cats, array(
            'using' => ['id', 'title'],
            'class' => 'form-control form-control-sm',
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $catid->setLabel('<i class="fas fa-list mr-1"></i>Chuyên mục');
        $this->add($catid);

        //tags
        // $tags = \Tags::find(['deleted = 0']);
        // $tags = new Select('tags', $cats, array(
        //     'using' => ['id', 'name'],
        //     'class' => 'form-control form-control-sm',
        //     'data-error' => "Thông tin chưa hợp lệ",
        // ));
        // $tags->setLabel('Thẻ');
        // $this->add($tags);
        
        //image
        $image = new Hidden('image');
        $image->setLabel('<i class="fas fa-image mr-1"></i>Ảnh đại diện');
        $image->setUserOption('attr','image');
        $this->add($image);
    }
}
