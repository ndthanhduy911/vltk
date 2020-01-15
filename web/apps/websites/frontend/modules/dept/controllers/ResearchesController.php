<?php

namespace Frontend\Modules\Dept\Controllers;

use Models\Departments;
use Models\DepartmentsLang;
use Models\Researches;
use Models\ResearchesLang;


class ResearchesController extends \FrontendController
{
    public function indexAction($slug1 = null, $slug2 = null){
        $slug1 = $this->helper->slugify($slug1);
        $slug2 = $this->helper->slugify($slug2);
        $dept = $this->dispatcher->getReturnedValue();
        $lang_id = $this->session->get('lang_id');
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;
        if(!$research = Researches::findFirst(["slug = :slug: AND status = 1 AND dept_id = $dept->id", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        if(!$research_lang = ResearchesLang::findFirst(["lang_id = $lang_id AND research_id = $research->id"])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        $this->view->title = $research_lang->title;
        $this->view->page = $research;
        $this->view->slug_now = $research->slug;
        $this->view->page_lang = $research_lang;

        return $this->view->pick('templates/pages/default');
    }
}