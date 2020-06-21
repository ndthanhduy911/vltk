<?php

namespace Frontend\Modules\Dept\Controllers;

use Models\Departments;
use Models\DepartmentsLang;
use Models\Staff;
use Models\StaffLang;
use Models\Pages;
use Models\PagesLang;


class StaffController extends \FrontendController
{
    public function indexAction(){
        $dept = $this->dispatcher->getReturnedValue();
        $lang_id = $this->session->get('lang_id');
        if(!$page = Pages::findFirst(["status = 1 AND dept_id = $dept->id AND attribute_id = 2"])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        if(!$page_lang = PagesLang::findFirst(["lang_id = $lang_id AND page_id = $page->id"])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        $this->view->title = $page_lang->title;
        $this->view->page = $page;
        $this->view->page_lang = $page_lang;
        return $this->view->pick('templates/pages/teams');
    }

    public function singleAction($slug = null){
        $slug = $this->helper->slugify($slug);
        $lang_id = $this->session->get('lang_id');
        if(!$staff = Staff::findFirst(["status = 1 AND slug = :slug:", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        if($staff_lang = StaffLang::findFirst(["lang_id = $lang_id AND staff_id = $staff->id"])){
            $this->view->title = $staff_lang->title;
            $this->view->staff = $staff;
            $this->view->staff_lang = $staff_lang;
        }

        if($dept_info = Departments::findFirstId($staff->dept_id)){
            $this->view->dept_info = $dept_info;
            $this->view->dept_lang_info = DepartmentsLang::findFirst(["lang_id = $lang_id AND dept_id = $dept_info->id"]);
        }

        if($page = Pages::findFirst(["attribute_id = 2 AND dept_id = $staff->dept_id"])){
            $this->view->title2 = PagesLang::findFirst(["lang_id = $lang_id AND page_id = $page->id"]);
            $this->view->slug2 = $page->slug;
        }
    }
}