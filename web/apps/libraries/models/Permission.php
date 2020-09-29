<?php
class Permission extends \Phalcon\Mvc\Model
{
    public function initialize(){
        $this->setSource("permission");
    }

	public function getSource(){
        return 'permission';
    }
}