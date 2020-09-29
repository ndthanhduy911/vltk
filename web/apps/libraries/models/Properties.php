<?php

class Properties extends \Phalcon\Mvc\Model
{
    public static function findFirstId($id, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "id = :id:",
            "bind" => array('id' => $id),
            "columns" => $columns,
        ]);
    }

    public function getSource()
    {
        return 'properties';
    }
}
