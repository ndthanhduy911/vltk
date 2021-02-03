<?php
use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;

class FrontendController extends Controller
{
    public $dept = null;

    public $deptlang = false;

    public $langid = 1;

    public $language = [];

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
            $deptSlug = $dispatcher->getParam('dept');
            $deptSlug = $this->helper->slugify($deptSlug);
            $dept = \Depts::getBySlug($deptSlug);
            if($dept = $dept ? $dept : \Depts::findFirstId(1)){
                $this->langid = $this->session->get('langid');
                $this->dept = $dept;
                $this->deptlang = \DeptsLang::findFirst(["deptid = $dept->id AND langid = {$this->langid}"]);
                $this->language = $language;
                $this->view->slug = $this->dept->slug;
                $this->view->langid = $this->langid;
                $this->view->deptlang = $this->deptlang;
                $this->view->dept = $this->dept;
                $this->view->language = $this->language;
            }else{
                $this->view->title = '404';
                return $this->view->pick('templates/404');
            }

        } catch (\Exception $e) {
            $this->flash->error($e->getMessage());
        }
    }
}
