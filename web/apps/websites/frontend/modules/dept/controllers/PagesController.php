<?php

namespace Frontend\Modules\Dept\Controllers;
use Models\Pages;
use Models\Attributes;
use Models\PagesLang;

class PagesController extends \FrontendController
{
    public function indexAction($slug1 = null, $slug2 = null){
        $slug1 = $this->helper->slugify($slug1);
        $slug2 = $this->helper->slugify($slug2);
        $dept = $this->dispatcher->getReturnedValue();
        $lang_id = $this->session->get('lang_id');
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;
        if(!$page = Pages::findFirst(["slug = :slug: AND status = 1 AND dept_id = $dept->id", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        if(!$page_lang = PagesLang::findFirst(["lang_id = $lang_id AND page_id = $page->id"])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        $this->view->title = $page_lang->title;
        $this->view->page = $page;
        $this->view->page_lang = $page_lang;
        if(!$page->attribute_id){
            return $this->view->pick('templates/pages/default');
        }

        if(($attribute = Attributes::findFirst($page->attribute_id))){
            return $this->view->pick('templates/pages/'.$attribute->path);
        }

        return $this->view->pick('templates/pages/default');
    }
}