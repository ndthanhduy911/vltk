<?php
class Staff extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("staff");
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