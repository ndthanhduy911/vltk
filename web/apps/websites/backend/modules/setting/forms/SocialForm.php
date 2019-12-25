<?php
namespace Backend\Modules\Setting\Forms;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\PresenceOf;

class SocialForm extends Form
{
    public function initialize($entity = null, $options = null)
    {

        $name = new Text('name');
        $name->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Tiêu đề',
            'maxlength' => "200",
        ));
        $name->addValidators(array(
            new StringLength([
                "max" => 200,
                "messageMaximum" => "Tiêu đề không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($name);

        $link = new Text('link');
        $link->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Link',
            'maxlength' => "200",
        ));
        $link->addValidators(array(
            new StringLength([
                "max" => 200,
                "messageMaximum" => "Link không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($link);

        $sort = new Numeric('sort');
        $sort->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Sắp xếp',
        ));
        $this->add($sort);

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

        $status = new Select('status', [
            1 => "Hoạt động",
            0 => "Khóa",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Chọn trạng thái',
            'emptyValue' => '',
            'class' => 'form-control pull-right w-100',
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ]);
        $status->addValidators(array(
            new PresenceOf(array(
                'message' => 'Trạng thái không được để trống.',
            )),
        ));
        $this->add($status);

        $dept_id = new Hidden('dept_id');
        $this->add($dept_id);

        $deleted = new Hidden('deleted');
        $this->add($deleted);
    }
}
