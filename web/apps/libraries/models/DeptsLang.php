<?php
class DeptsLang extends \Phalcon\Mvc\Model
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("deptslang");
    }

    public function getSource()
    {
        return 'deptslang';
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
