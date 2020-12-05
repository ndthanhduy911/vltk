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
            if($lang_new =  $this->session->get('lang_new')){
                $this->session->set('langid', $lang_new);
            }else{
                $this->session->set('langid', 1);
            }
            if($language = \Language::findFirstId($this->session->get('langid'))){
                $this->session->set('shortname', strtolower($language->shortname));
            }
            $langid = $this->session->get('langid');
            $dept_slug = $dispatcher->getParam('dept');
            $dept_slug = $this->helper->slugify($dept_slug);
            $dept = \Depts::getBySlug($dept_slug);
            if($dept = $dept ? $dept : \Depts::findFirstId(1)){
                $dispatcher->setReturnedValue($dept);
                $this->view->slug = $dept_slug ? $dept_slug : '';
                $this->view->langid = $this->session->get('langid');
                $this->view->deptlang = \DeptsLang::findFirst(["deptid = $dept->id AND langid = $langid"]);
                $this->view->dept = $dept;
                $this->view->language = $language;
            }else{
                $this->view->title = '404';
                return $this->view->pick('templates/404');
            }

        } catch (\Exception $e) {
            $this->flash->error($e->getMessage());
        }
    }
}
