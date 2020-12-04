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
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "255",
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề",
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'specializedtitle');
        $specializedtitle->setAttributes($attr);
        $this->add($specializedtitle);


        $stafftitle = new Text('stafftitle');
        $stafftitle->setLabel('Tiêu đề');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "255",
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề",
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'stafftitle');
        $stafftitle->setAttributes($attr);
        $this->add($stafftitle);

        $staffdes = new Textarea('staffdes');
        $staffdes->setLabel('Tiêu đề');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "255",
            'rows' => 4,
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'staffdes');
        $staffdes->setAttributes($attr);
        $this->add($staffdes);

        $partnertitle = new Text('partnertitle');
        $partnertitle->setLabel('Tiêu đề');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "255",
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề",
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'partnertitle');
        $partnertitle->setAttributes($attr);
        $this->add($partnertitle);


        $partnerdes = new Textarea('partnerdes');
        $partnerdes->setLabel('Tiêu đề');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "255",
            'rows' => 4,
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'partnerdes');
        $partnerdes->setAttributes($attr);
        $this->add($partnerdes);

        $contacttitle = new Text('contacttitle');
        $contacttitle->setLabel('Tiêu đề');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "255",
            'required' => '',
            'data-required-error' => "Vui lòng nhập tiêu đề",
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'contacttitle');
        $contacttitle->setAttributes($attr);
        $this->add($contacttitle);

        $contactdes = new Textarea('contactdes');
        $contactdes->setLabel('Tiêu đề');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "255",
            'rows' => 4,
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'contactdes');
        $contactdes->setAttributes($attr);
        $this->add($contactdes);
    }
}
