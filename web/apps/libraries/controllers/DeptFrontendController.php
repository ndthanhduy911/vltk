<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;

class DeptFrontendController extends Controller
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
            
        } catch (\Exception $e) {
            $this->flash->error($e->getMessage());
        }
    }
}
