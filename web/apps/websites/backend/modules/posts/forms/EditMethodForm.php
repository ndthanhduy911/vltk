<?php
namespace Backend\Modules\Dashboard\Forms;

use Library\Helper\Helper;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Check;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Radio;
use Phalcon\Validation\Validator\Digit as DigitValidator;
use Phalcon\Forms\Element\File;
use Phalcon\Validation\Validator\Email;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Confirmation;
use Phalcon\Validation\Validator\Between;
use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Base\Forms\BaseForm;
use Library\Common as LibraryCommon;

use Models\Package;

class EditMethodForm extends BaseForm
{
    public function initialize($entity = null, $options = null)
    {
        //package name
        $packageName = new Text(
        'name',
        array(
            'class' => 'form-control',
            'placeholder'   => 'Tên phương thức',
            'required'      => true,
            'maxlength'     => 255,
            'data-error'    => 'Vui lòng nhập tên phương thức.'
        ));

        $packageName->setLabel("Tên phương thức <strong class=\"text-danger\">*</strong>");
        $this->add($packageName);

        //status
        $package_id = new Select('package_id',Package::find(), [
            'using'         => array('id', 'name'),
            'class'         => 'form-control',
            'useEmpty'      => true,
            'emptyText'     => 'Chọn...',
            'emptyValue'     => '',
            'required'      => true,
            'data-error'    => 'Vui lòng chọn dịch vụ.'
        ]);
        $package_id->setLabel("Dịch vụ <strong class=\"text-danger\">*</strong>");
        $this->add($package_id);

        //contnet
        $contnet = new TextArea('content',
        array(
            'class'         => 'form-control',
            'placeholder'   => 'Nội dung',
            'required'      => true,
            "rows"          => 5,
            'data-error'    => 'Vui lòng nhập nội dung phương thức'
        ));
        $contnet->setLabel("Nội dung<strong class=\"text-danger\">*</strong>");
        $this->add($contnet);
    }
}
