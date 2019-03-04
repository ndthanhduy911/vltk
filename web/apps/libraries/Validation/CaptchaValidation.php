<?php
namespace Library\Validation;
use Phalcon\Validation;
use Phalcon\Validation\Message;
use Phalcon\Validation\Validator;
use Phalcon\Validation\ValidatorInterface;

class CaptchaValidation extends Validator implements ValidatorInterface
{
    /**
     * Executes the validation
     *
     * @param Phalcon\Validation $validator
     * @param string $attribute
     * @return boolean
     */
    public function validate(Validation $validator, $attribute)
    {
        $value = $validator->getValue($attribute);
        if ($_SESSION['security_code'] != md5($value)) {
            $message = $this->getOption('message');
            if (!$message) {
                $message = 'Mã xác nhận không đúng';
            }
            $validator->appendMessage(new Message($message, $attribute, 'captcha'));
            return false;
        }
        return true;
    }
    public function getMessages()
    {
        $messages = array();
        foreach (parent::getMessages() as $message) {
            $messages[] = "Mã xác nhận không chính xác";
        }

        return $messages;
    }
}