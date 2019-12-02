<?php

namespace Frontend\Modules\Dept\Controllers;
use Models\Posts;
class PostsController extends \FrontendController
{
    public function indexAction(){
        $this->view->title = 'Tin tức';
        $current_page = (int)$this->request->get('page');
        $posts = Posts::find([
            'dept_id = 1',
            'offset' => 10 * ($current_page >= 0 ? ($current_page - 1) : 0),
            'limit' => 10,
        ]);
        $paging = $this->helper->getPaging(Posts::find(['dept_id = 1 AND status = 1'])->count(), $current_page);
        $this->view->posts = $posts;
        $this->view->paging = $paging;
        $this->view->pick('templates/blog');
    }

    public function singleAction($params = null){
        $slug = $this->helper->slugify($params);
        $post = Posts::findFirst(['status = 1 AND slug = :slug:', 'bind' => ['slug' => $slug]]);
        if($post){
            if($posts_lang = Posts::getLang($post->id)){
                $this->view->title = $posts_lang->title;
                $post->content = $posts_lang->content;
                $post->excerpt = $posts_lang->excerpt;
                $this->view->post = $post;
                return $this->view->pick('templates/single');
            }
        }

        $this->view->title = '404';
        return $this->view->pick('templates/404');
        

    }
}