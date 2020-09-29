<?php

class Attributes extends \Phalcon\Mvc\Model
{
    public $id;

    public $name;
    
    public $path;

    public $status;

    public $created_at;

    public $updated_at;

    public function getSource()
    {
        return 'attributes';
    }
}