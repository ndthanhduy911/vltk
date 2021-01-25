<?php

namespace Frontend\Modules\Dept\Controllers;

class MajorsController extends \FrontendController
{
    public function singleAction($slug1 = null, $slug2 = null){
        $slug1 = $this->helper->slugify($slug1);
        $slug2 = $this->helper->slugify($slug2);
        $dept = $this->dispatcher->getReturnedValue();
        $langid = $this->session->get('langid');
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;
        if(!$majors = \Majors::findFirst(["status = 1 AND slug = :slug:", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        if(!$majorslang = \MajorsLang::findFirst(["langid = {$langid} AND majorid = {$majors->id}"])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        if(!$gmajors = \Gmajors::findFirst(["status = 1 AND id = {$majors->gmajorid}"])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        $this->view->title = $majorslang->title;
        $this->view->majors = $majors;
        $this->view->majorslang = $majorslang;
        $this->view->gmajors = $gmajors;
        $this->view->gtitle = \Gmajors::getTitleById($gmajors->id);
    }
}