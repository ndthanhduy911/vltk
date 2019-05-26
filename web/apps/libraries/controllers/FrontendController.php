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
            $this->view->depts =  Departments::find(["columns" => "slug, name, image"]);
            $this->view->cats =  Categories::find(["columns" => "slug, name"]);
            $this->view->pages =  Pages::find(["dept_id = 1","columns" => "slug, title"]);
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
