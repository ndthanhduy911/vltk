<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 9/16/14
 * Time: 8:11 AM
 */

namespace Backend\Modules\User\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Check;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\email;
use Phalcon\Validation\Validator\Identical;

class FormLogin extends Form
{
    public function initialize()
    {
        //email
        $email = new Text('email' , array(
            'class' => 'forms-control col-xs-12',
            'placeholder' => 'email'
        ));

        $email->addValidators(array(
            new PresenceOf(array(
                'message' => 'Tài khoản bắt buột nhập'
            )),
        ));

        $this->add($email);

        // Password
        $password = new Password('password', array(
            'class' => 'forms-control col-xs-12',
            'placeholder' => 'Password'
        ));

        $password->addValidator(new PresenceOf(array(
            'message' => 'Mật khẩu bắt buộc nhập'
        )));

        $this->add($password);

        // Remember
        $remember = new Check('remember', array(
            'value' => 'yes'
        ));

        $remember->setLabel('Remember me');

        $this->add($remember);

        // CSRF
        $csrf = new Hidden('csrf');

        /*$csrf->addValidator(new Identical(array(
            'value' => $this->security->getSessionToken(),
            'message' => 'CSRF validation failed'
        )));*/

        $this->add($csrf);

        $this->add(new Submit('go', array(
            'class' => 'btn btn-success'
        )));
    }

    public function messages($name)
    {
        if($this->getMessagesFor($name))
        {
            foreach ($this->getMessagesFor($name) as $message)
            {
                $this->flash->error($message);
            }
        }
    }
}