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
use Phalcon\Forms\Element\File;
use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Numeric;
use Base\Forms\BaseForm;
use Models\PaymentMethod;

class PaymentForm extends BaseForm
{
    public function initialize($entity = null , $options = null)
    {
        $payment_id = new Hidden('payment_id', array(
            'class' => 'form-control',
            'required' => true,
            'readonly' =>true,
        ));
        $payment_id->setLabel("Payment ID");
        $this->add($payment_id);

        $info_contract = new TextArea('info_contract', array(
            'class' => 'form-control',
            'placeholder' => '',
            'disabled' =>true,
            'rows' => 4,
        ));
        $info_contract->setLabel("Infomation contract");
        $this->add($info_contract);

        $payment_content = new TextArea('payment_content', array(
            'class' => 'form-control',
            'placeholder' => '',
            'rows' => 4,
            'disabled' =>true,
        ));
        $payment_content->setLabel("Payment Contents");
        $this->add($payment_content);

        $note_payment = new TextArea('note_payment', array(
            'class' => 'form-control',
            'placeholder' => '',
            'rows' => 3,
        ));
        $note_payment->setLabel("Note");
        $this->add($note_payment);
    }
}
