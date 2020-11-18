<?php
class Staff extends \ModelCore
{
    public function getSource()
    {
        return 'staff';
    }

    public static function findFirstId($id, $columns = "*")
    {
        
        return parent::findFirst([
            "conditions" => "id = :id:",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);
    }

    public static function getUrl($dept, $staff = NULL)
    {
        if($dept->id == 1){
            return WEB_URL.'/staff/'.$staff->slug;
        }else{
            return WEB_URL."/$dept->slug".'/staff/'.$staff->slug;
        }
    }
}