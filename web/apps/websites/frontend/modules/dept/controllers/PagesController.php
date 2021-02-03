<?php

namespace Frontend\Modules\Dept\Controllers;

class PagesController extends \LayoutsController
{
    public $className = \Pages::class;

    public $classNameLang = \PagesLang::class;

    public $itemid = 'pageid';

    public function tempAction($slug1 = null, $slug2 = null){
        $dept = $this->dept;
        $slug1 = $this->helper->slugify($slug1);
        $slug2 = $this->helper->slugify($slug2);
        $slug = $dept->id == 1 ? $slug1 : $slug2;
        if(!$items = $this->className::findFirst(["slug = :slug: AND status = 1 AND deptid = {$dept->id}", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        if(!$itemslang = $this->classNameLang::findFirst(["langid = {$this->langid} AND {$this->itemid} = {$items->id}"])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        $this->items = $items;
        $this->itemslang = $itemslang;

        $this->view->title = $itemslang->title;
        $this->view->slug = $items->slug;
        $this->view->ltitle = null;
        $this->view->lslug = null;
        $this->view->items = $this->items;
        $this->view->itemslang = $this->itemslang;
        if($attr = \Attributes::findFirst($this->items->attrid)){
            $this->view->pick('templates/pages/'.$attr->path);
        }else{
            $this->view->pick('templates/pages/default');
        }
    }
}