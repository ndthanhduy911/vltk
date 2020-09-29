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
                return ($post = Posts::findFirstId($menu->post_id)) ? WEB_URL.($slug != '/' ? '/'.$slug : '')."/news/".$post->slug : '#';
                break;
            }    
            case 2: {
                return ($page = Pages::findFirstId($menu->page_id)) ? WEB_URL.($slug != '/' ? '/'.$slug : '').'/'.$page->slug.'.html' : '#';
                break;
            } 
            case 3: {
                return ($cat = Categories::findFirstId($menu->cat_id)) ? WEB_URL.($slug != '/' ? '/'.$slug : '').'/category/'.$cat->slug : '#';
                break;
            }   
            case 4: {
                return ($dept = Departments::findFirstId($menu->dept)) ? WEB_URL.($slug != '/' ? '/'.$slug : '').'/'.$dept->slug : '#';
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

    public static function getItem($menu , $slug = '', $slug_now = false){
        $item = [
            'actived' => false,
            'link' => ''
        ];

        switch ((int)$menu->type) {
            case 1: {
                $item['link'] = ($post = Posts::findFirstId($menu->post_id)) ? WEB_URL.($slug != '/' ? '/'.$slug : '')."/news/".$post->slug : '#';
                $item['actived'] = (isset($post->slug) ? $post->slug : '#4')  == $slug_now ? true : false;
                break;
            }    
            case 2: {
                $item['link'] = ($page = Pages::findFirstId($menu->page_id)) ? WEB_URL.($slug != '/' ? '/'.$slug : '').'/'.$page->slug.'.html' : '#';
                $item['actived'] = (isset($page->slug) ? $page->slug : '#4') == $slug_now ? true : false;
                break;
            } 
            case 3: {
                $item['link'] = ($cat = Categories::findFirstId($menu->cat_id)) ? WEB_URL.($slug != '/' ? '/'.$slug : '').'/category/'.$cat->slug : '#';
                $item['actived'] = (isset($cat->slug) ? $cat->slug : '#4') == $slug_now ? true : false;
                break;
            }   
            case 4: {
                $item['link'] = ($dept = Departments::findFirstId($menu->dept)) ? ($dept->links?$dept->links:WEB_URL.($slug != '/' ? '/'.$slug : '').'/'.$dept->slug) : '#';
                $item['actived'] = (isset($dept->slug) ? $dept->slug : '#4') == $slug_now ? true : false;
                break;
            } 
            case 5: {
                $item['link'] = $menu->links;
                break;
            }        
            default: {
                $item['link'] = '#';
                break;
            }
        }

        return $item;
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