<?php

class TransferPelf extends \Phalcon\Mvc\Model
{

    public $id;

    public $transfer;

    public $properties_id;

    public $department_id;

    public $location_id;

    public $manager_id;

    public $department_id_2;

    public $location_id_2;
    
    public $manager_id_2;

    public $note;

    public $status;

    public $pelf_quantity;

    public $created_at;

    public $updated_at;

    public function getSource()
    {
        return 'transfer_pelf';
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
