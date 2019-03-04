<?php

namespace Models;

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Uniqueness;

class User extends Model
{
    public $id;

    public $department_id;
    
    public $email;
    
    public $password;
    
    public $fullname;

    public $address;

    public $mobile;

    public $package_id;

    public $avatar;
    
    public $status;
    
    public $created_at;

    public function initialize()
    {
        $this->setSource("user");
    }

	public function getSource()
    {
        return 'user';
    }

	public function isActive(){
        return $this->status == '1' ? true : false;
    }
}