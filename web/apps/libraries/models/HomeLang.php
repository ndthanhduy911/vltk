<?php
namespace Models;

class HomeLang extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $home_id;
    
    public $lang_id;

    public $specialized_title;

    public $staff_title;

    public $staff_des;

    public $partner_title;

    public $partner_des;

    public $contact_title;

    public $contact_des;

    public function getSource()
    {
        return 'home_lang';
    }

    public static function getNamepace (){
        return 'Models\HomeLang';
    }
}