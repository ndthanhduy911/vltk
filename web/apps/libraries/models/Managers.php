<?php

class Managers extends \Phalcon\Mvc\Model
{

    public $id;

    public $code;

    public $name;

    public $dept_id;

    public $note;

    public $status;

    public function getSource()
    {
        return 'managers';
    }

    public static function findFirstId($id, $columns = "*")
    {
        if($_SESSION['role'] === 1){
            return parent::findFirst([
                "conditions" => "id = :id: AND status != 4",
                "bind" => array('id' => $id),
                "columns" => $columns
            ]);
        }else{
            return parent::findFirst([
                "conditions" => "id = :id: AND status !=4 AND dept_id IN (".implode(',',$_SESSION['department_mg']).")",
                "bind" => array('id' => $id),
                "columns" => $columns
            ]);
        }
    }
}
