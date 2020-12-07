<?php
use Library\Helper\HelperValidation;

class DeptsLang extends \Phalcon\Mvc\Model
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("deptslang");
    }

    public static function getTitleById($id = null)
    {
        if($dept = parent::findFirst($id)){
            return $dept->name;
        }else{
            return null;
        }
    }

    public function vdUpdate($try = false){
        $helper = new HelperValidation();
        //title
        $helper->setValidation('required', [
            'name' => 'title',
            'msg' => 'Tên khoa/ bộ môn không được để trống'
        ]);
        $helper->setValidation('max', [
            'name' => 'title',
            'len' => 255,
            'msg' => 'Tên khoa/ bộ môn không được quá 255 ký tự'
        ]);
        $helper->setValidation('max', [
            'name' => 'address',
            'len' => 255,
            'msg' => 'Địa chỉ không được quá 255 ký tự'
        ]);
        $helper->setValidation('max', [
            'name' => 'excerpt',
            'len' => 255,
            'msg' => 'Mô tả không được quá 255 ký tự'
        ]);
        if($try){
            if(!$this->validate($helper->getValidation())){
                foreach ($this->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
        }

        return $this->validate($helper->getValidation());
    }
}
