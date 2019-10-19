<?php
namespace Models;

class DepartmentsLang extends \Phalcon\Mvc\Model
{

    public $id;

    public $dept_id;

    public $lang_id;

    public $name;


    public function getSource()
    {
        return 'departments_lang';
    }

    public static function findFirstId($id, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "id = :id: AND status = 1",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);
    }

    public static function getTitleById($id = null)
    {
        if($dept = parent::findFirst($id)){
            return $dept->name;
        }else{
            return null;
        }
    }
}
