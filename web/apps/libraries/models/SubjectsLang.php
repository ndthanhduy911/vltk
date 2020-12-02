<?php
use Library\Helper\HelperValidation;
class SubjectsLang extends \Phalcon\Mvc\Model
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("subjectslang");
    }

    public function vdUpdate($try = false){
        $helper = new HelperValidation();
        //title
        $helper->setValidation('required', [
            'name' => 'title',
            'msg' => 'Tiêu đề không được để trống'
        ]);
        $helper->setValidation('max', [
            'name' => 'title',
            'len' => 255,
            'msg' => 'Tiêu đề không được quá 255 ký tự'
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