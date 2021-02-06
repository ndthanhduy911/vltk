<?php

class Tags extends \ModelCore{
    
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("tags");
    }

    public static function getTitleById($id = null)
    {
        if($tags = \TagsLang::findFirst(['tagid = :tagid:','bind' => ['tagid' => $id]])){
            return $tags->title;
        }else{
            return null;
        }
    }

    public static function getUrl($dept = NULL, $tag = NULL)
    {
        if($tag && $dept){
            return WEB_URL.($dept->id != 1 ? "/{$dept->slug}" : '' ).'/the/'.$tag->slug;
        }else{
            return '#';
        }
    }
}