<?php
class Pages extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("pages");
    }

    public function getSource()
    {
        return 'pages';
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