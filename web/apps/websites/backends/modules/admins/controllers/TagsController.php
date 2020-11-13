<?php
namespace Backend\Modules\Admins\Controllers;

class TagsController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function updateAction($id = 0){

    }

    public function deleteAction($id = null){

    }

    // =================================
    // API
    // =================================

    public function getdataAction(){
        if($this->request->isAjax()){
            $dept_id = $this->session->get('dept_id');
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'c.id',
                'c.slug',
                'c.status',
                'c.dept_id',
                'c.created_at',
            ))
            ->from(['c' => 'Classes'])
            ->where("c.deleted = 0 AND c.dept_id = {$dept_id}")
            ->orderBy('c.dept_id ASC, c.created_at DESC');
    
            $search = 'cl.title LIKE :search:';
            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent($this->ssp->data_output($this->request->get(), $data,$search));
            return $this->response->send();
        }else{
            $this->response->setStatusCode(403, 'Failed');
            $this->response->setJsonContent(['Truy cập không được phép']);
            return $this->response->send();
        }
    }

    private function get_js_css (){
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/classes.js');
    }
}