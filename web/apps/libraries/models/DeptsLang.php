<?php
class DeptsLang extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("depts_lang");
    }

    public function getSource()
    {
        return 'depts_lang';
    }

    public static function getTitleById($id = null)
    {
        if($dept = parent::findFirst($id)){
            return $dept->name;
        }else{
            return null;
        }
    }
}
