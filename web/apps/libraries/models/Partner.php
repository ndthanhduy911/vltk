<?php
class Partner extends \Phalcon\Mvc\Model
{
    public function getSource()
    {
        return 'partner';
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