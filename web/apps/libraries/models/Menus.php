<?php

class Menus extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("menus");
    }

    public function getSource()
    {
        return 'menus';
    }

    public static function getLink($menu , $slug = ''){
        switch ((int)$menu->type) {
            case 1: {
                return ($post = \Posts::findFirstId($menu->postid)) ? WEB_URL.($slug != '/' ? '/'.$slug : '')."/news/".$post->slug : '#';
                break;
            }    
            case 2: {
                return ($page = \Pages::findFirstId($menu->page_id)) ? WEB_URL.($slug != '/' ? '/'.$slug : '').'/'.$page->slug.'.html' : '#';
                break;
            } 
            case 3: {
                return ($cat = \Categories::findFirstId($menu->catid)) ? WEB_URL.($slug != '/' ? '/'.$slug : '').'/category/'.$cat->slug : '#';
                break;
            }   
            case 4: {
                return ($dept = \Depts::findFirstId($menu->dept)) ? WEB_URL.($slug != '/' ? '/'.$slug : '').'/'.$dept->slug : '#';
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
                $item['link'] = ($post = \Posts::findFirstId($menu->postid)) ? WEB_URL.($slug != '/' ? '/'.$slug : '')."/news/".$post->slug : '#';
                $item['actived'] = (isset($post->slug) ? $post->slug : '#4')  == $slug_now ? true : false;
                break;
            }    
            case 2: {
                $item['link'] = ($page = \Pages::findFirstId($menu->page_id)) ? WEB_URL.($slug != '/' ? '/'.$slug : '').'/'.$page->slug.'.html' : '#';
                $item['actived'] = (isset($page->slug) ? $page->slug : '#4') == $slug_now ? true : false;
                break;
            } 
            case 3: {
                $item['link'] = ($cat = \Categories::findFirstId($menu->catid)) ? WEB_URL.($slug != '/' ? '/'.$slug : '').'/category/'.$cat->slug : '#';
                $item['actived'] = (isset($cat->slug) ? $cat->slug : '#4') == $slug_now ? true : false;
                break;
            }   
            case 4: {
                $item['link'] = ($dept = \Depts::findFirstId($menu->dept)) ? ($dept->links?$dept->links:WEB_URL.($slug != '/' ? '/'.$slug : '').'/'.$dept->slug) : '#';
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

    public static function getName($menu_id, $langid = 1){
        $menulang = \MenusLang::findFirst(['langid =:langid: AND menu_id = :menu_id:', 'bind'=>['langid' => $langid, 'menu_id' => $menu_id]]);
        return $menulang ? $menulang->name : '';
    }
}