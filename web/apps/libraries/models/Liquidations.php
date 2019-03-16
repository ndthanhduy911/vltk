<?php

class Liquidations extends\ Phalcon\ Mvc\ Model {

    public $id;

    public $code;
    
    public $liquidate_date;

    public $type;

    public $cause;

    public $end_date;

    public $liquidate_num;

    public $note;

    public $status;

    public $created_at;

    public $updated_at;

    function getSource() {
        return 'liquidations';
    }

    public static
    function findFirstId($id, $columns = "*") {
        return parent::findFirst([
            "conditions" => "id = :id:",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);
    }

}
