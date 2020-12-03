<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\HomesForm;
use Backend\Modules\Admins\Forms\HomesLangForm;

class HomesController  extends \BackendController {

    public function indexAction(){
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $perEdit = $this->master::checkPermissionDepted('homes', 'update',1);
        $perView = $this->master::checkPermissionDepted('homes', 'index');
        $perL = $perView ? $perView : ($perEdit? $perEdit :false);
        if(!$perL){
            require ERROR_FILE; die;
        }
        if($this->request->get('singlePage') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }
        $deptid = $this->session->get('deptid');
        if(!$homes = \Homes::findFirst(["deptid = $deptid"])){
            require ERROR_FILE; die;
        } 
        $formsLang = [];
        $homesLang = [];
        $languages = \Language::find(['status = 1']);
        foreach ($languages as $key => $lang) {
            $v = ($key == 0 ? true : false);
            $homeLang = \HomesLang::findFirst(['homeid = :id: AND langid = :langid:','bind' => ['id' => $homes->id, 'langid' => $lang->id]]);
            if($homeLang){
                $formLang = new HomesLangForm($homeLang, [$lang->id,$v]);
                $homesLang[$lang->id] = $homeLang;
                $formsLang[$lang->id] = $formLang;
            }else{
                $formsLang[$lang->id] = new HomesLangForm(null, [$lang->id,$v]);
                $homesLang[$lang->id] = new \HomesLang();
            }
        }
        $title = 'Thiết lập trang chủ';
        
        $formHomes = new HomesForm($homes);
        $this->view->perEdit = $perEdit ? 1 : "";
        $this->view->perView = $perView ? 1 : "";
        $this->view->languages = $languages;
        $this->view->formsLang = $formsLang;
        $this->view->formHomes = $formHomes;
        $this->view->homes = $homes;
        $this->view->homesLang = $homesLang;
        $this->view->title = $title;
        $this->getJsCss();
    }

    // =================================
    // API
    // =================================


    // =================================
    // FUNCTION
    // =================================

    private function getJsCss (){
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/admins/home.js');
    }
}