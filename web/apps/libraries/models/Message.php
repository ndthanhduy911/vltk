<?php
namespace Models;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class Message extends \Phalcon\Mvc\Model
{
    public $id;

    public $name;

    public $email;

    public $content;

    public $created_at;

    /**
     * Initialize method for model.
     */
    
    public function initialize(){
        $this->setSource("message");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'message';
    }
}
