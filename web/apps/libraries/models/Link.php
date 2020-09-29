<?php 
class Link extends \Phalcon\Mvc\Model
{
    public function getSource()
    {
        return 'link';
    }

    public static function getName($link_id, $lang_id = 1){
        $menu_lang = \LinkLang::findFirst(['lang_id =:lang_id: AND link_id = :link_id:', 'bind'=>['lang_id' => $lang_id, 'link_id' => $link_id]]);
        return $menu_lang ? $menu_lang->name : '';
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