<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\ResearchesForm;
use Backend\Modules\Admins\Forms\ResearchesLangForm;

class ResearchesController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function updateAction($id = 0){
        $formslang = [];
        $researcheslang = [];
        $research_content = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$research = \Researches::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $research->updatedat = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $researchlang = \ResearchesLang::findFirst(['research_id = :id: AND langid = :langid:','bind' => ['id' => $research->id, 'langid' => $lang->id]]);
                if($researchlang){
                    $formlang = new ResearchesLangForm($researchlang);
                    $researcheslang[$lang->id] = $researchlang;
                    $formslang[$lang->id] = $formlang;
                    $research_content[$lang->id] = $researchlang->content;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $research = new \Researches();
            $research->deptid = $this->session->get('deptid');
            $research->createdat = date('Y-m-d H:i:s');
            $research->updatedat = $research->createdat;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $formslang[$lang->id] = new ResearchesLangForm();
                $researcheslang[$lang->id] = new \ResearchesLang();
                $research_content[$lang->id] = '';
            }
        }

        $form_research = new ResearchesForm($research);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_title = $this->request->getPost('title',['string','trim']);
                $p_slug = $this->request->getPost('slug',['string','trim']);
                $p_content = $this->request->getPost('content',['trim']);
                $p_excerpt = $this->request->getPost('excerpt',['string','trim']);
                $req_research = [
                    'status' => $this->request->getPost('status',['int']),
                    'slug' => $p_slug ? $p_slug : $this->helper->slugify($p_title[1]),
                    'image' => $this->request->getPost('image',['string','trim']),
                    'background_image' => $this->request->getPost('background_image',['string','trim'])
                ];

                $check_slug = \Researches::findFirst([
                    "slug = :slug: AND id != :id:",
                    "bind" => [
                        "slug" => $req_research['slug'],
                        'id'    => $id,
                    ]
                ]);
    
                if($check_slug){
                    $req_research['slug'] = $req_research['slug'] .'-'. strtotime('now'); 
                }

                $form_research->bind($req_research, $research);
                if (!$form_research->isValid()) {
                    foreach ($form_research->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }



                foreach ($languages as $key => $lang) {
                    $req_researchlang[$lang->id] = [
                        'title' => $p_title[$lang->id],
                        'content' => $p_content[$lang->id],
                        'excerpt' => $p_excerpt[$lang->id],
                        'langid' => $lang->id,
                    ];

                    $formslang[$lang->id]->bind($req_researchlang[$lang->id], $researcheslang[$lang->id]);
                    if (!$formslang[$lang->id]->isValid()) {
                        foreach ($formslang[$lang->id]->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
                }

                if (!count($error)) {
                    if (!$research->save()) {
                        foreach ($research->getMessages() as $message) {
                            $this->flashSession->error($message);
                        }
                    } else {
                        foreach ($languages as $key => $lang) {
                            $researcheslang[$lang->id]->research_id = $research->id;
                            $researcheslang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(WEB_ADMIN_URL.'/researches');
                    }
                }else{
                    foreach ($error as $value) {
                        $this->flashSession->error($value);
                    }
                }
            }else{
                $this->flashSession->error("Token không chính xác");
            }
        }

        $this->view->languages = $languages;
        $this->view->research_content = $research_content;
        $this->view->formslang = $formslang;
        $this->view->form_research = $form_research;
        $this->view->research = $research;
        $this->view->researcheslang = $researcheslang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->get_js_css();
    }

    public function deleteAction($id = null){
        if ($research = \Researches::findFirstId($id)) {
            $research->deleted = 1;
            if (!$research->save()) {
                if ($this->request->isAjax()) {
                    foreach ($research->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $data['error'] = $error;
                    $this->response->setStatusCode(400, 'error');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    foreach ($research->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                    return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $research->toArray();
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                    $this->flashSession->success("Xóa bài viết khoản thành công");
                    return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
                }

            }
        }else{
            if ($this->request->isAjax()) {
                $data['error'] = 'Không tìm thấy bài viết';
                $this->response->setStatusCode(404, 'Not found');
                $this->response->setJsonContent($data);
                return $this->response->send();
            } else {
                $this->flashSession->error("Không tìm thấy bài viết");
                return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
            }
        }
    }

    // =================================
    // API
    // =================================

    public function getdataAction(){
        if($this->request->isAjax()){
            $deptid = $this->session->get('deptid');
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'r.id',
                'r.slug',
                'r.status',
                'r.deptid',
                'r.createdat',
                'rl.excerpt excerpt',
                'rl.title title',
                'rl.content content',
            ))
            ->from(['r' => 'Researches'])
            ->where("r.deleted = 0 AND r.deptid = {$deptid}")
            ->leftJoin('ResearchesLang', 'pl.research_id = r.id AND rl.langid = 1','rl')
            ->orderBy('r.deptid ASC, r.createdat DESC');
    
            $search = 'rl.title LIKE :search:';
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
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/admins/researches.js');
    }
}