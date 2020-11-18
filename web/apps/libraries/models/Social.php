<?php
class Social extends \ModelCore
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