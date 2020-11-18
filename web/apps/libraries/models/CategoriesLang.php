<?php 
class CategoriesLang extends \Phalcon\Mvc\Model
{

    public function getSource()
    {
        return 'categorieslang';
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
