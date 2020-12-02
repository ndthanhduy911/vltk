<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;

class SlideshowsLangForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $lang = null)
    {
        $name = new Text('name');
        $name->setLabel('Tiêu đề');
        $nameAttr = [
            'class' => "form-control form-control-sm",
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'maxlength' => "255",
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Tiêu đề không đúng quy định."
        ];
        if(!empty($lang)){
            $nameAttr['name'] = "name[$lang[0]]";
            $nameAttr['id'] = "name".$lang[0];
            if(!$lang[1]){
                $nameAttr['class'] = $nameAttr['class'].' nvali';
            }
        }
        $name->setAttributes($nameAttr);
        $this->add($name);

        $description = new Textarea('description');
        $description->setLabel('Mô tả');
        $descriptionAttr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Mô tả',
            'maxlength' => "255",
            'data-error' => "Mô tả không đúng quy định.",
            'rows' => 4
        ];
        if(!empty($lang)){
            $descriptionAttr['name'] = "description[$lang[0]]";
            $descriptionAttr['id'] = 'description'.$lang[0];
            if(!$lang[1]){
                $descriptionAttr['class'] = $descriptionAttr['class'].' nvali';
            }
        }
        $description->setAttributes($descriptionAttr);
        $this->add($description);
    }
}
