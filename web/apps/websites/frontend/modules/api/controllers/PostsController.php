<?php

namespace Frontend\Modules\Api\Controllers;
class PostsController extends \FrontendController
{

    // =======================================
    // API
    // =======================================

    public function getdatapostsAction(){
        
        if($this->request->isAjax()) {
            $deptid = $this->request->get('deptid');
            $limit = $this->request->get('limit');
            $limit = $limit ? (int)$limit : 5;
            $catid = $this->request->get('catid');
            if($catid){
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
                    'p.featured_image',
                    'cl.name cat_name',
                ))
                ->from(['p'=>'Posts'])
                ->leftJoin('CategoriesLang', 'cl.catid = p.catid AND cl.langid = '.$this->session->get('langid'),'cl')
                ->leftJoin('PostsLang', 'pl.postid = p.id AND pl.langid = '.$this->session->get('langid'),'pl')
                ->orderBy("p.calendar DESC")
                ->where('p.deleted = 0 AND p.catid = :catid: AND p.status = 1 AND p.deptid = :deptid:',['deptid' => $deptid, 'catid' => $catid])
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
                    'p.catid',
                    'pl.content',
                    'p.status',
                    'pl.excerpt',
                    'p.deptid',
                    'p.createdat',
                    'p.calendar',
                    'p.featured_image',
                    'cl.name cat_name',
                ))
                ->from(['p'=>'Posts'])
                ->leftJoin('CategoriesLang', 'cl.catid = p.catid AND cl.langid = 1','cl')
                ->leftJoin('PostsLang', 'pl.postid = p.id AND pl.langid = 1','pl')
                ->orderBy('p.id DESC')
                ->where('p.deleted = 0 AND p.status = 1 AND p.deptid = :deptid:',['deptid' => $deptid])
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