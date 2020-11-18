<?php 
class Link extends \Phalcon\Mvc\Model
{
    public function getSource()
    {
        return 'link';
    }

    public static function getName($link_id, $langid = 1){
        $menulang = \LinkLang::findFirst(['langid =:langid: AND link_id = :link_id:', 'bind'=>['langid' => $langid, 'link_id' => $link_id]]);
        return $menulang ? $menulang->name : '';
    }

    public static function findFirstId($id, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "id = :id:",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);
    }
}