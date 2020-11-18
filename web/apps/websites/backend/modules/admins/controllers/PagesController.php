<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\PagesForm;
use Backend\Modules\Admins\Forms\PagesLangForm;

class PagesController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function updateAction($id = 0){
        $formslang = [];
        $pageslang = [];
        $page_content = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$page = \Pages::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $page->updatedat = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $pagelang = \PagesLang::findFirst(['page_id = :id: AND langid = :langid:','bind' => ['id' => $page->id, 'langid' => $lang->id]]);
                if($pagelang){
                    $formlang = new PagesLangForm($pagelang);
                    $pageslang[$lang->id] = $pagelang;
                    $formslang[$lang->id] = $formlang;
                    $page_content[$lang->id] = $pagelang->content;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $page = new \Pages();
            $page->author = $this->session->get('user_id');
            $page->deptid = $this->session->get('deptid');
            $page->createdat = date('Y-m-d H:i:s');
            $page->updatedat = $page->createdat;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $formslang[$lang->id] = new PagesLangForm();
                $pageslang[$lang->id] = new \PagesLang();
                $page_content[$lang->id] = '';
            }
        }

        $form_page = new PagesForm($page);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_title = $this->request->getPost('title',['string','trim']);
                $p_slug = $this->request->getPost('slug',['string','trim']);
                $p_content = $this->request->getPost('content',['trim']);
                $p_excerpt = $this->request->getPost('excerpt',['string','trim']);
                $req_page = [
                    'status' => $this->request->getPost('status',['string','trim']),
                    'slug' => $p_slug ? $p_slug : $this->helper->slugify($p_title[1]),
                    'image' => $this->request->getPost('image',['string','trim']),
                    'background_image' => $this->request->getPost('background_image',['string','trim']),
                    'attribute_id' => (int)$this->request->getPost('attribute_id',['int','trim']),
                ];

                $check_slug = \Pages::findFirst([
                    "slug = :slug: AND id != :id:",
                    "bind" => [
                        "slug" => $req_page['slug'],
                        'id'    => $id,
                    ]
                ]);

                if($check_slug){
                    $req_page['slug'] = $req_page['slug'] .'-'. strtotime('now'); 
                }

                $form_page->bind($req_page, $page);
                if (!$form_page->isValid()) {
                    foreach ($form_page->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                foreach ($languages as $key => $lang) {
                    $req_pagelang[$lang->id] = [
                        'title' => $p_title[$lang->id],
                        'content' => $p_content[$lang->id],
                        'excerpt' => $p_excerpt[$lang->id],
                        'langid' => $lang->id,
                    ];

                    $formslang[$lang->id]->bind($req_pagelang[$lang->id], $pageslang[$lang->id]);
                    if (!$formslang[$lang->id]->isValid()) {
                        foreach ($formslang[$lang->id]->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
                }

                if (!count($error)) {
                    if (!$page->save()) {
                        foreach ($page->getMessages() as $message) {
                            $this->flashSession->error($message);
                        }
                    } else {
                        foreach ($languages as $key => $lang) {
                            $pageslang[$lang->id]->page_id = $page->id;
                            $pageslang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(WEB_ADMIN_URL.'/pages');
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
        $this->view->page_content = $page_content;
        $this->view->formslang = $formslang;
        $this->view->form_page = $form_page;
        $this->view->page = $page;
        $this->view->pageslang = $pageslang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->get_js_css();
    }

    public function deleteAction($id = null){
        if ($page = \Pages::findFirstId($id)) {
            $page->deleted = 1;
            if (!$page->save()) {
                if ($this->request->isAjax()) {
                    foreach ($page->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $data['error'] = $error;
                    $this->response->setStatusCode(400, 'error');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    foreach ($page->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                    return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $page->toArray();
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
                'p.id',
                'p.slug',
                'p.attribute_id',
                'p.status',
                'p.deptid',
                'p.createdat',
                'pl.excerpt excerpt',
                'pl.title title',
                'pl.content content',
            ))
            ->from(['p' => 'Pages'])
            ->where("p.deleted = 0 AND p.deptid = {$deptid}")
            ->leftJoin('PagesLang', 'pl.page_id = p.id AND pl.langid = 1','pl')
            ->orderBy('p.deptid ASC, p.createdat DESC');
    
            $search = 'pl.title LIKE :search:';
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
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/admins/pages.js');
    }
}