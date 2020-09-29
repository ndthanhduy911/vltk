<?php

class PagesLang extends \Phalcon\Mvc\Model
{
    public function getSource()
    {
        return 'pages_lang';
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