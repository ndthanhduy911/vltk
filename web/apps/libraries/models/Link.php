<?php 
class Link extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("link");
    }

    public static function getName($link_id, $langid = 1){
        $menulang = \LinkLang::findFirst(['langid =:langid: AND link_id = :link_id:', 'bind'=>['langid' => $langid, 'link_id' => $link_id]]);
        return $menulang ? $menulang->name : '';
    }
}