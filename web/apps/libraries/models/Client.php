<?php
namespace Models;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class Client extends \Phalcon\Mvc\Model
{

    public $id;

    public $name;

    public $department_id;

    public $package_id;

    public $address;

    public $phone;

    public $user_created_id;

    public $email;

    public $avatar;

    public $status;

    public $password;

    public $created_at;

    public $updated_at;

    public function validation()
    {
        $validator = new Validation();

        $validator->add(
            'email',
            new EmailValidator(
                [
                    'model'   => $this,
                    'message' => 'Please enter a correct email address',
                ]
            )
        );

        return $this->validate($validator);
    }

    /**
     * Initialize method for model.
     */
    
    public function initialize()
    {
        $this->setSource("client");

    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'client';
    }
}
