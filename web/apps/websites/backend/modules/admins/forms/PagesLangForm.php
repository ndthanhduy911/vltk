<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;

class PagesLangForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $lang = null)
    {
        $title = new Text('title');
        $title->setLabel('<i class="fas fa-book mr-1"></i>Tiêu đề');
        $titleAttr = [
            'class' => "form-control form-control-sm",
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'maxlength' => "255",
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        if(!empty($lang)){
            $titleAttr['name'] = "title[$lang[0]]";
            $titleAttr['id'] = "title".$lang[0];
            if(!$lang[1]){
                $titleAttr['class'] = $titleAttr['class'].' nvali';
            }
        }
        $title->setAttributes($titleAttr);
        $this->add($title);

        $excerpt = new Textarea('excerpt');
        $excerpt->setLabel('<i class="fas fa-tags mr-1"></i> Tóm tắt');
        $excerptAttr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Tóm tắt',
            'maxlength' => "255",
            'data-error' => "Thông tin chưa hợp lệ",
            'rows' => 4
        ];
        if(!empty($lang)){
            $excerptAttr['name'] = "excerpt[$lang[0]]";
            $excerptAttr['id'] = 'excerpt'.$lang[0];
            if(!$lang[1]){
                $excerptAttr['class'] = $excerptAttr['class'].' nvali';
            }
        }
        $excerpt->setAttributes($excerptAttr);
        $this->add($excerpt);
        
        //content
        $content = new Textarea('content');
        $content->setLabel('<i class="fas fa-newspaper mr-1"></i> Nội dung');
        $contentAttr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Nội dung',
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        if(!empty($lang)){
            $contentAttr['name'] = "content[$lang[0]]";
            $contentAttr['id'] = 'content'.$lang[0];
            if(!$lang[1]){
                $contentAttr['class'] = $contentAttr['class'].' nvali';
            }
        }
        $content->setAttributes($contentAttr);
        $this->add($content);
    }
}
