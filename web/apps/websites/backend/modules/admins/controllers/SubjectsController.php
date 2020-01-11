<?php
namespace Backend\Modules\Admins\Controllers;
use Models\Subjects;
use Models\SubjectsLang;
use Models\Language;
use Backend\Modules\Admins\Forms\SubjectsForm;
use Backend\Modules\Admins\Forms\SubjectsLangForm;

class SubjectsController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function updateAction($id = 0){
        $forms_lang = [];
        $subjects_lang = [];
        $subject_content = [];
        $languages = Language::find(['status = 1']);
        if($id){
            if(!$subject = Subjects::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $subject->updated_at = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $subject_lang = SubjectsLang::findFirst(['subject_id = :id: AND lang_id = :lang_id:','bind' => ['id' => $subject->id, 'lang_id' => $lang->id]]);
                if($subject_lang){
                    $form_lang = new SubjectsLangForm($subject_lang);
                    $subjects_lang[$lang->id] = $subject_lang;
                    $forms_lang[$lang->id] = $form_lang;
                    $subject_content[$lang->id] = $subject_lang->content;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $subject = new Subjects();
            $subject->author = $this->session->get('user_id');
            $subject->dept_id = $this->session->get('dept_id');
            $subject->created_at = date('Y-m-d H:i:s');
            $subject->updated_at = $subject->created_at;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $forms_lang[$lang->id] = new SubjectsLangForm();
                $subjects_lang[$lang->id] = new SubjectsLang();
                $subject_content[$lang->id] = '';
            }
        }

        $form_subject = new SubjectsForm($subject);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_title = $this->request->getPost('title');
                $p_slug = $this->request->getPost('slug');
                $p_content = $this->request->getPost('content');
                $p_excerpt = $this->request->getPost('excerpt');
                $req_subject = [
                    'status' => $this->request->getPost('status'),
                    'code' => $this->request->getPost('code'),
                    'slug' => $p_slug ? $p_slug : $this->helper->slugify($p_title[1]),
                    'featured_image' => $this->request->getPost('featured_image'),
                    'background_image' => $this->request->getPost('background_image')
                ];

                $form_subject->bind($req_subject, $subject);
                if (!$form_subject->isValid()) {
                    foreach ($form_subject->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                $check_slug = Subjects::findFirst([
                    "slug = :slug: AND id != :id:",
                    "bind" => [
                        "slug" => $req_subject['slug'],
                        'id'    => $id,
                    ]
                ]);
    
                if($check_slug){
                    $req_subject['slug'] = $req_subject['slug'] .'-'. strtotime('now'); 
                }

                foreach ($languages as $key => $lang) {
                    $req_subject_lang[$lang->id] = [
                        'title' => $p_title[$lang->id],
                        'content' => $p_content[$lang->id],
                        'excerpt' => $p_excerpt[$lang->id],
                        'lang_id' => $lang->id,
                    ];

                    $forms_lang[$lang->id]->bind($req_subject_lang[$lang->id], $subjects_lang[$lang->id]);
                    if (!$forms_lang[$lang->id]->isValid()) {
                        foreach ($forms_lang[$lang->id]->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
                }

                if (!count($error)) {
                    if (!$subject->save()) {
                        foreach ($subject->getMessages() as $message) {
                            $this->flashSession->error($message);
                        }
                    } else {
                        foreach ($languages as $key => $lang) {
                            $subjects_lang[$lang->id]->subject_id = $subject->id;
                            $subjects_lang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(BACKEND_URL.'/subjects');
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
        $this->view->subject_content = $subject_content;
        $this->view->forms_lang = $forms_lang;
        $this->view->form_subject = $form_subject;
        $this->view->subject = $subject;
        $this->view->subjects_lang = $subjects_lang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->get_js_css();
    }

    public function deleteAction($id = null){
        if ($subject = Subjects::findFirstId($id)) {
            $subject->deleted = 1;
            if (!$subject->save()) {
                if ($this->request->isAjax()) {
                    foreach ($subject->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $data['error'] = $error;
                    $this->response->setStatusCode(400, 'error');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    foreach ($subject->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                    return $this->response->redirect(BACKEND_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $subject->toArray();
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
            $npSubjects = Subjects::getNamepace();
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                $npSubjects.'.id',
                $npSubjects.'.slug',
                $npSubjects.'.status',
                $npSubjects.'.code',
                $npSubjects.'.dept_id',
                $npSubjects.'.created_at',
                'PL.excerpt excerpt',
                'PL.title title',
                'PL.content content',
            ))
            ->from($npSubjects)
            ->where("$npSubjects.deleted = 0 AND $npSubjects.dept_id = $dept_id")
            ->leftJoin('Models\SubjectsLang', 'PL.subject_id = '.$npSubjects.'.id AND PL.lang_id = 1','PL')
            ->orderBy($npSubjects.'.dept_id ASC, '.$npSubjects.'.created_at DESC');
    
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
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/subjects.js');
    }
}