<?php

namespace Models;

use Phalcon\Mvc\Model;

class Emails extends Model
{
	public $id;

	public $users;

	public $person_from;

	public $title;

	public $person_to;

	public $content;

	public $created_at;


	public function getSource()
    {
        return 'emails';
    }
}
