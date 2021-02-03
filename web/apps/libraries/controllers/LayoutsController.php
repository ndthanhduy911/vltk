<?php
class LayoutsController extends \FrontendController
{
    public $items = null;

    public $itemslang = null;

    public $className = null;

    public $classNameLang = null;

    public $itemid = null;

    public $attrid = null;

    public $title = null;

    public function indexAction(){
        $dept = $this->dept;
        $itemslang = false;
        if($items = \Pages::findFirst(["status = 1 AND deptid = {$dept->id} AND attrid = {$this->attrid}"])){
            $itemslang = \PagesLang::findFirst(["langid = {$this->langid} AND pageid = {$items->id}"]);
        }
        $this->items = $items;
        $this->itemslang = $itemslang;
        $this->view->title = $itemslang ? $itemslang->title : $this->title;
        $this->view->ltitle = NULL;
        $this->view->lslug = NULL;
        $this->view->items = $this->items;
        $this->view->itemslang = $this->itemslang;
        $this->view = $this->indexC($this->view);
    }

    public function singleAction($slug1 = null, $slug2 = null){
        $slug1 = $this->helper->slugify($slug1);
        $slug2 = $this->helper->slugify($slug2);
        $dept = $this->dept;
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;
        if(!$items = $this->className::findFirst(["status = 1 AND slug = :slug: AND deptid = {$dept->id}", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        if(!$itemslang = $this->classNameLang::findFirst(["langid = {$this->langid} AND {$this->itemid} = $items->id"])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        $this->items = $items;
        $this->itemslang = $itemslang;
        $this->view->title = $itemslang->title;
        $this->view->slug = $items->slug;
        $this->view->items = $this->items;
        $this->view->ltitle = null;
        $this->view->lslug = null;
        if($page = \Pages::findFirst(["status = 1 AND deptid = {$dept->id} AND attrid = {$this->attrid}"])){
            $pagelang = \PagesLang::findFirst(["langid = {$this->langid} AND pageid = {$page->id}"]);
            $this->view->lslug = \Pages::getUrl($dept,$page);
            $this->view->ltitle = $pagelang->title;
        }
        $this->view->itemslang = $this->itemslang;
        $view = $this->singleC($this->view);
        $this->view = $view;
    }

    // =================================
    // FUNCTION
    // =================================

    public function indexC($view){
        $view->pick('templates/index');
        return $view;
    }

    public function singleC($view){
        $view->pick('templates/single');
        return $view;
    }
}
