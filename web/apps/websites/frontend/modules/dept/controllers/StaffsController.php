<?php

namespace Frontend\Modules\Dept\Controllers;

class StaffsController extends \FrontendController
{
    public function indexAction(){
        $dept = $this->dispatcher->getReturnedValue();
        $langid = $this->session->get('langid');
        if(!$page = \Pages::findFirst(["status = 1 AND deptid = $dept->id AND attrid = 2"])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        if(!$pagelang = \PagesLang::findFirst(["langid = $langid AND pageid = $page->id"])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        $this->view->title = $pagelang->title;
        $this->view->page = $page;
        $this->view->pagelang = $pagelang;
        return $this->view->pick('templates/pages/teams');
    }

    public function singleAction($slug1 = null, $slug2 = null){
        $slug1 = $this->helper->slugify($slug1);
        $slug2 = $this->helper->slugify($slug2);
        $dept = $this->dispatcher->getReturnedValue();
        $langid = $this->session->get('langid');
        $slug = (int)$dept->id === 1 ? $slug1 : $slug2;
        if(!$staff = \Staffs::findFirst(["status = 1 AND slug = :slug:", 'bind' => ['slug' => $slug]])){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        if($stafflang = \StaffsLang::findFirst(["langid = $langid AND staffid = $staff->id"])){
            $this->view->title = $stafflang->title;
            $this->view->staff = $staff;
            $this->view->stafflang = $stafflang;
        }

        if($dept_info = \Depts::findFirstId($staff->deptid)){
            $this->view->dept_info = $dept_info;
            $this->view->deptlang_info = \DeptsLang::findFirst(["langid = $langid AND deptid = $dept_info->id"]);
        }

        if($page = \Pages::findFirst(["attrid = 2 AND deptid = $staff->deptid"])){
            $this->view->title2 = \PagesLang::findFirst(["langid = $langid AND pageid = $page->id"]);
            $this->view->slug2 = $page->slug;
        }
    }
}