<?php

namespace Frontend\Modules\Dept\Controllers;

class PagesController extends \FrontendController
{
    public function indexAction($slug1 = null, $slug2 = null){
        $slug1 = $this->helper->slugify($slug1);
        $slug2 = $this->helper->slugify($slug2);
        $dept = $this->dispatcher->getReturnedValue();
        $langid = $this->session->get('langid');
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;
        if(!$page = \Pages::findFirst(["slug = :slug: AND status = 1 AND deptid = $dept->id", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        if(!$pagelang = \PagesLang::findFirst(["langid = $langid AND pageid = $page->id"])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        $this->view->title = $pagelang->title;
        $this->view->page = $page;
        $this->view->slug_now = $page->slug;
        $this->view->pagelang = $pagelang;
        if(!$page->attrid){
            return $this->view->pick('templates/pages/default');
        }

        if(($attribute = \Attributes::findFirst($page->attrid))){
        return $this->view->pick('templates/pages/'.$attribute->path);
        }

        return $this->view->pick('templates/pages/default');
    }
}