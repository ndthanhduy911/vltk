<?php
namespace Backend\Modules\Posts\Controllers;
use Models\Categories;
use Models\CategoriesLang;
use Backend\Modules\Posts\Forms\CategoriesForm;

class CategoriesController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function getdataAction(){
        if($this->request->isAjax()){
            $npCat = Categories::getNamepace();
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                $npCat.'.id',
                'CL.name name',
                $npCat.'.slug',
                'CL.description description',
                $npCat.'.status',
                $npCat.'.created_at',
                'U.name author_name',
                'D.name dept_name',
            ))
            ->from($npCat)
            ->join('Models\Users', 'U.id = '.$npCat.'.author','U')
            ->join('Models\Departments', 'D.id = '.$npCat.'.dept_id','D')
            ->join('Models\CategoriesLang', 'CL.cat_id = '.$npCat.'.id AND CL.lang_id = 1','CL')
            ->orderBy($npCat.'.dept_id ASC')
            ->where("1 = 1");
            // if($this->session->get('role') !== 1){
            //     $data = $data->andWhere("dept_id IN (".implode(',',$this->session->get('dept_mg')).")");
            // }
    
            $search = $npCat.'.name LIKE :search:';
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
        $forms_lang = [];
        $posts_lang = [];
        $languages = Language::find(['status = 1']);
        if($id){
            if(!$category = Categories::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $category->updated_at = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $cat_lang = CategoriesLang::findFirst(['cat_id = :id: AND lang_id = :lang_id:','bind' => ['id' => $category->id, 'lang_id' => $lang->id]]);
                if($cat_lang){
                    $form_lang = new CategoriesLangForm($cat_lang);
                    $posts_lang[$lang->id] = $cat_lang;
                    $forms_lang[$lang->id] = $form_lang;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $category = new Categories();
            $category->author = $this->session->get('user_id');
            $category->dept_id = $this->session->get('dept_id');
            $category->created_at = date('Y-m-d H:i:s');
            $category->updated_at = $category->created_at;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $forms_lang[$lang->id] = new CategoriesLangForm();
                $cat_lang[$lang->id] = new CategoriesLang();
            }
        }

        $form_cat = new CategoriesForm($category);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
                $error = [];
                $c_name = $this->request->getPost('name');
                $c_description = $this->request->getPost('description');
                $req_cat = [
                    'slug' => $this->request->getPost('slug'),
                    'status' => $this->request->getPost('status'),
                ];

                $form_cat->bind($req_cat, $category);
                if (!$form->isValid()) {
                    foreach ($form->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                $check_slug = Categories::findFirst([
                    "slug = :slug: AND id != :id:",
                    "bind" => [
                        "slug" => $req['slug'],
                        'id'    => $id,
                    ]
                ]);

                if($check_slug){
                    $req_post['slug'] = $req_post['slug'] .'-'. strtotime(); 
                }

                foreach ($languages as $key => $lang) {
                    $req_cat_lang[$lang->id] = [
                        'name' => $c_name[$lang->id],
                        'description' => $c_description[$lang->id],
                        'lang_id' => $lang->id,
                    ];

                    $forms_lang[$lang->id]->bind($req_post_lang[$lang->id], $posts_lang[$lang->id]);
                    if (!$forms_lang[$lang->id]->isValid()) {
                        foreach ($forms_lang[$lang->id]->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
                }

                if (!count($error)) {
                    if (!$category->save()) {
                        if ($this->request->isAjax()) {
                            foreach ($category->getMessages() as $message) {
                                array_push($error, $message->getMessage());
                            }
                            $data['error'] = $error;
                            $this->response->setStatusCode(400, 'error');
                            $this->response->setJsonContent($data);
                            return $this->response->send();
                        } else {
                            foreach ($category->getMessages() as $message) {
                                $this->flashSession->error($message);
                            }
                        }
                    } else {
                        if ($this->request->isAjax()) {
                            $data['data'] = $category->toArray();
                            $this->response->setStatusCode(200, 'OK');
                            $this->response->setJsonContent($data);
                            return $this->response->send();
                        } else {
                            // $this->logs->write_log(1, 1, 'Thêm dây chuyền ID: ' . $category->id, json_encode($category->toArray()), $this->session->get("user_id"));
                            $this->flashSession->success("Cập nhật thành công");
                            // return $this->response->redirect('page');
                        }
                    }
                }else{
                    if ($this->request->isAjax()) {
                        $data['error'] = $error;
                        $this->response->setStatusCode(400, 'error');
                        $this->response->setJsonContent($data);
                        return $this->response->send();
                    } else {
                        foreach ($error as $value) {
                            $this->flashSession->error($value . ". ");
                        }
                    }
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
                    $data['error'] = ['Token không chính xác'];
                    $this->response->setStatusCode(400, 'error');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    $this->flashSession->error("Token không chính xác");
                }
            }
        }
        $this->view->form = $form;
        $this->view->cat = $category;
        $this->get_js_css();
    }

    public function deleteAction($id = null){
        
        if ($cat = Categories::findFirstId($id) && !in_array((int)$id, [1,2,3,4,5])) {
            $cat->status = 4;
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
                    return $this->response->redirect(BACKEND_URL.'/trashs');
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
                    return $this->response->redirect(BACKEND_URL.'/posts');
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
                return $this->response->redirect(BACKEND_URL.'/posts');
            }
        }
        
    }

    private function get_js_css (){
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/categories.js');
    }
}