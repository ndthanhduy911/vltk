<?php

namespace Frontend\Modules\Dept\Controllers;

class ResearchesController extends \FrontendController
{
    public function indexAction($slug1 = null, $slug2 = null){
        $slug1 = $this->helper->slugify($slug1);
        $slug2 = $this->helper->slugify($slug2);
        $dept = $this->dispatcher->getReturnedValue();
        $langid = $this->session->get('langid');
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;
        if(!$researches = \Researches::findFirst(["slug = :slug: AND status = 1 AND deptid = {$dept->id}", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        if(!$researchslang = \ResearchesLang::findFirst(["langid = $langid AND researchid = $researches->id"])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        $this->view->title = $researchslang->title;
        $this->view->pages = $researches;
        $this->view->slug_now = $researches->slug;
        $this->view->pageslang = $researchslang;

        return $this->view->pick('templates/pages/default');
    }
}