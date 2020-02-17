<?php

namespace Frontend\Modules\Dept\Controllers;

use Models\Departments;
use Models\DepartmentsLang;
use Models\Subjects;
use Models\SubjectsLang;


class SubjectsController extends \FrontendController
{
    public function indexAction(){

    }

    public function singleAction($slug = null){
        $slug = $this->helper->slugify($slug);
        $lang_id = $this->session->get('lang_id');
        if(!$subject = Subjects::findFirst(["status = 1 AND slug = :slug: AND deleted = 0", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        if($subject_lang = SubjectsLang::findFirst(["lang_id = $lang_id AND staff_id = $subject->id"])){
            $this->view->title = $subject_lang->title;
            $this->view->staff = $subject;
            $this->view->staff_lang = $subject_lang;
        }
    }
}