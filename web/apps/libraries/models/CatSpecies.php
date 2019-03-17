<?php
namespace Models;

class CatSpecies extends \Phalcon\Mvc\Model
{

    public $id;

    public $cat_id;

    public $class_id;

    public $name;

    public $info;

    public $status;

    public $note;

    public function getSource()
    {
        return 'cat_species';
    }

    public static function findFirstId($id, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "id = :id: AND status !=4",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);
    }
}
