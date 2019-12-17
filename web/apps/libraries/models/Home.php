<?php
namespace Models;



class Home extends \Phalcon\Mvc\Model
{
    public $id;
    
    public $dept_id;

    public $cat_list;

    public $post_number;

    public $specialized_bg;
    
    public $partner_bg;

    public function getSource()
    {
        return 'home';
    }

    public static function getNamepace (){
        return 'Models\Home';
    }
}