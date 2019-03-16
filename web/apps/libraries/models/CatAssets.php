<?php
class CatAssets extends \Phalcon\Mvc\Model
{
    public $id;

    public $code;

    public $name;

    public $unit_price;

    public $class_id;

    public $species_id;

    public $made_id;

    public $producer_id;

    public $unit_id;

    public $currencies_id;

    public $specification;

    public $note;

    public $status;

    public $created_at;

    public $updated_at;

    public function getSource()
    {
        return 'cat_assets';
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
