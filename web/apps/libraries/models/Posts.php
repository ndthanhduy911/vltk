<?php

namespace Models;
use Models\PostsLang;
class Posts extends \Phalcon\Mvc\Model
{
    public $id;

    public $slug;

    public $cat_id;

    public $status;

    public $dept_id;

    public $calendar;

    public $featured_image;

    public $created_at;

    public $updated_at;
    
    public $deleted;

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
            return false;
        }
    }

    public static function getLang($post_id =  null){
        if($post = PostsLang::findFirst(['post_id = :post_id: AND lang_id = :lang_id:','bind' => ['post_id' => $post_id, 'lang_id' => $_SESSION['lang_id']]])){
            return $post;
        }else{
            return false;
        }
    }
    
    public static function getTitleById($post_id = null)
    {
        if($post = PostsLang::findFirst(['post_id = :post_id: AND lang_id = :lang_id:','bind' => ['post_id' => $post_id, 'lang_id' => $_SESSION['lang_id']]])){
            return $post->name;
        }else{
            return false;
        }
    }

    public static function getUrl($dept = NULL, $post = NULL)
    {
        if($post && $dept){
            return FRONTEND_URL.($dept->id != 1 ? "/$dept->slug" : '' ).'/news/'.$post->slug;
        }else{
            return '';
        }
    }
}