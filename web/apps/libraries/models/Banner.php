<?php
class Banner extends \Phalcon\Mvc\Model
{
    public $id;

    public $dept_id;

    public $image;
    
    public $button_link;

    public $sort;

    public $created_at;
    
    public $updated_at;

    public $status;

    public $deleted;

    public function getSource()
    {
        return 'banner';
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