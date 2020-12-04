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
        if(!$research = \Researches::findFirst(["slug = :slug: AND status = 1 AND deptid = $dept->id", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        if(!$researchlang = \ResearchesLang::findFirst(["langid = $langid AND researchid = $research->id"])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        $this->view->title = $researchlang->title;
        $this->view->page = $research;
        $this->view->slug_now = $research->slug;
        $this->view->pagelang = $researchlang;

        return $this->view->pick('templates/pages/default');
    }
}