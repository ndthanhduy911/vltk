<?php
namespace Models;

use Models\MenusLang;
use Models\Posts;
use Models\Pages;
use Models\Categories;


class Menus extends \Phalcon\Mvc\Model
{
    public $id;

    public $dept_id;

    public $menu_location_id;
    
    public $type;
    
    public $param_id;

    public $link;

    public $parent_id;
    
    public $sort_other;

    public $module;

    public $controller;

    public $action;

    public $status;

    public $created_at;

    public $updated_at;

    public $deleted;

    public function getSource()
    {
        return 'menus';
    }

    public static function getNamepace (){
        return 'Models\Menus';
    }

    public static function getLink($menu){
        switch ((int)$menu->type) {
            case 1: {
                $post = Posts::findFirstId($menu->post_id);
                return $post ? FRONTEND_URL.'/news/'.$post->slug : '';
                break;
            }    
            case 2: {
                $page = Pages::findFirstId($menu->page_id);
                return $page ? FRONTEND_URL.'/'.$page->slug : '';
                break;
            } 
            case 3: {
                $page = Categories::findFirstId($menu->cat_id);
                return $page ? FRONTEND_URL.'/category/'.$page->slug : '';
                break;
            }   
            case 4: {
                return $menu->link;
                break;
            }        
            default: {
                    return '';
                break;
            }
        }
    }

    public static function getName($menu_id, $lang_id = 1){
        $menu_lang = MenusLang::findFirst(['lang_id =:lang_id: AND menu_id = :menu_id:', 'bind'=>['lang_id' => $lang_id, 'menu_id' => $menu_id]]);
        return $menu_lang ? $menu_lang->name : '';
    }
}