<?php 
use Library\Helper\HelperValidation;

class CategoriesLang extends \Phalcon\Mvc\Model
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("categorieslang");
    }

    public function getSource()
    {
        return 'categorieslang';
    }

    public function vdUpdate($try = false){
        $helper = new HelperValidation();
        //name
        $helper->setValidation('required', [
            'name' => 'name',
            'msg' => 'Tiêu đề không được để trống'
        ]);
        $helper->setValidation('max', [
            'name' => 'name',
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
