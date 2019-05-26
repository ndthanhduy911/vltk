<?php

namespace Frontend\Modules\Dept\Controllers;
use Models\Departments;
use Phalcon\Mvc\View;

class DeptController extends \FrontendController
{
    public function indexAction(){
        $params = $this->helper->slugify($params);
        $dept = Departments::findFirst(['slug = :slug:', 'bind' => ['slug' => $params]]);
        if($dept){
            $this->view->title = $dept->name;
            $this->view->dept = $dept;            
        }else{
            $this->view->title = '404';
            // $this->view->pick('templates/404');
        }
    }
}