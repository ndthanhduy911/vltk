<?php

namespace Models;

use Phalcon\Mvc\Model;

class Package extends Model
{
	public $id;

	public $name;

	public $per_code;

	public $per_time;

	public $time;

	public $note;

	public $status;

	public $created_at;

	public $location;

    public $updated_at;

//    public function initialize()
//    {
//        $this->hasMany("id", "Models\Contract", "package_id");
//    }

	public function getSource()
    {
        return 'package';
    }
}
