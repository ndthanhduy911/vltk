<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;
use Models\Pages;
use Models\Departments;
use Models\Categories;

class FrontendController extends Controller
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
            $depts = Departments::find(["columns" => "slug, name, image"]);
            $cats = Categories::find(["dept_id = 1","columns" => "slug, name"]);
            $pages = Pages::find(["dept_id = 1","columns" => "slug, title"]);

            if($depts->count() && $cats->count() &&$pages->count()){
                $this->view->depts =  $depts;
                $this->view->cats =  $cats;
                $this->view->pages =  $pages;
            }else{
                echo "403";
            }
            // $identity = $this->auth->getIdentity();
            // if($dispatcher->getControllerName() === 'captchas'
            // || ($dispatcher->getControllerName() === 'account' && $dispatcher->getActionName()=== 'login')
            // ){
                
            // }else{
            //     if(!$this->session->has('emailAddress')){
            //         return $this->response->redirect($this->getFrontendUrl().'account/login');
            //     }
            // }
        } catch (\Exception $e) {
            $this->flash->error($e->getMessage());
        }
    }
}
