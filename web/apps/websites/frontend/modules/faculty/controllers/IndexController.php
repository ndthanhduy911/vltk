<?php

namespace Frontend\Modules\Faculty\Controllers;

use Models\Categories;
use Models\Departments;
use Models\HomeSetting;

class IndexController extends \FrontendController
{
    public function indexAction(){
        // $settings = HomeSetting::find(['dept_id = :dept_id:', 'bind' => ["dept_id" => $this->session->get('dept_id')]]);
        $cats = [];
        $depts = [];
        if($catSetting = HomeSetting::findFirst(['dept_id = 1 AND type = 2'])){
            $listCats = json_decode($catSetting->setting);
            $npCat = Categories::getNamepace();
            $cats = $this->modelsManager->createBuilder()
            ->columns(array(
                $npCat.'.id',
                $npCat.'.slug',
                'CL.name cat_name',
            ))
            ->from($npCat)
            ->leftJoin('Models\CategoriesLang', 'CL.cat_id = '.$npCat.'.id','CL')
            ->where('CL.lang_id = :lang_id: AND status = 1 AND dept_id = 1',['lang_id' => $this->session->get('lang_id')])
            ->inWhere($npCat.".id", $listCats)
            ->getQuery()
            ->execute();

        }

        $npDept = Departments::getNamepace();
        $depts = $this->modelsManager->createBuilder()
        ->columns(array(
            $npDept.'.id',
            $npDept.'.slug',
            $npDept.'.image',
            'DL.name dept_name',
        ))
        ->from($npDept)
        ->leftJoin('Models\DepartmentsLang', 'DL.dept_id = '.$npDept.'.id','DL')
        ->where('DL.lang_id = :lang_id: AND status = 1 AND '.$npDept.'.id != 1',['lang_id' => $this->session->get('lang_id')])
        ->getQuery()
        ->execute();

        $this->view->cats = $cats;
        $this->view->depts = $depts;
        $this->get_js_css();
    }

    public function changelanguage($lang_id = 1){
        $this->session->set("lang_new", $lang_id);
        $this->response->setStatusCode(200, 'OK');
        $this->response->setJsonContent(['lang_id' => $lang_id]);
        return $this->response->send();
    }

    // =================================
    // FUNCTION
    // =================================
    private function get_js_css (){
        $this->assets->addJs(FRONTEND_URL.'/assets/frontend/js/modules/faculty/index.js');
    }
}