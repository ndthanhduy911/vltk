<?php

namespace Models;

class Logs extends \Phalcon\Mvc\Model
{
    public $id;

    public $user_id;
    
    public $page;

    public $type;

    public $name;

    public $detail;

    public $ip;

    public $device;
    
    public $created_at;

    public function getSource()
    {
        return 'log_history';
    }
}