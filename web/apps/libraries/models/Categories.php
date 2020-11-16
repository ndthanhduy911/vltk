<?php
class Categories extends \Phalcon\Mvc\Model
{
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

    public static function getLang($catid =  null){
        if($cat = \CategoriesLang::findFirst(['catid = :catid: AND langid = :langid:','bind' => ['catid' => $catid, 'langid' => $_SESSION['langid']]])){
            return $cat;
        }else{
            return false;
        }
    }
    
    public static function getTitleById($catid = null){
        if($cat = \CategoriesLang::findFirst(['catid = :catid: AND langid = :langid:','bind' => ['catid' => $catid, 'langid' => $_SESSION['langid']]])){
            return $cat->name;
        }else{
            return false;
        }
    }
}
