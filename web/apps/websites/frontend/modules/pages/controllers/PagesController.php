<?php

namespace Frontend\Modules\Pages\Controllers;
use Models\Pages;
use Models\Attributes;
class PagesController extends \FrontendController
{
    public function indexAction($params = null){
        $params = $this->helper->slugify($params);
        $page = Pages::findFirst(['slug = :slug: AND status = 1', 'bind' => ['slug' => $params]]);
        if($page){
            $this->view->title = $page->title;
            $this->view->page = $page;
            if($page->attribute_id){
                if(($attribute = Attributes::findFirst($page->attribute_id))){
                    $this->view->pick('templates/'.$attribute->path);
                }
            }else{
                $this->view->pick('templates/default');
            }            
        }else{
            $this->view->title = '404';
            $this->view->pick('templates/404');
        }
    }
}