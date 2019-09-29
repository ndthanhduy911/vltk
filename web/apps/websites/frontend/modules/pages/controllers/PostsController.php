<?php

namespace Frontend\Modules\Pages\Controllers;
use Phalcon\Mvc\View;
use Models\Categories;
use Models\Posts;
use Models\PostsLang;
use Models\Language;
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

    // =======================================
    // API
    // =======================================

    public function getdatapostsAction($cat_id = null){
        if($this->request->isAjax()) {
            $dept_id = $this->request->get('dept_id');
            $dept_id = $dept_id ? $dept_id : 1;
            $limit = $this->request->get('limit');
            $limit = $limit ? (int)$limit : 5;
            if($cat_id){
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
                    'C.name cat_name',
                ))
                ->from($npPosts)
                ->join('Models\CategoriesLang', 'C.cat_id = '.$npPosts.'.cat_id AND C.lang_id = 1','C')
                ->join('Models\PostsLang', 'PL.post_id = '.$npPosts.'.id AND PL.lang_id = 1','PL')
                ->orderBy($npPosts.'.id DESC')
                ->where($npPosts.'.deleted = 0 AND '.$npPosts.'.cat_id = :cat_id: AND '.$npPosts.'.status = 1 AND '.$npPosts.'.dept_id = :dept_id:',['dept_id' => $dept_id, 'cat_id' => $cat_id])
                ->limit($limit, 0)
                ->getQuery()
                ->execute()
                ->toArray();
            }else{
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
                    'C.name cat_name',
                ))
                ->from($npPosts)
                ->join('Models\CategoriesLang', 'C.cat_id = '.$npPosts.'.cat_id AND C.lang_id = 1','C')
                ->join('Models\PostsLang', 'PL.post_id = '.$npPosts.'.id AND PL.lang_id = 1','PL')
                ->orderBy($npPosts.'.id DESC')
                ->where($npPosts.'.deleted = 0 AND '.$npPosts.'.status = 1 AND '.$npPosts.'.dept_id = :dept_id:',['dept_id' => $dept_id])
                ->limit($limit, 0)
                ->getQuery()
                ->execute()
                ->toArray();
            }

            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent($posts);
            return $this->response->send();
        }else{
            $this->response->setStatusCode(403, 'Truy cập không được phép');
            return $this->response->send();
        }
    }
}