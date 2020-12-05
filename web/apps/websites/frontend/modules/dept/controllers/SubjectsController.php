<?php

namespace Frontend\Modules\Dept\Controllers;

class SubjectsController extends \FrontendController
{
    public function indexAction(){

    }

    public function singleAction($slug = null){
        $slug = $this->helper->slugify($slug);
        $langid = $this->session->get('langid');
        if(!$subjects = \Subjects::findFirst(["status = 1 AND slug = :slug: AND deleted = 0", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        $subjectslang = \SubjectsLang::findFirst(["langid = $langid AND subjectid = $subjects->id"]);
        $this->view->title = $subjectslang->title;
        $this->view->subject = $subjects;
        $this->view->subjectslang = $subjectslang;
    }
}