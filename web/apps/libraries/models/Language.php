<?php
class Language extends \Phalcon\Mvc\Model
{
    public function initialize(){
        $this->setSource("language");
    }

	public function getSource(){
        return 'language';
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