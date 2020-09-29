<?php

class Status extends \Phalcon\Mvc\Model
{

    public function getSource()
    {
        return 'status';
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
