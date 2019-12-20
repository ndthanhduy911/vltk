<?php
namespace Models;

use Models\MenusLang;
use Models\Posts;
use Models\Pages;
use Models\Categories;
use Models\Departments;


class Menus extends \Phalcon\Mvc\Model
{
    public $id;

    public $dept_id;

    public $menu_location_id;
    
    public $type;
    
    public $post_id;

    public $page_id;

    public $cat_id;
    
    public $dept;

    public $links;

    public $icon;

    public $parent_id;

    public $sort;

    public $target;

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

    public static function getLink($menu , $slug = ''){
        switch ((int)$menu->type) {
            case 1: {
                return ($post = Posts::findFirstId($menu->post_id)) ? FRONTEND_URL.($slug ? '/'.$slug : '')."/news/".$post->slug : '#';
                break;
            }    
            case 2: {
                return ($page = Pages::findFirstId($menu->page_id)) ? FRONTEND_URL.($slug ? '/'.$slug : '').'/'.$page->slug.'.html' : '#';
                break;
            } 
            case 3: {
                return ($cat = Categories::findFirstId($menu->cat_id)) ? FRONTEND_URL.($slug ? '/'.$slug : '').'/category/'.$cat->slug : '#';
                break;
            }   
            case 4: {
                return ($dept = Departments::findFirstId($menu->dept)) ? FRONTEND_URL.($slug ? '/'.$slug : '').'/'.$dept->slug : '#';
                break;
            } 
            case 5: {
                return $menu->links;
                break;
            }        
            default: {
                return '#';
                break;
            }
        }
    }

    public static function getName($menu_id, $lang_id = 1){
        $menu_lang = MenusLang::findFirst(['lang_id =:lang_id: AND menu_id = :menu_id:', 'bind'=>['lang_id' => $lang_id, 'menu_id' => $menu_id]]);
        return $menu_lang ? $menu_lang->name : '';
    }

    public static function findFirstId($id, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "id = :id:",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);
    }
}