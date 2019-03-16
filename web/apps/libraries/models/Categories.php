<?php
use Phalcon\Mvc\Model\Manager as ModelsManager;
class Categories extends \Phalcon\Mvc\Model
{

    public $id;

    public $cat_id;

    public $name;

    public $status;


    public function getSource()
    {
        return 'categories';
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
