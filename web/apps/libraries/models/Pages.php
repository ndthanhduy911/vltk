<?php

namespace Models;

use Models\PagesLang;

class Pages extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $slug;

    public $attribute_id;

    public $status;

    public $dept_id;

    public $created_at;

    public $updated_at;

    public $featured_image;

    public $background_image;

    public $deleted;

    public function getSource()
    {
        return 'pages';
    }

    public static function getNamepace (){
        return 'Models\Pages';
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
            return FRONTEND_URL.'/'.$page->slug;
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