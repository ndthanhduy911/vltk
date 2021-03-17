<?php

namespace Frontend\Modules\Dept\Controllers;

class StaffsController extends \LayoutsController
{
    public $className = \Staffs::class;

    public $classNameLang = \StaffsLang::class;

    public $itemid = 'staffid';

    public $attrid = 2;

    public $title = 'Tổ chức Nhân sự';

    public function indexC($view){
        $view->pick('templates/pages/staffs');
        return $view;
    }

    public function singleAction($slug1 = null, $slug2 = null){
        $slug1 = $this->helper->slugify($slug1);
        $slug2 = $this->helper->slugify($slug2);
        $dept = $this->dept;
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;
        if(!$items = $this->className::findFirst(["status = 1 AND slug = :slug:", 'bind' => ['slug' => $slug]])){
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
        if($this->attrid && $page = \Pages::findFirst(["status = 1 AND deptid = {$dept->id} AND attrid = {$this->attrid}"])){
            $pagelang = \PagesLang::findFirst(["langid = {$this->langid} AND pageid = {$page->id}"]);
            $this->view->lslug = \Pages::getUrl($dept,$page);
            $this->view->ltitle = $pagelang->title;
        }
        $this->view->itemslang = $this->itemslang;
    }
}