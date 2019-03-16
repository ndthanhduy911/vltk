<?php

class LiquidationPelf extends \Phalcon\Mvc\Model
{

    public $id;

    public $liquidation_id;

    public $properties_id;

    public $note;

    public $status;

    public $pelf_quantity;

    public $created_at;

    public $updated_at;

    public function getSource()
    {
        return 'liquidation_pelf';
    }

    public static function findFirstId($id, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "id = :id:",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);
    }
}
