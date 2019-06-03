<?php

namespace Frontend\Modules\Dept\Controllers;
use Models\Departments;
use Models\Banners;
use Models\Pages;
use Models\Attributes;
use Phalcon\Mvc\View;

class DeptController extends \DeptfrontendController
{
    public function indexAction($dept = null, $pages = null){
        $dept = $this->dispatcher->getReturnedValue();
        if($dept){
            if($pages){
                $pages = $this->helper->slugify($pages);
                $page = Pages::findFirst(['slug = :slug: AND status = 1 AND dept_id = :dept_id:', 'bind' => ['slug' => $pages, 'dept_id' => $dept->id]]);
                if($page){
                    $this->view->title = $page->title;
                    $this->view->page = $page;
                    if($page->attribute_id){
                        if(($attribute = Attributes::findFirst($page->attribute_id))){
                            $this->view->pick('templates/'.$attribute->path);
                        }
                    }else{
                        $this->view->pick('templates/default');
                    }            
                }else{
                    $this->view->title = '404';
                    // $this->view->pick('templates/404');
                }
            }else{
                $this->view->title = $dept->name;
                $this->view->banners = Banners::find(['dept_id = :dept_id:','bind' => ['dept_id' => $dept->id]]);  
            }
        }else{
            $this->view->title = '404';
            // $this->view->pick('templates/404');
        }
    }
}