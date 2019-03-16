<?php

class Transfers extends \Phalcon\Mvc\Model
{

    public $id;

    public $code;

    public $transfer_date;

    public $end_date;

    public $recovery_num;

    public $handover_num;

    public $department_id;

    public $department_id_2;

    public $note;

    public $status;

    public $created_at;

    public $updated_at;

    public function getSource()
    {
        return 'transfers';
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
