<?php
namespace Models;

class Research extends \Phalcon\Mvc\Model
{
    public $id;

    public $dept_id;

    public $slug;

    public $email;

    public $featured_image;

    public $created_at;
    
    public $updated_at;

    public $status;

    public $sort;

    public $deleled;

    public function getSource()
    {
        return 'subject';
    }

    public static function getNamepace (){
        return 'Models\Research';
    }

    public static function findFirstId($id, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "id = :id:",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);
    }

    public static function getUrl($dept, $subject = NULL)
    {
        if($dept->id !== 1){
            return FRONTEND_URL.'/subject/'.$subject->slug;
        }else{
            return FRONTEND_URL."/$dept->slug".'/subject/'.$subject->slug;
        }
    }
}