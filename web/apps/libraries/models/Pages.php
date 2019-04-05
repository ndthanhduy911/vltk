<?php

namespace Models;

class Pages extends \Phalcon\Mvc\Model
{
    public $id;

    public $title;
    
    public $slug;

    public $attribute_id;

    public $content;

    public $status;

    public $created_at;

    public $updated_at;

    public function getSource()
    {
        return 'pages';
    }
}