<?php

namespace Models;

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Uniqueness;

class Province extends Model
{
    public $id;

    public $name;

    public $created_at;

    public $updated_at;

//     public function initialize()
//     {
//         $this->setSource("province");
//         $this->hasMany("id", "Models\Contract", "province_id");
//     }

	public function getSource()
    {
        return 'province';
    }
}
