<?php

namespace Models;

use Phalcon\Mvc\Model;

class Notification extends Model
{
	public $id;

	public $name;

	public $user_id;

	public $type_user;

	public $view;

	public $created_at;

	public $support_id;

//    public function initialize()
//    {
//        $this->hasMany("id", "Models\Contract", "package_id");
//    }

	public function getSource()
    {
        return 'notification';
    }
}
