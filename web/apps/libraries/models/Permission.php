<?php
class Permission extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $controller;
    
    public $action;
    
    public $name;

    public $description;

    public $optgroup;

    public $status;

    public $created_at;

    public function initialize(){
        $this->setSource("permission");
    }

	public function getSource(){
        return 'permission';
    }
}