<?php

namespace Frontend\Modules\Dept\Controllers;

class SubjectsController extends \FrontendController
{
    public function indexAction(){

    }

    public function singleAction($slug = null){
        $slug = $this->helper->slugify($slug);
        $langid = $this->session->get('langid');
        if(!$subject = \Subjects::findFirst(["status = 1 AND slug = :slug: AND deleted = 0", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        if($subject_lang = \SubjectsLang::findFirst(["langid = $langid AND subjectid = $subject->id"])){
            $this->view->title = $subject_lang->title;
            $this->view->subject = $subject;
            $this->view->subject_lang = $subject_lang;
        }
    }
}