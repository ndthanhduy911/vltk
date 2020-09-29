<?php

class Notification extends \Phalcon\Mvc\Model
{
    public function getSource()
    {
        return 'notification';
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
