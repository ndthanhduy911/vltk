<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\ClassesForm;
use Backend\Modules\Admins\Forms\ClassesLangForm;

class ClassesController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function updateAction($id = 0){
        $forms_lang = [];
        $classes_lang = [];
        $class_content = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$class = \Classes::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $class->updated_at = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $class_lang = \ClassesLang::findFirst(['class_id = :id: AND lang_id = :lang_id:','bind' => ['id' => $class->id, 'lang_id' => $lang->id]]);
                if($class_lang){
                    $form_lang = new ClassesLangForm($class_lang);
                    $classes_lang[$lang->id] = $class_lang;
                    $forms_lang[$lang->id] = $form_lang;
                    $class_content[$lang->id] = $class_lang->content;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $class = new \Classes();
            $class->dept_id = $this->session->get('dept_id');
            $class->created_at = date('Y-m-d H:i:s');
            $class->updated_at = $class->created_at;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $forms_lang[$lang->id] = new ClassesLangForm();
                $classes_lang[$lang->id] = new \ClassesLang();
                $class_content[$lang->id] = '';
            }
        }

        $form_class = new ClassesForm($class);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_title = $this->request->getPost('title',['string','trim']);
                $p_slug = $this->request->getPost('slug',['string','trim']);
                $p_content = $this->request->getPost('content',['trim']);
                $p_excerpt = $this->request->getPost('excerpt',['string','trim']);
                $req_class = [
                    'status' => $this->request->getPost('status',['string','trim']),
                    'slug' => $p_slug ? $p_slug : $this->helper->slugify($p_title[1]),
                    'background_image' => $this->request->getPost('background_image',['string','trim']),
                    'code' => $this->request->getPost('code',['string','trim']),
                    
                ];

                $form_class->bind($req_class, $class);
                if (!$form_class->isValid()) {
                    foreach ($form_class->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                $check_slug = \Classes::findFirst([
                    "slug = :slug: AND id != :id:",
                    "bind" => [
                        "slug" => $req_class['slug'],
                        'id'    => $id,
                    ]
                ]);
    
                if($check_slug){
                    $req_class['slug'] = $req_class['slug'] .'-'. strtotime('now'); 
                }

                foreach ($languages as $key => $lang) {
                    $req_class_lang[$lang->id] = [
                        'title' => $p_title[$lang->id],
                        'content' => $p_content[$lang->id],
                        'excerpt' => $p_excerpt[$lang->id],
                        'lang_id' => $lang->id,
                    ];

                    $forms_lang[$lang->id]->bind($req_class_lang[$lang->id], $classes_lang[$lang->id]);
                    if (!$forms_lang[$lang->id]->isValid()) {
                        foreach ($forms_lang[$lang->id]->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
                }

                if (!count($error)) {
                    if (!$class->save()) {
                        foreach ($class->getMessages() as $message) {
                            $this->flashSession->error($message);
                        }
                    } else {
                        foreach ($languages as $key => $lang) {
                            $classes_lang[$lang->id]->class_id = $class->id;
                            $classes_lang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(WEB_ADMIN_URL.'/classes');
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
        $this->view->class_content = $class_content;
        $this->view->forms_lang = $forms_lang;
        $this->view->form_class = $form_class;
        $this->view->class = $class;
        $this->view->classes_lang = $classes_lang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->get_js_css();
    }

    public function deleteAction($id = null){
        if ($class = \Classes::findFirstId($id)) {
            $class->deleted = 1;
            if (!$class->save()) {
                if ($this->request->isAjax()) {
                    foreach ($class->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $data['error'] = $error;
                    $this->response->setStatusCode(400, 'error');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    foreach ($class->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                    return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $class->toArray();
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
            $dept_id = $this->session->get('dept_id');
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'c.id',
                'c.slug',
                'c.status',
                'c.dept_id',
                'c.created_at',
                'cl.excerpt excerpt',
                'cl.title title',
                'cl.content content',
            ))
            ->from(['c' => 'Classes'])
            ->where("c.deleted = 0 AND c.dept_id = {$dept_id}")
            ->leftJoin('ClassesLang', 'cl.class_id = c.id AND cl.lang_id = 1','cl')
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