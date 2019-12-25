<?php

namespace Frontend\Modules\Dept\Controllers;

use Models\Departments;
use Models\DepartmentsLang;
use Models\Staff;
use Models\StaffLang;

class StaffController extends \FrontendController
{
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
    }
}