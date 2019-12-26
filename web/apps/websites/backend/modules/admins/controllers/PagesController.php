<?php
namespace Backend\Modules\Admins\Controllers;
use Models\Pages;
use Models\PagesLang;
use Models\Language;
use Backend\Modules\Admins\Forms\PagesForm;
use Backend\Modules\Admins\Forms\PagesLangForm;

class PagesController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function updateAction($id = 0){
        $forms_lang = [];
        $pages_lang = [];
        $page_content = [];
        $languages = Language::find(['status = 1']);
        if($id){
            if(!$page = Pages::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $page->updated_at = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $page_lang = PagesLang::findFirst(['page_id = :id: AND lang_id = :lang_id:','bind' => ['id' => $page->id, 'lang_id' => $lang->id]]);
                if($page_lang){
                    $form_lang = new PagesLangForm($page_lang);
                    $pages_lang[$lang->id] = $page_lang;
                    $forms_lang[$lang->id] = $form_lang;
                    $page_content[$lang->id] = $page_lang->content;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $page = new Pages();
            $page->author = $this->session->get('user_id');
            $page->dept_id = $this->session->get('dept_id');
            $page->created_at = date('Y-m-d H:i:s');
            $page->updated_at = $page->created_at;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $forms_lang[$lang->id] = new PagesLangForm();
                $pages_lang[$lang->id] = new PagesLang();
                $page_content[$lang->id] = '';
            }
        }

        $form_page = new PagesForm($page);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_title = $this->request->getPost('title');
                $p_slug = $this->request->getPost('slug');
                $p_content = $this->request->getPost('content');
                $p_excerpt = $this->request->getPost('excerpt');
                $req_page = [
                    'status' => $this->request->getPost('status'),
                    'slug' => $p_slug ? $p_slug : $this->helper->slugify($p_title[1]),
                    'featured_image' => $this->request->getPost('featured_image'),
                    'background_image' => $this->request->getPost('background_image'),
                    'attribute_id' => $this->request->getPost('attribute_id'),
                ];

                $form_page->bind($req_page, $page);
                if (!$form_page->isValid()) {
                    foreach ($form_page->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                $check_slug = Pages::findFirst([
                    "slug = :slug: AND id != :id:",
                    "bind" => [
                        "slug" => $req_page['slug'],
                        'id'    => $id,
                    ]
                ]);
    
                if($check_slug){
                    $req_page['slug'] = $req_page['slug'] .'-'. strtotime('now'); 
                }

                foreach ($languages as $key => $lang) {
                    $req_page_lang[$lang->id] = [
                        'title' => $p_title[$lang->id],
                        'content' => $p_content[$lang->id],
                        'excerpt' => $p_excerpt[$lang->id],
                        'lang_id' => $lang->id,
                    ];

                    $forms_lang[$lang->id]->bind($req_page_lang[$lang->id], $pages_lang[$lang->id]);
                    if (!$forms_lang[$lang->id]->isValid()) {
                        foreach ($forms_lang[$lang->id]->getMessages() as $message) {
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
                            $pages_lang[$lang->id]->page_id = $page->id;
                            $pages_lang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(BACKEND_URL.'/pages');
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
        $this->view->forms_lang = $forms_lang;
        $this->view->form_page = $form_page;
        $this->view->page = $page;
        $this->view->pages_lang = $pages_lang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->get_js_css();
    }

    public function deleteAction($id = null){
        if ($page = Pages::findFirstId($id)) {
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
                    return $this->response->redirect(BACKEND_URL.'/trashs');
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
            $npPages = Pages::getNamepace();
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                $npPages.'.id',
                $npPages.'.slug',
                $npPages.'.attribute_id',
                $npPages.'.status',
                $npPages.'.dept_id',
                $npPages.'.created_at',
                'PL.excerpt excerpt',
                'PL.title title',
                'PL.content content',
            ))
            ->from($npPages)
            ->where("$npPages.deleted = 0 AND $npPages.dept_id = $dept_id")
            ->leftJoin('Models\PagesLang', 'PL.page_id = '.$npPages.'.id AND PL.lang_id = 1','PL')
            ->orderBy($npPages.'.dept_id ASC, '.$npPages.'.created_at DESC');
    
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
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/pages.js');
    }
}