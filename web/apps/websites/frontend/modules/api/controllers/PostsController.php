<?php

namespace Frontend\Modules\Api\Controllers;
use Models\Posts;
class PostsController extends \FrontendController
{

    // =======================================
    // API
    // =======================================

    public function getdatapostsAction(){
        
        if($this->request->isAjax()) {
            $dept_id = $this->request->get('dept_id');
            $limit = $this->request->get('limit');
            $limit = $limit ? (int)$limit : 5;
            $cat_id = $this->request->get('cat_id');
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
                    'CL.name cat_name',
                ))
                ->from($npPosts)
                ->join('Models\CategoriesLang', 'CL.cat_id = '.$npPosts.'.cat_id AND CL.lang_id = '.$this->session->get('lang_id'),'CL')
                ->join('Models\PostsLang', 'PL.post_id = '.$npPosts.'.id AND PL.lang_id = '.$this->session->get('lang_id'),'PL')
                ->orderBy("$npPosts.calendar DESC")
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