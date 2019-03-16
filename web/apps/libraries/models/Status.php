<?php

class Status extends \Phalcon\Mvc\Model
{

    public $code;

    public $name;

    public function initialize()
    {
        $this->hasMany('code', 'Properties', 'status', ['alias' => 'Properties']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'status';
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
