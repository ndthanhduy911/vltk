<?php

namespace Frontend\Modules\Pages\Controllers;
use Models\Pages;
use Models\Attributes;
class PagesController extends \FrontendController
{
    public function indexAction($params = null){
        $page = Pages::findFirst(['slug = :slug:', 'bind' => ['slug' => $params]]);
        if($page){
            $this->view->title = $page->title;
            if($page->attribute_id){
                if(($attribute = Attributes::findFirst($page->attribute_id))){
                    $this->view->pick('templates/'.$attribute->path);
                }
            }else{
                if(($attribute = Attributes::findFirst($page->attribute_id))){
                    $this->view->pick('templates/default');
                }
            }            
        }else{
            $this->view->title = '404';
            $this->view->pick('templates/404');
        }
    }
}