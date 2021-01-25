<?php

namespace Frontend\Modules\Dept\Controllers;

class GmajorsController extends \FrontendController
{
    public function indexAction(){
        $dept = $this->dispatcher->getReturnedValue();
        $langid = $this->session->get('langid');
        if(!$page = \Pages::findFirst(["status = 1 AND deptid = {$dept->id} AND attrid = 6"])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        if(!$pageslang = \PagesLang::findFirst(["langid = {$langid} AND pageid = {$page->id}"])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        $this->view->title = $pageslang->title;
        $this->view->page = $page;
        $this->view->pageslang = $pageslang;
        return $this->view->pick('templates/pages/gmajors');
    }

    public function singleAction($slug1 = null, $slug2 = null){
        $slug1 = $this->helper->slugify($slug1);
        $slug2 = $this->helper->slugify($slug2);
        $dept = $this->dispatcher->getReturnedValue();
        $langid = $this->session->get('langid');
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;
        if(!$gmajors = \Gmajors::findFirst(["status = 1 AND slug = :slug:", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        if(!$gmajorslang = \GmajorsLang::findFirst(["langid = {$langid} AND gmajorid = {$gmajors->id}"])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        $majors = $this->modelsManager->createBuilder()
        ->columns(array(
            'r.id',
            'r.slug',
            'r.image',
            'rl.title',
        ))
        ->from(['r'=>'Majors'])
        ->where("r.deptid = {$dept->id} AND r.status = 1 AND r.deleted = 0 AND gmajorid = {$gmajors->id}")
        ->leftJoin('MajorsLang', "rl.majorid = r.id AND rl.langid = {$langid}",'rl')
        ->getQuery()
        ->execute();

        $this->view->title = $gmajorslang->title;
        $this->view->gmajors = $gmajors;
        $this->view->gmajorslang = $gmajorslang;
        $this->view->majors = $majors;
    }
}