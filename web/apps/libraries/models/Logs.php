<?php

namespace Models;
use Phalcon\Mvc\Model;

class Logs extends Model
{
    public $id;
    public $type;
    public $page;
    public $name;
    public $detail;
    public $user_id;
    public $created_at;
    public $ip;
    public $device;
    public function getSource()
    {
        return 'log_history';
    }
}