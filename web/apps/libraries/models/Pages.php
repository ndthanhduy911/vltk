<?php
class Pages extends \ModelCore
{
    public function getSource()
    {
        return 'pages';
    }

    public static function findFirstId($id, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "id = :id:",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);   
    }

    public static function getUrlById($id = null)
    {
        if($page = parent::findFirst($id)){
            return WEB_URL.'/'.$page->slug;
        }else{
            return null;
        }
    }

    public static function getTitleById($id = null)
    {
        if($page = PagesLang::findFirst(['page_id = :page_id:','bind' => ['page_id' => $id]])){
            return $page->name;
        }else{
            return null;
        }
    }
}