<?php

namespace Models;

class Posts extends \Phalcon\Mvc\Model
{
    public $id;

    public $title;
    
    public $slug;

    public $cat_id;

    public $content;

    public $excerpt;

    public $status;

    public $dept_id;

    public $calendar;

    public $featured_image;

    public $created_at;

    public $updated_at;

    public function getSource()
    {
        return 'posts';
    }

    public static function getNamepace (){
        return 'Models\Posts';
    }

    public static function findFirstId($id, $columns = "*")
    {
        if($_SESSION['role'] === 1){
            return parent::findFirst([
                "conditions" => "id = :id:",
                "bind" => array('id' => $id),
                "columns" => $columns
            ]);
        }else{
            return parent::findFirst([
                "conditions" => "id = :id: AND dept_id IN (".implode(',',$_SESSION['dept_mg']).")",
                "bind" => array('id' => $id),
                "columns" => $columns
            ]);
        }
    }

    public static function getUrlById($id = null)
    {
        if($post = parent::findFirst($id)){
            return FRONTEND_URL.'/'.$post->slug;
        }else{
            return null;
        }
    }
    
    public static function getTitleById($id = null)
    {
        if($post = parent::findFirst($id)){
            return $post->name;
        }else{
            return null;
        }
    }
}