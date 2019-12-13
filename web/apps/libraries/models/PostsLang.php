<?php

namespace Models;

class PostsLang extends \Phalcon\Mvc\Model
{
    public $id;

    public $post_id;

    public $title;

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
}