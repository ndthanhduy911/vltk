<?php

class SubjectsLang extends \Phalcon\Mvc\Model
{
    public function getSource()
    {
        return 'subjects_lang';
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