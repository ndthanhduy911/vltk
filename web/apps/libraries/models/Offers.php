<?php

class Offers extends \Phalcon\Mvc\Model
{
    public $id;

    public $code;

    public $step;

    public $status;

    public $create_date;

    public $department_id;

    public $content;

    public $created_user;

    public $note;

    public $created_at;

    public $updated_at;

    public static function findFirstId($id, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "id = :id:",
            "bind" => array('id' => $id),
            "columns" => $columns,
        ]);
    }

    public function getSource()
    {
        return 'offers';
    }
}
