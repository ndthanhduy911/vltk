<?php
namespace Models;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class Method extends \Phalcon\Mvc\Model
{
    public $id;

    public $name;

    public $package_id;

    public $content;

    public $created_at;

    /**
     * Initialize method for model.
     */
    
    public function initialize()
    {
        $this->setSource("method_hint");

    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'method_hint';
    }
}
