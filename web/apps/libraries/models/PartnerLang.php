<?php
class PartnerLang extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $partner_id;
    
    public $lang_id;

    public $title;

    public function getSource()
    {
        return 'partner_lang';
    }
}