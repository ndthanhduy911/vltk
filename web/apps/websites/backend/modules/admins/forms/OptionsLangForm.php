<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;

class OptionsLangForm extends \Phalcon\Forms\Form
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
            'data-error' => "Thông tin không hợp lệ"
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

        $address = new Textarea('address');
        $address->setLabel('Địa chỉ');
        $addressAttr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Địa chỉ',
            'maxlength' => "255",
            'data-error' => "Thông tin không hợp lệ",
            'rows' => 4
        ];
        if(!empty($lang)){
            $addressAttr['name'] = "address[$lang[0]]";
            $addressAttr['id'] = 'address'.$lang[0];
            if(!$lang[1]){
                $addressAttr['class'] = $addressAttr['class'].' nvali';
            }
        }
        $address->setAttributes($addressAttr);
        $this->add($address);
    }
}
