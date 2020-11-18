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
        $formslang = [];
        $classeslang = [];
        $class_content = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$class = \Classes::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $class->updatedat = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $classlang = \ClassesLang::findFirst(['classid = :id: AND langid = :langid:','bind' => ['id' => $class->id, 'langid' => $lang->id]]);
                if($classlang){
                    $formlang = new ClassesLangForm($classlang);
                    $classeslang[$lang->id] = $classlang;
                    $formslang[$lang->id] = $formlang;
                    $class_content[$lang->id] = $classlang->content;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $class = new \Classes();
            $class->deptid = $this->session->get('deptid');
            $class->createdat = date('Y-m-d H:i:s');
            $class->updatedat = $class->createdat;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $formslang[$lang->id] = new ClassesLangForm();
                $classeslang[$lang->id] = new \ClassesLang();
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
                    $req_classlang[$lang->id] = [
                        'title' => $p_title[$lang->id],
                        'content' => $p_content[$lang->id],
                        'excerpt' => $p_excerpt[$lang->id],
                        'langid' => $lang->id,
                    ];

                    $formslang[$lang->id]->bind($req_classlang[$lang->id], $classeslang[$lang->id]);
                    if (!$formslang[$lang->id]->isValid()) {
                        foreach ($formslang[$lang->id]->getMessages() as $message) {
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
                            $classeslang[$lang->id]->classid = $class->id;
                            $classeslang[$lang->id]->save();
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
        $this->view->formslang = $formslang;
        $this->view->form_class = $form_class;
        $this->view->class = $class;
        $this->view->classeslang = $classeslang;
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
            $deptid = $this->session->get('deptid');
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'c.id',
                'c.slug',
                'c.status',
                'c.deptid',
                'c.createdat',
                'cl.excerpt excerpt',
                'cl.title title',
                'cl.content content',
            ))
            ->from(['c' => 'Classes'])
            ->where("c.deleted = 0 AND c.deptid = {$deptid}")
            ->leftJoin('ClassesLang', 'cl.classid = c.id AND cl.langid = 1','cl')
            ->orderBy('c.deptid ASC, c.createdat DESC');
    
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
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/admins/classes.js');
    }
}