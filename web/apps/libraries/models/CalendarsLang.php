<?php

class CalendarsLang extends \Phalcon\Mvc\Model
{

    public function getSource()
    {
        return 'calendarslang';
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