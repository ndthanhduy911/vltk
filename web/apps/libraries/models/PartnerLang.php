<?php
namespace Models;

class PartnerLang extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $partner_id;
    
    public $lang_id;

    public $name;

    public function getSource()
    {
        return 'partner_lang';
    }

    public static function getNamepace (){
        return 'Models\PartnerLang';
    }
}