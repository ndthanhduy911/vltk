<?php
use Phalcon\Mvc\Model\Manager as ModelsManager;
class CatSupplieres extends \Phalcon\Mvc\Model
{
    public $id;

    public $cat_id;

    public $name;

    public $address;

    public $phone;

    public $email;

    public $website;

    public $mstdn;

    public $career;

    public $note;

    public $status;


    public function getSource()
    {
        return 'cat_supplieres';
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
