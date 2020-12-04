<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Form;
class MenusForm extends Form
{
    public function initialize($entity = null, $options = null)
    {

        //name
        $name = new Text('name');
        $name->setLabel('Tiêu đề');
        $name->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví du: Tin tức',
            'maxlength' => "200",
            'data-required-error' => 'Vui lòng nhập thông tin',
            'data-error' => "Thông tin chưa hợp lệ",
        ));
        $this->add($name);

        $deptid = isset($_SESSION['deptid']) ? $_SESSION['deptid'] : 0;
        $menus = \Menus::findParents($deptid);
        //parentid
        $parentid = new Select('parentid', $menus, [
            'using' => ['id','name'],
            'useEmpty' => true,
            'emptyText' => 'Không',
            'emptyValue' => 0,
            'class' => 'form-control form-control-sm',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $parentid->setLabel('Trực thuộc');
        $this->add($parentid);

        //type
        $type = new Select('type', [
            1 => "Bài viết",
            2 => "Trang",
            3 => "Danh mục",
            4 => "Bộ môn",
            5 => "Link",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Chọn',
            'emptyValue' => '',
            'class' => 'form-control form-control-sm',
            'data-required-error' => 'Vui lòng nhập thông tin',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $type->setLabel('Trạng thái');
        $this->add($type);

        //postid
        $postid = new Select('postid', [], [
            'useEmpty' => true,
            'emptyText' => 'Chọn',
            'emptyValue' => '',
            'disabled' => "",
            'class' => 'form-control form-control-sm',
            'data-required-error' => 'Vui lòng nhập thông tin',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $postid->setLabel('Bài viết');
        $this->add($postid);

        //pageid
        $pageid = new Select('pageid', [], [
            'useEmpty' => true,
            'emptyText' => 'Chọn',
            'emptyValue' => '',
            'disabled' => "",
            'class' => 'form-control form-control-sm',
            'data-required-error' => 'Vui lòng nhập thông tin',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $pageid->setLabel('Trang thông tin');
        $this->add($pageid);

        //catid
        $catid = new Select('catid', [], [
            'useEmpty' => true,
            'emptyText' => 'Chọn',
            'emptyValue' => '',
            'disabled' => "",
            'class' => 'form-control form-control-sm',
            'data-required-error' => 'Vui lòng nhập thông tin',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $catid->setLabel('Chuyên mục');
        $this->add($catid);

        //dept
        $dept = new Select('dept', [], [
            'useEmpty' => true,
            'emptyText' => 'Chọn',
            'emptyValue' => '',
            'disabled' => "",
            'class' => 'form-control form-control-sm',
            'data-required-error' => 'Vui lòng nhập thông tin',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $dept->setLabel('Bộ môn');
        $this->add($dept);

        //links
        $links = new Text('links');
        $links->setLabel('Links');
        $links->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví du: https://phys.hcmus.edu.vn',
            'maxlength' => "200",
            'disabled' => "",
            'data-required-error' => 'Vui lòng nhập thông tin',
            'data-error' => "Thông tin chưa hợp lệ"
        ));
        $this->add($links);

        //status
        $status = new Select('status', [
            1 => "Hoạt động",
            0 => "Khóa",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Chọn trạng thái',
            'emptyValue' => '',
            'class' => 'form-control form-control-sm',
            'data-required-error' => 'Vui lòng nhập thông tin',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $status->setLabel('Trạng thái');
        $this->add($status);

        //icon
        $icon = new Select('icon', [], [
            'useEmpty' => true,
            'emptyText' => 'Chọn',
            'emptyValue' => '',
            'class' => 'form-control form-control-sm',
            'data-required-error' => 'Vui lòng nhập thông tin',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $icon->setLabel('Biểu tượng');
        $this->add($icon);

        //target
        $target = new Select('target', [
            0 => "Mặc định",
            1 => "Mở Tab mới"
        ], [
            'useEmpty' => true,
            'emptyText' => 'Chọn',
            'emptyValue' => '',
            'class' => 'form-control form-control-sm',
            'data-error' => "Thông tin chưa hợp lệ"
        ]);
        $target->setLabel('Mở liên kết');
        $this->add($target);

        //sort
        $sort = new Numeric('sort');
        $sort->setLabel('Sắp xếp');
        $sort->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Sắp xếp',
            'maxlength' => "999",
        ));
        $this->add($sort);
    }
}
