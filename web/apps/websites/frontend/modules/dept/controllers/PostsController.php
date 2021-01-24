<?php

namespace Frontend\Modules\Dept\Controllers;

class PostsController extends \FrontendController
{
    public function indexAction(){

    }

    public function singleAction($slug1 = null, $slug2 = null){
        $slug1 = $this->helper->slugify($slug1);
        $slug2 = $this->helper->slugify($slug2);
        $dept = $this->dispatcher->getReturnedValue();
        $langid = $this->session->get('langid');
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;
        \ConectionSystem::plus(2, $dept->id);
        if(!$post = \Posts::findFirst(["status = 1 AND slug = :slug: AND deptid = $dept->id", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        if($postslang = \PostsLang::findFirst(["langid = $langid AND postid = $post->id"])){
            $this->view->title = $postslang->title;
            $post->content = $postslang->content;
            $post->excerpt = $postslang->excerpt;
            $this->view->post = $post;
            return $this->view->pick('templates/single');
        }
    }

    public function categoryAction($slug1 = null, $slug2 = null){
        $slug1 = $this->helper->slugify($slug1);
        $slug2 = $this->helper->slugify($slug2);
        $dept = $this->dispatcher->getReturnedValue();
        $langid = $this->session->get('langid');
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;
        if(!$dept->id){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;

        if(!$category = \Categories::findFirst(["slug = :slug: AND status = 1 AND deptid = $dept->id", 'bind' => ['slug' => $slug]])){
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
        ->where("p.deleted = 0 AND p.status = 1 AND p.catid = $category->id AND p.deptid = $dept->id")
        ->leftJoin('PostsLang', "pl.postid = p.id AND pl.langid = $langid",'pl')
        ->orderBy("p.calendar DESC");
        $postCount = $posts->getQuery()
        ->execute()
        ->count();

        $posts = $posts->limit(10)
        ->offset(10 * ($paged > 0 ? $paged : 0))
        ->getQuery()
        ->execute();

        $this->view->title = \Categories::getTitleById($category->id);
        $this->view->posts = $posts;
        $this->view->pagination = \Posts::createPaging($paged,$postCount);
        $this->view->slug_now = $category->slug;
        $this->view->pick('templates/blog');   
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