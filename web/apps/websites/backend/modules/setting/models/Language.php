<?php
namespace Backend\Modules\Setting\Models;

class Language extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $name;
    
    public $short_name;
    
    public $path;

    public $icon;

    public $status;

    public $actived;

    public $created_at;

    public $updated_at;

    public function initialize(){
        $this->setSource("permission");
    }

	public function getSource(){
        return 'permission';
    }

    public static function getNamepace (){
        return 'Backend\Modules\Setting\Models\Language';
    }
}