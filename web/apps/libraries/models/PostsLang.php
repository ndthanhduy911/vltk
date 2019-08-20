<?php

namespace Models;

class PostsLang extends \Phalcon\Mvc\Model
{
    public $id;

    public $post_id;

    public $title;
    
    public $slug;

    public $content;

    public $excerpt;

    public $lang_id;

    public function getSource()
    {
        return 'posts_lang';
    }

    public static function getNamepace (){
        return 'Models\PostsLang';
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
    
    public static function getTitleById($post_id = null)
    {
        if($post = parent::findFirst(['post_id = :id: AND lang_id = 1', 'bind' => ['id' => $id]])){
            return $post->name;
        }else{
            return null;
        }
    }
}