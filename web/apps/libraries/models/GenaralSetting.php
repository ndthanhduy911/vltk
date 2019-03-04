<?php
namespace Models;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class GenaralSetting extends \Phalcon\Mvc\Model
{
    public $id;

    public $name;

    public $value;

    public $created_at;

    public $updated_at;

    /**
     * Initialize method for model.
     */
    
    public function initialize(){
        $this->setSource("genaral_setting");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'genaral_setting';
    }

    static function getNameField($name=null){
        return GenaralSetting::findFirstByName($name);
    }
}
