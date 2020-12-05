<?php 
class Links extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("links");
    }

    public static function getName($linkid, $langid = 1){
        $menulang = \LinksLang::findFirst(['langid =:langid: AND linkid = :linkid:', 'bind'=>['langid' => $langid, 'linkid' => $linkid]]);
        return $menulang ? $menulang->title : '';
    }
}