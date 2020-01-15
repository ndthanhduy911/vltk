<?php
namespace Backend\Modules\Admins\Controllers;
use Models\Researches;
use Models\ResearchesLang;
use Models\Language;
use Backend\Modules\Admins\Forms\ResearchesForm;
use Backend\Modules\Admins\Forms\ResearchesLangForm;

class ResearchesController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function updateAction($id = 0){
        $forms_lang = [];
        $researches_lang = [];
        $research_content = [];
        $languages = Language::find(['status = 1']);
        if($id){
            if(!$research = Researches::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $research->updated_at = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $research_lang = ResearchesLang::findFirst(['research_id = :id: AND lang_id = :lang_id:','bind' => ['id' => $research->id, 'lang_id' => $lang->id]]);
                if($research_lang){
                    $form_lang = new ResearchesLangForm($research_lang);
                    $researches_lang[$lang->id] = $research_lang;
                    $forms_lang[$lang->id] = $form_lang;
                    $research_content[$lang->id] = $research_lang->content;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $research = new Researches();
            $research->dept_id = $this->session->get('dept_id');
            $research->created_at = date('Y-m-d H:i:s');
            $research->updated_at = $research->created_at;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $forms_lang[$lang->id] = new ResearchesLangForm();
                $researches_lang[$lang->id] = new ResearchesLang();
                $research_content[$lang->id] = '';
            }
        }

        $form_research = new ResearchesForm($research);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_title = $this->request->getPost('title');
                $p_slug = $this->request->getPost('slug');
                $p_content = $this->request->getPost('content');
                $p_excerpt = $this->request->getPost('excerpt');
                $req_research = [
                    'status' => $this->request->getPost('status'),
                    'slug' => $p_slug ? $p_slug : $this->helper->slugify($p_title[1]),
                    'featured_image' => $this->request->getPost('featured_image'),
                    'background_image' => $this->request->getPost('background_image')
                ];

                $check_slug = Researches::findFirst([
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
                    $req_research_lang[$lang->id] = [
                        'title' => $p_title[$lang->id],
                        'content' => $p_content[$lang->id],
                        'excerpt' => $p_excerpt[$lang->id],
                        'lang_id' => $lang->id,
                    ];

                    $forms_lang[$lang->id]->bind($req_research_lang[$lang->id], $researches_lang[$lang->id]);
                    if (!$forms_lang[$lang->id]->isValid()) {
                        foreach ($forms_lang[$lang->id]->getMessages() as $message) {
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
                            $researches_lang[$lang->id]->research_id = $research->id;
                            $researches_lang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(BACKEND_URL.'/researches');
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
        $this->view->forms_lang = $forms_lang;
        $this->view->form_research = $form_research;
        $this->view->research = $research;
        $this->view->researches_lang = $researches_lang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->get_js_css();
    }

    public function deleteAction($id = null){
        if ($research = Researches::findFirstId($id)) {
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
                    return $this->response->redirect(BACKEND_URL.'/trashs');
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
                    return $this->response->redirect(BACKEND_URL.'/trashs');
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
                return $this->response->redirect(BACKEND_URL.'/trashs');
            }
        }
    }

    // =================================
    // API
    // =================================

    public function getdataAction(){
        if($this->request->isAjax()){
            $dept_id = $this->session->get('dept_id');
            $npResearches = Researches::getNamepace();
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                $npResearches.'.id',
                $npResearches.'.slug',
                $npResearches.'.status',
                $npResearches.'.dept_id',
                $npResearches.'.created_at',
                'PL.excerpt excerpt',
                'PL.title title',
                'PL.content content',
            ))
            ->from($npResearches)
            ->where("$npResearches.deleted = 0 AND $npResearches.dept_id = $dept_id")
            ->leftJoin('Models\ResearchesLang', 'PL.research_id = '.$npResearches.'.id AND PL.lang_id = 1','PL')
            ->orderBy($npResearches.'.dept_id ASC, '.$npResearches.'.created_at DESC');
    
            $search = 'PL.title LIKE :search:';
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
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/researches.js');
    }
}