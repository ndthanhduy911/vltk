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
        $lang_id = $this->session->get('lang_id');
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;
        \ConectionSystem::plus(2, $dept->id);
        if(!$post = \Posts::findFirst(["status = 1 AND slug = :slug: AND dept_id = $dept->id", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        if($posts_lang = \PostsLang::findFirst(["lang_id = $lang_id AND post_id = $post->id"])){
            $this->view->title = $posts_lang->title;
            $post->content = $posts_lang->content;
            $post->excerpt = $posts_lang->excerpt;
            $this->view->post = $post;
            return $this->view->pick('templates/single');
        }
    }

    public function categoryAction($slug1 = null, $slug2 = null){
        $slug1 = $this->helper->slugify($slug1);
        $slug2 = $this->helper->slugify($slug2);
        $dept = $this->dispatcher->getReturnedValue();
        $lang_id = $this->session->get('lang_id');
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;
        if(!$dept->id){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;

        if(!$category = \Categories::findFirst(["slug = :slug: AND status = 1 AND dept_id = $dept->id", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        $current_page = (int)$this->request->get('page');
        $posts = $this->modelsManager->createBuilder()
        ->columns(array(
            'p.id',
            'pl.title',
            'p.slug',
            'p.cat_id',
            'pl.content',
            'p.status',
            'pl.excerpt',
            'p.dept_id',
            'p.created_at',
            'p.calendar',
            'p.featured_image',
        ))
        ->from(['p'=>'Posts'])
        ->where("p.deleted = 0 AND p.status = 1 AND p.cat_id = $category->id AND p.dept_id = $dept->id")
        ->leftJoin('PostsLang', "pl.post_id = p.id AND pl.lang_id = $lang_id",'pl')
        ->orderBy("p.calendar DESC");
        $post_count = $posts->getQuery()
        ->execute()
        ->count();

        $posts = $posts->limit(10)
        ->offset(10 * ($current_page > 0 ? ($current_page - 1) : 0))
        ->getQuery()
        ->execute();

        $paging = $this->helper->getPaging($post_count, $current_page);
        $this->view->title = \Categories::getTitleById($category->id);
        $this->view->posts = $posts;
        $this->view->paging = $paging;
        $this->view->slug_now = $category->slug;
        $this->view->pick('templates/blog');   
    }

    public function blogAction($slug = null){
        $slug = $this->helper->slugify($slug);
        $dept = $this->dispatcher->getReturnedValue();
        $lang_id = $this->session->get('lang_id');
        $current_page = (int)$this->request->get('page');

        $posts = $this->modelsManager->createBuilder()
        ->columns(array(
            'p.id',
            'pl.title',
            'p.slug',
            'p.cat_id',
            'pl.content',
            'p.status',
            'pl.excerpt',
            'p.dept_id',
            'p.created_at',
            'p.calendar',
            'p.featured_image',
        ))
        ->from(['p'=>'Posts'])
        ->leftJoin('PostsLang', "pl.post_id = p.id AND pl.lang_id = $lang_id AND p.dept_id = $dept->id",'pl')
        ->orderBy("p.calendar DESC")
        ->where("p.deleted = 0 AND p.status = 1");
        
        $post_count = $posts->getQuery()
        ->execute()
        ->count();

        $posts = $posts->limit(10)
        ->offset(10 * ($current_page > 0 ? ($current_page - 1) : 0))
        ->getQuery()
        ->execute();

        $paging = $this->helper->getPaging($post_count, $current_page);
        $this->view->title = $this->ml->_ml_system('news', "Tin tức");
        $this->view->posts = $posts;
        $this->view->paging = $paging;
        $this->view->pick('templates/blog');   
    }
}