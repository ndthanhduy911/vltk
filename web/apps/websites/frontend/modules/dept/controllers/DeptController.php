<?php

namespace Frontend\Modules\Dept\Controllers;
use Models\Departments;
use Models\Banners;
use Phalcon\Mvc\View;

class DeptController extends \FrontendController
{
    public function indexAction($params = null){
        $params = $this->helper->slugify($params);
        $dept = Departments::findFirst(['slug = :slug:', 'bind' => ['slug' => $params]]);
        if($dept){
            $this->view->title = $dept->name;
            $this->view->dept = $dept;
            $this->view->banners = Banners::find(['dept_id = :dept_id:','bind' => ['dept_id' => $dept->id]]);            
        }else{
            $this->view->title = '404';
            // $this->view->pick('templates/404');
        }
    }
}