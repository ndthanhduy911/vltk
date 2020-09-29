<?php

namespace Frontend\Modules\Api\Controllers;
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
                    'cl.name cat_name',
                ))
                ->from(['p'=>'Posts'])
                ->leftJoin('CategoriesLang', 'cl.cat_id = p.cat_id AND cl.lang_id = '.$this->session->get('lang_id'),'cl')
                ->leftJoin('PostsLang', 'pl.post_id = p.id AND pl.lang_id = '.$this->session->get('lang_id'),'pl')
                ->orderBy("p.calendar DESC")
                ->where('p.deleted = 0 AND p.cat_id = :cat_id: AND p.status = 1 AND p.dept_id = :dept_id:',['dept_id' => $dept_id, 'cat_id' => $cat_id])
                ->limit($limit, 0)
                ->getQuery()
                ->execute()
                ->toArray();
            }else{
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
                    'cl.name cat_name',
                ))
                ->from(['p'=>'Posts'])
                ->leftJoin('CategoriesLang', 'cl.cat_id = p.cat_id AND cl.lang_id = 1','cl')
                ->leftJoin('PostsLang', 'pl.post_id = p.id AND pl.lang_id = 1','pl')
                ->orderBy('p.id DESC')
                ->where('p.deleted = 0 AND p.status = 1 AND p.dept_id = :dept_id:',['dept_id' => $dept_id])
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