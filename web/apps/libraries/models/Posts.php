<?php
class Posts extends \Phalcon\Mvc\Model
{
    public function getSource()
    {
        return 'posts';
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
            return WEB_URL.'/'.$post->slug;
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
            return WEB_URL.($dept->id != 1 ? "/$dept->slug" : '' ).'/news/'.$post->slug;
        }else{
            return '';
        }
    }
}