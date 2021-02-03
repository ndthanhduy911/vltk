<?php

namespace Frontend\Modules\Dept\Controllers;

class PostsController extends \LayoutsController
{
    public $className = \Posts::class;

    public $classNameLang = \PostsLang::class;

    public $itemid = 'postid';

    public function singleC($view){
        \ConectionSystem::plus(2, $this->dept->id);
        if($cats = \Categories::findFirstIdNoDelete($this->items->catid,'*')){
            $view->ltitle = \Categories::getTitleById($this->items->catid,$this->langid);
            $view->lslug = \Categories::getUrl($this->dept,$cats);
        }
        $view->pick('templates/posts/single');
        return $view;
    }

    public function categoryAction($slug1 = null, $slug2 = null){
        $slug1 = $this->helper->slugify($slug1);
        $slug2 = $this->helper->slugify($slug2);
        $dept = $this->dept;
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;
        if(!$dept->id){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;

        if(!$cat = \Categories::findFirst(["slug = :slug: AND status = 1 AND deptid = $dept->id", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        $paged = (int)$this->request->get('paged','int');
        $posts = $this->modelsManager->createBuilder()
        ->columns(array(
            'p.id',
            'pl.title',
            'p.slug',
            'p.catid',
            'pl.content',
            'p.status',
            'pl.excerpt',
            'p.deptid',
            'p.createdat',
            'p.calendar',
            'p.image',
        ))
        ->from(['p'=>'Posts'])
        ->where("p.deleted = 0 AND p.status = 1 AND p.catid = $cat->id AND p.deptid = $dept->id")
        ->leftJoin('PostsLang', "pl.postid = p.id AND pl.langid = {$this->langid}",'pl')
        ->orderBy("p.calendar DESC");
        $postCount = $posts->getQuery()
        ->execute()
        ->count();

        $posts = $posts->limit(10)
        ->offset(10 * ($paged > 0 ? $paged : 0))
        ->getQuery()
        ->execute();

        $this->view->title = \Categories::getTitleById($cat->id,$this->langid);
        $this->view->ltitle = NULL;
        $this->view->posts = $posts;
        $this->view->pagination = \Posts::createPaging($paged,$postCount);
        $this->view->slug_now = $cat->slug;
        $this->view->pick('templates/posts/blog');   
    }

    public function blogAction($slug = null){
        $slug = $this->helper->slugify($slug);
        $dept = $this->dispatcher->getReturnedValue();
        $langid = $this->session->get('langid');
        $paged = $this->request->get('paged','int');

        $posts = $this->modelsManager->createBuilder()
        ->columns(array(
            'p.id',
            'pl.title',
            'p.slug',
            'p.catid',
            'pl.content',
            'p.status',
            'pl.excerpt',
            'p.deptid',
            'p.createdat',
            'p.calendar',
            'p.image',
        ))
        ->from(['p'=>'Posts'])
        ->leftJoin('PostsLang', "pl.postid = p.id AND pl.langid = {$langid} AND p.deptid = {$dept->id}",'pl')
        ->orderBy("p.calendar DESC")
        ->where("p.deleted = 0 AND p.status = 1");
        
        $postCount = $posts->getQuery()
        ->execute()
        ->count();

        $posts = $posts->limit(10)
        ->offset(10 * ($paged > 0 ? $paged : 0))
        ->getQuery()
        ->execute();

        $this->view->title = $this->ml->_ml('news', "Tin tức");
        $this->view->pagination = \Posts::createPaging($paged,$postCount);
        $this->view->posts = $posts;
        $this->view->pick('templates/blog');   
    }
}