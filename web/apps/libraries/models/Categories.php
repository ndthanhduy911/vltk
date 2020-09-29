<?php
use Models\CategoriesLang;
class Categories extends \Phalcon\Mvc\Model
{
    public $id;

    public $slug;

    public $status;

    public $dept_id;

    public $author;

    public $featured_image;

    public $created_at;

    public $updated_at;

    public $deleted;



    public function getSource()
    {
        return 'categories';
    }

    public static function findFirstId($id, $columns = "*"){
        return parent::findFirst([
            "conditions" => "id = :id:",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);
    }

    public static function getUrlById($id = null){
        if($cat = parent::findFirst($id)){
            return WEB_URL.'/category/'.$cat->slug;
        }else{
            return null;
        }
    }

    public static function getUrl($dept = NULL, $cat = NULL){
        if($cat && $dept){
            return WEB_URL.($dept->id != 1 ? "/$dept->slug" : '' ).'/category/'.$cat->slug;
        }else{
            return '';
        }
    }

    public static function getLang($cat_id =  null){
        if($cat = CategoriesLang::findFirst(['cat_id = :cat_id: AND lang_id = :lang_id:','bind' => ['cat_id' => $cat_id, 'lang_id' => $_SESSION['lang_id']]])){
            return $cat;
        }else{
            return false;
        }
    }
    
    public static function getTitleById($cat_id = null){
        if($cat = CategoriesLang::findFirst(['cat_id = :cat_id: AND lang_id = :lang_id:','bind' => ['cat_id' => $cat_id, 'lang_id' => $_SESSION['lang_id']]])){
            return $cat->name;
        }else{
            return false;
        }
    }
}
