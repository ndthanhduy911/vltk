<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;
use Models\Language;

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
            if($lang_new =  $this->session->get('lang_new')){
                $this->session->set('lang_id', $lang_new);
            }else{
                $this->session->set('lang_id', 1);
            }
            $this->view->lang_id = $this->session->get('lang_id');
            $this->view->language = Language::findFirstId($this->session->get('lang_id'));
        } catch (\Exception $e) {
            $this->flash->error($e->getMessage());
        }
    }
}
