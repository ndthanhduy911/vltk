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
use Models\Unit;

class EditSettingEmailForm extends BaseForm
{
    public function initialize($entity = null, $options = null)
    {
        //package name
        $form_name = new Text(
            'form_name',
            array(
                'class' => 'form-control',
                'placeholder'   => 'Tên người gửi',
                'required'      => true,
                'maxlength'     => 255,
                'data-error'    => 'Vui lòng nhập tên người gửi.'
            ));

        $form_name->setLabel("Tên người gửi <strong class=\"text-danger\">*</strong>");
        $this->add($form_name);

        $smtp_name = new Text(
            'smtp_name',
            array(
                'class' => 'form-control',
                'placeholder'   => 'SMTP Host',
                'required'      => true,
                'maxlength'     => 255,
                'data-error'    => 'Vui lòng nhập SMTP Host.'
            ));

        $smtp_name->setLabel("SMTP Host <strong class=\"text-danger\">*</strong>");
        $this->add($smtp_name);

        $email_name = new Text(
            'email_name',
            array(
                'class' => 'form-control',
                'placeholder'   => 'Email',
                'required'      => true,
                'maxlength'     => 255,
                'data-error'    => 'Vui lòng nhập email.'
            ));
        $email_name->setLabel("Email <strong class=\"text-danger\">*</strong>");
        $this->add($email_name);

        $password_email = new Password(
        'password_email',
        array(
            'class' => 'form-control',
            'placeholder'   => 'Mật khẩu',
            'required'      => true,
            'maxlength'     => 255,
            'data-error'    => 'Vui lòng nhập mật khẩu'
        ));

        $password_email->setLabel("Mật khẩu <strong class=\"text-danger\">*</strong>");
        $this->add($password_email);
    }
}
