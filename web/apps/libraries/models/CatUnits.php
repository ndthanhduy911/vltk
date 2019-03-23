<?php
namespace Models;

class CatUnits extends \Phalcon\Mvc\Model
{

    public $id;

    public $cat_id;

    public $name;

    public $status;

    public $note;

    public function getSource()
    {
        return 'cat_units';
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