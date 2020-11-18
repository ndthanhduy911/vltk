<?php

class PagesLang extends \Phalcon\Mvc\Model
{
    public function getSource()
    {
        return 'pageslang';
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