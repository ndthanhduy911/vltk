<?php
namespace Models;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class Department extends \Phalcon\Mvc\Model
{

    public $id;

    public $name;

    public $phone;

    public $email;

    public $description;

    public $status;

    public $updated_at;

    /**
     * Initialize method for model.
     */
    
    public function initialize()
    {
        $this->setSource("department");

    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'department';
    }
}
