<?php
class Social extends \Phalcon\Mvc\Model
{
    public function getSource()
    {
        return 'social';
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