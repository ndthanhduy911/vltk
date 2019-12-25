<?php
namespace Backend\Modules\Setting\Forms;


use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\PresenceOf;
use Models\Categories;
use Models\Departments;
use Models\MenuLocation;
use Models\Menus;
use Models\Pages;
use Models\Posts;

class MenusForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $dept_id = isset($_SESSION['dept_id']) ? $_SESSION['dept_id'] : 0;
        $npMenu = Menus::getNamepace();
        $menus = $this->modelsManager->createBuilder()
        ->columns(array(
            $npMenu.'.id',
            'ML.name name',
        ))
        ->from($npMenu)
        ->where("$npMenu.dept_id = $dept_id AND $npMenu.parent_id is NULL")
        ->join('Models\MenusLang', "ML.menu_id = $npMenu.id AND ML.lang_id = 1",'ML')
        ->getQuery()
        ->execute();

        $npCat = Categories::getNamepace();
        $cats = $this->modelsManager->createBuilder()
        ->columns(array(
            $npCat.'.id',
            'CL.name name',
        ))
        ->from($npCat)
        ->where("$npCat.dept_id = $dept_id")
        ->join('Models\CategoriesLang', "CL.cat_id = $npCat.id AND CL.lang_id = 1",'CL')
        ->orderBy('CL.name ASC')
        ->getQuery()
        ->execute();

        $npDept = Departments::getNamepace();
        $depts = $this->modelsManager->createBuilder()
        ->columns(array(
            $npDept.'.id',
            'DL.name name',
        ))
        ->from($npDept)
        ->join('Models\DepartmentsLang', "DL.dept_id = $npDept.id AND DL.lang_id = 1",'DL')
        ->getQuery()
        ->execute();

        $npPages = Pages::getNamepace();
        $pages = $this->modelsManager->createBuilder()
        ->columns(array(
            $npPages.'.id',
            'PL.title title',
        ))
        ->from($npPages)
        ->where("$npPages.dept_id = $dept_id")
        ->join('Models\PagesLang', "PL.page_id = $npPages.id AND PL.lang_id = 1",'PL')
        ->getQuery()
        ->execute();

        $npPosts = Posts::getNamepace();
        $posts = $this->modelsManager->createBuilder()
        ->columns(array(
            $npPosts.'.id',
            'PL.title title',
        ))
        ->from($npPosts)
        ->where("$npPosts.dept_id = $dept_id")
        ->join('Models\PostsLang', "PL.post_id = $npPosts.id AND PL.lang_id = 1",'PL')
        ->getQuery()
        ->execute();

        $menu_location_id = new Select('menu_location_id', MenuLocation::find(["dept_id = $dept_id"]), array(
            'using' => array('id', 'name'),
            'class' => 'form-control',
            'useEmpty' => true,
            'emptyText' => 'Chọn vị trí menu',
            'emptyValue' => '',
            'data-error' => "Chưa đúng định dạng",
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ));
        $menu_location_id->addValidators(array(
            new PresenceOf(array(
                'message' => 'Vị trí menu không được để trống',
            )),
        ));
        $this->add($menu_location_id);

        $type = new Select('type', [
            1 => "Bài viết",
            2 => "Trang",
            3 => "Danh mục",
            4 => "Bộ môn",
            5 => "Link",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Chọn loại menu',
            'emptyValue' => '',
            'class' => 'form-control',
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ]);
        $type->addValidators(array(
            new PresenceOf(array(
                'message' => 'Loại menu không được để trống.',
            )),
        ));
        $this->add($type);

        $post_id = new Select('post_id', $posts, array(
            'using' => array('id', 'title'),
            'class' => 'form-control',
            'useEmpty' => true,
            'emptyText' => 'Chọn bài viết',
            'emptyValue' => '',
            'data-error' => "Chưa đúng định dạng",
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ));
        $this->add($post_id);

        $page_id = new Select('page_id', $pages, array(
            'using' => array('id', 'title'),
            'class' => 'form-control',
            'useEmpty' => true,
            'emptyText' => 'Chọn trang',
            'emptyValue' => '',
            'data-error' => "Chưa đúng định dạng",
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ));
        $this->add($page_id);

        $cat_id = new Select('cat_id', $cats, array(
            'using' => array('id', 'name'),
            'class' => 'form-control',
            'useEmpty' => true,
            'emptyText' => 'Chọn danh mục',
            'emptyValue' => '',
            'data-error' => "Chưa đúng định dạng",
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ));
        $this->add($cat_id);

        $dept = new Select('dept', $depts, array(
            'using' => array('id', 'name'),
            'class' => 'form-control',
            'useEmpty' => true,
            'emptyText' => 'Chọn bộ môn',
            'emptyValue' => '',
            'data-error' => "Chưa đúng định dạng",
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ));
        $this->add($dept);

        $links = new Text('links');
        $links->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Link',
            'maxlength' => "200",
        ));
        $links->addValidators(array(
            new StringLength([
                "max" => 200,
                "messageMaximum" => "Link không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($links);

        $icon = new Select('icon', [
            'fa-graduation-cap' => '<i class="fa fa-graduation-cap" aria-hidden="true"></i>',
            'fa-fa-user' => '<i class="fa fa-fa-user" aria-hidden="true"></i>',
            'fa-share-alt' => '<i class="fa fa-share-alt" aria-hidden="true"></i>',
            'fa-joomla' => '<i class="fa fa-joomla" aria-hidden="true"></i>',
            'fa-th-list' => '<i class="fa fa-th-list" aria-hidden="true"></i>',
            'fa-american-sign-language-interpreting' => '<i class="fa fa-american-sign-language-interpreting" aria-hidden="true"></i>',
            'fa-assistive-listening-systems' => '<i class="fa fa-assistive-listening-systems" aria-hidden="true"></i>',
            'fa-tasks' => '<i class="fa fa-tasks" aria-hidden="true"></i>',
            'fa-sort-desc' => '<i class="fa fa-sort-desc" aria-hidden="true"></i>',
            'fa-sort-asc' => '<i class="fa fa-sort-asc" aria-hidden="true"></i>',
            'fa-thumbs-o-up' => '<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>',
            'fa-search' => '<i class="fa fa-search" aria-hidden="true"></i>',
            'fa-rss' => '<i class="fa fa-rss" aria-hidden="true"></i>',
            'fa-print' => '<i class="fa fa-print" aria-hidden="true"></i>',
            'fa-picture-o' => '<i class="fa fa-picture-o" aria-hidden="true"></i>',
            'fa-cog' => '<i class="fa fa-cog" aria-hidden="true"></i>',
            'fa-eye' => '<i class="fa fa-eye" aria-hidden="true"></i>',
            'fa-youtube-play' => '<i class="fa fa-youtube-play" aria-hidden="true"></i>',
            'fa-language' => '<i class="fa fa-language" aria-hidden="true"></i>',
            'fa-facebook-square' => '<i class="fa fa-facebook-square" aria-hidden="true"></i>',
            'fa-google-plus' => '<i class="fa fa-google-plus" aria-hidden="true"></i>',
            'fa-link' => '<i class="fa fa-link" aria-hidden="true"></i>',
            'fa-paper-plane' => '<i class="fa fa-paper-plane" aria-hidden="true"></i>',
            'fa-times' => '<i class="fa fa-times" aria-hidden="true"></i>',
            'fa-bell' => '<i class="fa fa-bell" aria-hidden="true"></i>',
            'fa-envelope' => '<i class="fa fa-envelope" aria-hidden="true"></i>',
            'fa-folder' => '<i class="fa fa-folder" aria-hidden="true"></i>',
            'fa-users' => '<i class="fa fa-users" aria-hidden="true"></i>',
            'fa-history' => '<i class="fa fa-history" aria-hidden="true"></i>',
            'fa-lock' => '<i class="fa fa-lock" aria-hidden="true"></i>',
            'fa-trophy' => '<i class="fa fa-trophy" aria-hidden="true"></i>',
            'fa-thumb-tack' => '<i class="fa fa-thumb-tack" aria-hidden="true"></i>',
            'fa-thumbs-down' => '<i class="fa fa-thumbs-down" aria-hidden="true"></i>',
            'fa-undo' => '<i class="fa fa-undo" aria-hidden="true"></i>'
        ], [
            'useEmpty' => true,
            'emptyText' => 'Chọn biểu tượng',
            'emptyValue' => '',
            'class' => 'form-control',
        ]);
        $this->add($icon);

        $target = new Select('target', [
            '0' => "_self",
            '1' => "_blank",
            '2' => "_parent",
            '3' => "_top",
            
        ], [
            'class' => 'form-control',
        ]);
        $this->add($target);

        $parent_id = new Select('parent_id', $menus, array(
            'using' => array('id', 'name'),
            'class' => 'form-control',
            'useEmpty' => true,
            'emptyText' => 'Không',
            'emptyValue' => NULL,
            'data-error' => "Chưa đúng định dạng",
        ));
        $this->add($parent_id);

        $sort = new Numeric('sort');
        $sort->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Sắp xếp',
            'maxlength' => "100",
        ));
        $this->add($sort);

        $status = new Select('status', [
            1 => "Hoạt động",
            0 => "Khóa",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Chọn trạng thái',
            'emptyValue' => '',
            'class' => 'form-control',
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ]);
        $status->addValidators(array(
            new PresenceOf(array(
                'message' => 'Trạng thái không được để trống.',
            )),
        ));
        $this->add($status);

        $deleted = new Hidden('deleted');
        $this->add($deleted);

        $dept_id = new Hidden('dept_id');
        $this->add($dept_id);
    }
}
