<?php
class StaffLang extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $staff_id;
    
    public $lang_id;

    public $title;

    public $content;

    public function getSource()
    {
        return 'staff_lang';
    }
}