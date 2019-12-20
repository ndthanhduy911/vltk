<?php

namespace Frontend\Modules\Dept\Controllers;
use Models\Posts;
use Models\Categories;
use Models\Departments;
use Models\DepartmentsLang;
use Models\PostsLang;

class PostsController extends \FrontendController
{
    public function indexAction(){
        $dept = $this->dispatcher->getReturnedValue();
        $lang_id = $this->session->get('lang_id');

        $current_page = (int)$this->request->get('page');
        $posts = Posts::find([
            'dept_id = 1',
            'offset' => 10 * ($current_page >= 0 ? ($current_page - 1) : 0),
            'limit' => 10,
        ]);
        $paging = $this->helper->getPaging(Posts::find(['dept_id = 1 AND status = 1'])->count(), $current_page);
        $this->view->title = 'Tin tức';
        $this->view->posts = $posts;
        $this->view->paging = $paging;
        $this->view->dept_id = $dept->id;
        $this->view->pick('templates/blog');
    }

    public function singleAction($slug1 = null, $slug2 = null){
        $slug1 = $this->helper->slugify($slug1);
        $slug2 = $this->helper->slugify($slug2);
        $dept = $this->dispatcher->getReturnedValue();
        $lang_id = $this->session->get('lang_id');
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;
        if(!$post = Posts::findFirst(["status = 1 AND slug = :slug: AND dept_id = $dept->id", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        if($posts_lang = PostsLang::findFirst(["lang_id = $lang_id AND post_id = $post->id"])){
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

        if(!$category = Categories::findFirst(["slug = :slug: AND status = 1 AND dept_id = $dept->id", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        $current_page = (int)$this->request->get('page');
        $npPosts = Posts::getNamepace();
        $posts = $this->modelsManager->createBuilder()
        ->columns(array(
            $npPosts.'.id',
            'PL.title',
            $npPosts.'.slug',
            $npPosts.'.cat_id',
            'PL.content',
            $npPosts.'.status',
            'PL.excerpt',
            $npPosts.'.dept_id',
            $npPosts.'.created_at',
            $npPosts.'.calendar',
            $npPosts.'.featured_image',
        ))
        ->from($npPosts)
        ->join('Models\PostsLang', "PL.post_id = $npPosts.id AND PL.lang_id = $lang_id AND $npPosts.dept_id = 1",'PL')
        ->orderBy("$npPosts.calendar DESC")
        ->where("$npPosts.deleted = 0 AND $npPosts.status = 1 AND $npPosts.cat_id = ".$category->id);
        
        $post_count = $posts->getQuery()
        ->execute()
        ->count();

        $posts = $posts->limit(10)
        ->offset(10 * ($current_page > 0 ? ($current_page - 1) : 0))
        ->getQuery()
        ->execute();

        $paging = $this->helper->getPaging($post_count, $current_page);
        $this->view->title = Categories::getTitleById($category->id);
        $this->view->posts = $posts;
        $this->view->paging = $paging;
        $this->view->pick('templates/blog');   
    }

    public function blogAction($slug = null){
        $slug = $this->helper->slugify($slug);
        $dept = $this->dispatcher->getReturnedValue();
        $lang_id = $this->session->get('lang_id');
        $current_page = (int)$this->request->get('page');
        $npPosts = Posts::getNamepace();
        $posts = $this->modelsManager->createBuilder()
        ->columns(array(
            $npPosts.'.id',
            'PL.title',
            $npPosts.'.slug',
            $npPosts.'.cat_id',
            'PL.content',
            $npPosts.'.status',
            'PL.excerpt',
            $npPosts.'.dept_id',
            $npPosts.'.created_at',
            $npPosts.'.calendar',
            $npPosts.'.featured_image',
        ))
        ->from($npPosts)
        ->join('Models\PostsLang', "PL.post_id = $npPosts.id AND PL.lang_id = $lang_id AND $npPosts.dept_id = $dept->id",'PL')
        ->orderBy("$npPosts.calendar DESC")
        ->where("$npPosts.deleted = 0 AND $npPosts.status = 1");
        
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