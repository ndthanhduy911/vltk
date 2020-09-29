<?php 
class CategoriesLang extends \Phalcon\Mvc\Model
{

    public function getSource()
    {
        return 'categories_lang';
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
