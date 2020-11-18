<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\CategoriesForm;
use Backend\Modules\Admins\Forms\CategoriesLangForm;


class CategoriesController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function getdataAction(){
        if($this->request->isAjax()){
            $deptid = $this->session->get('deptid');
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'c.id',
                'cl.name name',
                'c.slug',
                'cl.description description',
                'c.status',
                'c.createdat',
                'u.name author_name',
            ))
            ->from(['c' => "Categories"])
            ->where("c.deleted = 0 AND c.deptid = {$deptid}")
            ->leftJoin('Users', 'u.id = c.author','u')
            ->leftJoin('CategoriesLang', 'cl.catid = c.id AND cl.langid = 1','cl')
            ->orderBy('c.deptid ASC');
    
            $search = 'c.name LIKE :search:';
            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent($this->ssp->data_output($this->request->get(), $data,$search));
            return $this->response->send();
        }else{
            $this->response->setStatusCode(403, 'Failed');
            $this->response->setJsonContent(['Truy cập không được phép']);
            return $this->response->send();
        }
    }

    public function updateAction($id = 0){
        $formslang = [];
        $catslang = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$category = \Categories::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $category->updatedat = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $catlang = \CategoriesLang::findFirst(['catid = :id: AND langid = :langid:','bind' => ['id' => $category->id, 'langid' => $lang->id]]);
                if($catlang){
                    $formlang = new CategoriesLangForm($catlang);
                    $catslang[$lang->id] = $catlang;
                    $formslang[$lang->id] = $formlang;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }
            $form_cat = new CategoriesForm($category);   
        }else{
        $category = new \Categories();
            $category->author = $this->session->get('user_id');
            $category->deptid = $this->session->get('deptid');
            $category->createdat = date('Y-m-d H:i:s');
            $category->updatedat = $category->createdat;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $formslang[$lang->id] = new CategoriesLangForm();
                $catslang[$lang->id] = new \CategoriesLang();
            }
            $form_cat = new CategoriesForm($category);
        }
        if ($this->request->isPost()) {
            // if ($this->security->checkToken()) {
                // $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
                $error = [];
                $c_name = $this->request->getPost('name',['string','trim']);
                $c_slug = $this->request->getPost('slug',['string','trim']);
                $c_description = $this->request->getPost('description',['string','trim']);
                $req_cat = [
                    'slug' => $c_slug ? $c_slug : $this->helper->slugify($c_name[1]),
                    'image' => $this->request->getPost('image',['string','trim']),
                    'status' => $this->request->getPost('status',['int','trim']),
                ];
                
                $check_slug = \Categories::findFirst([
                    "slug = :slug: AND id != :id:",
                    "bind" => [
                        "slug" => $req_cat['slug'],
                        'id'    => $id,
                    ]
                ]);

                if($check_slug){
                    $req_cat['slug'] = $req_cat['slug'] .'-'. strtotime('now'); 
                }

                $form_cat->bind($req_cat, $category);
                if (!$form_cat->isValid()) {
                    foreach ($form_cat->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }



                foreach ($languages as $key => $lang) {
                    $req_catlang[$lang->id] = [
                        'name' => $c_name[$lang->id],
                        'description' => $c_description[$lang->id],
                        'langid' => $lang->id,
                    ];
                    $formslang[$lang->id]->bind($req_catlang[$lang->id], $catslang[$lang->id]);
                    if (!$formslang[$lang->id]->isValid()) {
                        foreach ($formslang[$lang->id]->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
                }

                if (!count($error)) {
                    if (!$category->save()) {
                        foreach ($category->getMessages() as $message) {
                            $this->flashSession->error($message);
                        }
                    } else {
                        foreach ($languages as $key => $lang) {
                            $catslang[$lang->id]->catid = $category->id;
                            $catslang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(WEB_ADMIN_URL.'/categories');
                    }
                }else{
                    foreach ($error as $value) {
                        $this->flashSession->error($value . ". ");
                    }
                }
            // }else{
            //     $this->flashSession->error("Token không chính xác");
            // }
        }
        $this->view->languages = $languages;
        $this->view->formslang = $formslang;
        $this->view->form_cat = $form_cat;
        $this->view->catslang = $catslang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->get_js_css();
    }

    public function deleteAction($id = 0){
        
        if (!in_array((int)$id, [1,2,3,4,5]) && $cat = \Categories::findFirstId($id)) {
            $cat->deleted = 1;
            if (!$cat->save()) {
                if ($this->request->isAjax()) {
                    foreach ($cat->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $data['error'] = $error;
                    $this->response->setStatusCode(400, 'error');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    foreach ($cat->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                    return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $cat->toArray();
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                    $this->flashSession->success("Chuyển bài viết đến thùng rác thành công");
                    return $this->response->redirect(WEB_ADMIN_URL.'/posts');
                }
            }
        }else{
            if ($this->request->isAjax()) {
                $data['error'] = 'Không tìm thấy bài viết';
                $this->response->setStatusCode(404, 'Not found');
                $this->response->setJsonContent($data);
                return $this->response->send();
            } else {
                // $this->logs->write_log(3, 1, 'Xóa trang', json_encode($save),$this->session->get("user_id"));
                $this->flashSession->error("Không tìm thấy bài viết");
                return $this->response->redirect(WEB_ADMIN_URL.'/posts');
            }
        }
    }

    private function get_js_css (){
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/admins/categories.js');
    }
}