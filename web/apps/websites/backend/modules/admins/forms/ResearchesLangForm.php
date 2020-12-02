<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Form;

class ResearchesLangForm extends Form
{
    public function initialize($entity = null, $lang = null)
    {
        $title = new Text('title');
        $title->setLabel('Tiêu đề');
        $titleAttr = [
            'class' => "form-control form-control-sm",
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'maxlength' => "255",
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Tiêu đề không đúng quy định."
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
        $excerpt->setLabel('Tóm tắt');
        $excerptAttr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Tóm tắt',
            'maxlength' => "255",
            'data-error' => "Tóm tắt không đúng quy định.",
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
    }
}
