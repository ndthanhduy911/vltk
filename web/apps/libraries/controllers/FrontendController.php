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
            $npCat = Categories::getNamepace();
            $cats = $this->modelsManager->createBuilder()
            ->columns(array(
                $npCat.'.id',
                'CL.name name',
                $npCat.'.slug',
            ))
            ->from($npCat)
            ->where("dept_id = 1")
            ->join('Models\CategoriesLang', 'CL.cat_id = '.$npCat.'.id AND CL.lang_id = '.$_SESSION['lang_id'],'CL')
            ->getQuery()
            ->execute();
            $pages = Pages::find(["dept_id = 1","columns" => "slug, title"]);

            if($depts->count() && $cats->count() &&$pages->count()){
                $this->view->depts =  $depts;
                $this->view->cats =  $cats;
                $this->view->pages =  $pages;
            }else{
                echo "403";
            }
            if($lang_new =  $this->session->get('lang_new')){
                $this->session->set('lang_id', $lang_new);
            }else{
                $this->session->set('lang_id', 1);
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
