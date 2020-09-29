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
                $this->session->set('lang_id', $lang_new);
            }else{
                $this->session->set('lang_id', 1);
            }
            if($language = \Language::findFirstId($this->session->get('lang_id'))){
                $this->session->set('short_name', strtolower($language->short_name));
            }
            $lang_id = $this->session->get('lang_id');
            $dept_slug = $dispatcher->getParam('dept');
            $dept_slug = $this->helper->slugify($dept_slug);
            $dept = \Departments::getBySlug($dept_slug);
            if($dept = $dept ? $dept : \Departments::findFirstId(1)){
                $dispatcher->setReturnedValue($dept);
                $this->view->slug = $dept_slug ? $dept_slug : '';
                $this->view->lang_id = $this->session->get('lang_id');
                $this->view->dept_lang = \DepartmentsLang::findFirst(["dept_id = $dept->id AND lang_id = $lang_id"]);
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
