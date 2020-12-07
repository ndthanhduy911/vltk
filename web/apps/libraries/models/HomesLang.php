<?php
use Library\Helper\HelperValidation;

class HomesLang extends \Phalcon\Mvc\Model
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("homeslang");
    }

    public function vdUpdate($try = false){
        $helper = new HelperValidation();
        //szedtitle
        $helper->setValidation('max', [
            'name' => 'szedtitle',
            'len' => 255,
            'msg' => 'Tiêu đề không được quá 255 ký tự'
        ]);
        //stafftitle
        $helper->setValidation('max', [
            'name' => 'stafftitle',
            'len' => 255,
            'msg' => 'Tiêu đề lãnh đạo không được quá 255 ký tự'
        ]);
        //staffdes
        $helper->setValidation('max', [
            'name' => 'staffdes',
            'len' => 255,
            'msg' => 'Mô tả lãnh đạo không được quá 255 ký tự'
        ]);

        //partnertitle
        $helper->setValidation('max', [
            'name' => 'partnertitle',
            'len' => 255,
            'msg' => 'Tiêu đề liên kết/ đối tác không được quá 255 ký tự'
        ]);

        //partnerdes
        $helper->setValidation('max', [
            'name' => 'partnerdes',
            'len' => 255,
            'msg' => 'Mô tả liên kết/ đối tác không được quá 255 ký tự'
        ]);

        //contacttitle
        $helper->setValidation('max', [
            'name' => 'contacttitle',
            'len' => 255,
            'msg' => 'Tiêu đề liên hệ không được quá 255 ký tự'
        ]);

        //contactdes
        $helper->setValidation('max', [
            'name' => 'contactdes',
            'len' => 255,
            'msg' => 'Mô tả liên hệ không được quá 255 ký tự'
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