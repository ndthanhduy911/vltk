<?php

namespace Models;

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Uniqueness;

class Permission extends Model
{
    public $id;
    
    public $controller;
    
    public $action;
    
    public $name;

    public $description;

    public $optgroup;

    public $status;

    public $created_at;

    public function initialize(){
        $this->setSource("permission");
    }

	public function getSource(){
        return 'permission';
    }
}