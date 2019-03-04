<?php
namespace Models;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class Faq extends \Phalcon\Mvc\Model
{
    public $id;

    public $package_id;

    public $ask;

    public $answer;

    public $location;

    public $status;
    
    public $created_at;

    /**
     * Initialize method for model.
     */
    
    public function initialize()
    {
        $this->setSource("faq");

    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'faq';
    }
}
