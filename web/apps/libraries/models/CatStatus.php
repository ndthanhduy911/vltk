<?php
class CatStatus extends \ModelCore
{

    public function getSource()
    {
        return 'cat_status';
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
