<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;

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
