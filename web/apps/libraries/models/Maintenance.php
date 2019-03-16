<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Maintenance extends Model
{

    public $id;

    public $properties_id;

    public $code;

    public $note;

    public $item;

    public $man_type;

    public $man_day;

    public $num_day;

    public $noti_day;

    public $man_name;

    public $man_email;

    public $man_phone;

    public function getSource()
    {
        return 'maintenance';
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
