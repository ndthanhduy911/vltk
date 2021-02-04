<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Form;

class ClassesLangForm extends Form
{
    public function initialize($entity = null, $lang = null)
    {
        $title = new Text('title');
        $title->setLabel('<i class="fas fa-book mr-1"></i>Tiêu đề');
        $attr = [
            'class' => "form-control form-control-sm",
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'maxlength' => "255",
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'title');
        $title->setAttributes($attr);
        $this->add($title);

        $excerpt = new Textarea('excerpt');
        $excerpt->setLabel('<i class="fas fa-tags mr-1"></i>Tóm tắt');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Tóm tắt',
            'maxlength' => "255",
            'data-error' => "Thông tin chưa hợp lệ",
            'rows' => 4
        ];
        $attr = cFL($attr,$lang,'excerpt');
        $excerpt->setAttributes($attr);
        $this->add($excerpt);

        //content
        $content = new Textarea('content');
        $content->setLabel('<i class="fas fa-newspaper mr-1"></i> Nội dung');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Nội dung',
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'content');
        $content->setUserOption('attr','editor');
        $content->setAttributes($attr);
        $this->add($content);

        //files
        $files = new Hidden('files');
        $files->setUserOption('attr','import');
        $this->add($files);
    }
}