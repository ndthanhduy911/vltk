<?php

namespace Frontend\Modules\Dept\Controllers;
use Models\Departments;
use Models\Banners;
use Phalcon\Mvc\View;

class DeptController extends \DeptFrontendController
{
    public function indexAction(){
        $dept = $this->dispatcher->getReturnedValue();
        if($dept){
            $this->view->title = $dept->name;
            $this->view->banners = Banners::find(['dept_id = :dept_id:','bind' => ['dept_id' => $dept->id]]);            
        }else{
            $this->view->title = '404';
            // $this->view->pick('templates/404');
        }
    }
}