<?php
namespace Backend\Modules\Admins\Forms;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Form;

class StaffsLangForm extends Form
{
    public function initialize($entity = null, $lang = null)
    {
        $title = new Text('title');
        $title->setLabel('Họ & tên');
        $titleAttr = [
            'class' => "form-control form-control-sm",
            'placeholder' => 'Ví dụ: GS.TS. CHÂU VĂN TẠO',
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
    }
}
