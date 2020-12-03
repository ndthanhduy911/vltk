<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Form;

class HomesLangForm extends Form
{
    public function initialize($entity = null, $lang = null)
    {
        $specializedtitle = new Text('specializedtitle');
        $specializedtitle->setLabel('Tiêu đề');
        $specializedtitleAttr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "255",
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề",
            'data-error' => "Tiêu đề không đúng quy định.",
        ];
        if(!empty($lang)){
            $specializedtitleAttr['name'] = "specializedtitle[$lang[0]]";
            $specializedtitleAttr['id'] = "specializedtitle".$lang[0];
            if(!$lang[1]){
                $specializedtitleAttr['class'] = $specializedtitleAttr['class'].' nvali';
            }
        }
        $specializedtitle->setAttributes($specializedtitleAttr);
        $this->add($specializedtitle);


        $stafftitle = new Text('stafftitle');
        $stafftitle->setLabel('Tiêu đề');
        $stafftitleAttr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "255",
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề",
            'data-error' => "Tiêu đề không đúng quy định.",
        ];
        if(!empty($lang)){
            $stafftitleAttr['name'] = "stafftitle[$lang[0]]";
            $stafftitleAttr['id'] = "stafftitle".$lang[0];
            if(!$lang[1]){
                $stafftitleAttr['class'] = $stafftitleAttr['class'].' nvali';
            }
        }
        $stafftitle->setAttributes($stafftitleAttr);
        $this->add($stafftitle);

        $staffdes = new Textarea('staffdes');
        $staffdes->setLabel('Tiêu đề');
        $staffdesAttr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "255",
            'rows' => 4,
            'data-error' => "Tiêu đề không đúng quy định.",
        ];
        if(!empty($lang)){
            $staffdesAttr['name'] = "staffdes[$lang[0]]";
            $staffdesAttr['id'] = "staffdes".$lang[0];
            if(!$lang[1]){
                $staffdesAttr['class'] = $staffdesAttr['class'].' nvali';
            }
        }
        $staffdes->setAttributes($staffdesAttr);
        $this->add($staffdes);

        $partnertitle = new Text('partnertitle');
        $partnertitle->setLabel('Tiêu đề');
        $partnertitleAttr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "255",
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề",
            'data-error' => "Tiêu đề không đúng quy định.",
        ];
        if(!empty($lang)){
            $partnertitleAttr['name'] = "partnertitle[$lang[0]]";
            $partnertitleAttr['id'] = "partnertitle".$lang[0];
            if(!$lang[1]){
                $partnertitleAttr['class'] = $partnertitleAttr['class'].' nvali';
            }
        }
        $partnertitle->setAttributes($partnertitleAttr);
        $this->add($partnertitle);


        $partnerdes = new Textarea('partnerdes');
        $partnerdes->setLabel('Tiêu đề');
        $partnerdesAttr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "255",
            'rows' => 4,
            'data-error' => "Tiêu đề không đúng quy định.",
        ];
        if(!empty($lang)){
            $partnerdesAttr['name'] = "partnerdes[$lang[0]]";
            $partnerdesAttr['id'] = "partnerdes".$lang[0];
            if(!$lang[1]){
                $partnerdesAttr['class'] = $partnerdesAttr['class'].' nvali';
            }
        }
        $partnerdes->setAttributes($partnerdesAttr);
        $this->add($partnerdes);

        $contacttitle = new Text('contacttitle');
        $contacttitle->setLabel('Tiêu đề');
        $contacttitleAttr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "255",
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề",
            'data-error' => "Tiêu đề không đúng quy định.",
        ];
        if(!empty($lang)){
            $contacttitleAttr['name'] = "contacttitle[$lang[0]]";
            $contacttitleAttr['id'] = "contacttitle".$lang[0];
            if(!$lang[1]){
                $contacttitleAttr['class'] = $contacttitleAttr['class'].' nvali';
            }
        }
        $contacttitle->setAttributes($contacttitleAttr);
        $this->add($contacttitle);

        $contactdes = new Textarea('contactdes');
        $contactdes->setLabel('Tiêu đề');
        $contactdesAttr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "255",
            'rows' => 4,
            'data-error' => "Tiêu đề không đúng quy định.",
        ];
        if(!empty($lang)){
            $contactdesAttr['name'] = "contactdes[$lang[0]]";
            $contactdesAttr['id'] = "contactdes".$lang[0];
            if(!$lang[1]){
                $contactdesAttr['class'] = $contactdesAttr['class'].' nvali';
            }
        }
        $contactdes->setAttributes($contactdesAttr);
        $this->add($contactdes);
    }
}
