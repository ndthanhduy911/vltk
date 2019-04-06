<?php

namespace Frontend\Modules\Pages\Controllers;
use Phalcon\Mvc\View;
use Models\Categories;
class PostsController extends \FrontendController
{
    public function indexAction(){
        $this->view->title = 'Tin tức';
        $this->view->pick('templates/blog');
    }

    public function categoryAction($params = null){
        $slug = $this->helper->slugify($params);
        $category = Categories::findFirst(['slug = :slug:', 'bind' => ['slug' => $slug]]);
        if($category){
            $this->view->title = $category->name;
            $this->view->pick('templates/blog');           
        }else{
            $this->view->title = '404';
            $this->view->pick('templates/404');
        }
    }

    public function singleAction($params = null){
        $slug = $this->helper->slugify($params);
        $this->view->pick('templates/single');
    }
}