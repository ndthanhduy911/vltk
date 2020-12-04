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
        $title->setLabel('<i class="fas fa-user mr-1"></i>Họ & tên');
        $attr = [
            'class' => "form-control form-control-sm",
            'placeholder' => 'Ví dụ: GS.TS. CHÂU VĂN TẠO',
            'required' => '',
            'maxlength' => "255",
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'title');
        $title->setAttributes($attr);
        $this->add($title);
    }
}
