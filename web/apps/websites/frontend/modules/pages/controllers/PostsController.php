<?php

namespace Frontend\Modules\Pages\Controllers;
use Phalcon\Mvc\View;
use Models\Categories;
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

    public function categoryAction($params = null){
        $slug = $this->helper->slugify($params);
        $category = Categories::findFirst(['slug = :slug: AND status = 1', 'bind' => ['slug' => $slug]]);
        if($category){

            $current_page = (int)$this->request->get('page');
            $this->view->title = $category->name;
            $posts = Posts::find([
                'dept_id = 1 AND cat_id = :cat_id: AND status = 1',
                'offset' => 10 * ($current_page > 0 ? ($current_page - 1) : 0),
                'limit' => 10,
                'bind' => [
                    'cat_id' => $category->id
                ]
            ]);
            $paging = $this->helper->getPaging(Posts::find(['dept_id = 1 AND status = 1 AND cat_id = '.$category->id])->count(), $current_page);
            $this->view->posts = $posts;
            $this->view->paging = $paging;
            $this->view->pick('templates/blog');           
        }else{
            $this->view->title = '404';
            $this->view->pick('templates/404');
        }
    }

    public function singleAction($params = null){
        $slug = $this->helper->slugify($params);
        $post = Posts::findFirst(['dept_id = 1 AND status = 1 AND slug = :slug:', 'bind' => ['slug' => $slug]]);
        if($post){
            $this->view->title = $post->title;
            $this->view->post = $post;
            $this->view->pick('templates/single');
        }else{
            $this->view->title = '404';
            $this->view->pick('templates/404');
        }

    }

    // =======================================
    // API
    // =======================================

    public function getdatapostsAction($cat_id = null){
        if($this->request->isAjax()) {
            if($cat_id){
                $posts = Posts::find([
                    'status = 1 AND cat_id = :cat_id:',
                    'limit' => 5,
                    'bind' => [
                        'cat_id' => $cat_id
                    ]
                ]);
            }else{
                $posts = Posts::find([
                    'status = 1',
                    'limit' => 5,
                ]);
            }


            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent($posts);
            return $this->response->send();
        }
    }
}