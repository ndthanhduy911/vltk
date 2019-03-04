<?php
namespace Models;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class Ticket extends \Phalcon\Mvc\Model
{
    public $id;

    public $package_id;

    public $name;

    public $number;

    /**
     * Initialize method for model.
     */
    
    public function initialize()
    {
        $this->setSource("ticket");

    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'ticket';
    }
}
