<?php

class Notification extends \Phalcon\Mvc\Model
{

    public $id;

    public $type;

    public $content;

    public $link;

    public $viewed;

    public $status;

    public $created_at;


    public function getSource()
    {
        return 'notification';
    }

    public static function findFirstId($id, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "id = :id: AND status !=4",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);
    }
}
