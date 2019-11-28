<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;
use Models\Pages;
use Models\Departments;
use Models\Categories;

class DeptfrontendController extends Controller
{
    protected  $frontendUrl;
    
    /**
     * @param mixed $frontendUrl
     */
    public function setFrontendUrl($frontendUrl)
    {
        $this->frontendUrl = $frontendUrl;
    }

    /**
     * @return mixed
     */
    public function getFrontendUrl()
    {
        return $this->getDi()->get('config')->application->frontendUrl;
    }

    public function beforeExecuteRoute(Dispatcher $dispatcher)
    {
        try {
            // if($dispatcher->getModuleName() !== 'dept' ){
            //     $params = $this->helper->slugify($dispatcher->getParam('dept'));
            //     $dept = Departments::findFirst(['slug = :slug:', 'bind' => ['slug' => $params]]);
            //     if($dept){
            //         // $dispatcher->setParam('dept_id' , $dept->id);
            //         if($lang_new =  $this->session->get('lang_new')){
            //             $this->session->set('lang_id', $lang_new);
            //         }else{
            //             $this->session->set('lang_id', 1);
            //         }
            //         $dispatcher->setReturnedValue($dept);
            //         $this->view->dept =  Departments::findFirst(['slug = :slug:', 'bind' => ['slug' => $params]]);
            //         $this->view->cats =  Categories::find(["dept_id = :dept_id:","columns" => "slug, name","bind" => ['dept_id' => $dept->id]]);
            //         $this->view->pages =  Pages::find(["dept_id = :dept_id:","columns" => "id, slug, title", "bind" => ['dept_id' => $dept->id]]);
            //     }else{
            //         echo 'Truy cập không được phép'; die;
            //     }
            // }else{
            //     echo 'Truy cập không được phép'; die;
            // }
        } catch (\Exception $e) {
            $this->flash->error($e->getMessage());
        }
    }
}
