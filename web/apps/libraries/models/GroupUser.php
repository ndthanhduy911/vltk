<?php

namespace Models;

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Uniqueness;

class GroupUser extends Model
{
    public $id;
    
    public $name;
    
    public $permission_id;

    public $status;
    
    public $created_at;

    public function initialize(){
        $this->setSource("group_user");
    }

	public function getSource(){
        return 'group_user';
    }
}