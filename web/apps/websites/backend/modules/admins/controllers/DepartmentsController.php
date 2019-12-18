<?php
namespace Backend\Modules\Admins\Controllers;
use Models\Language;
use Backend\Modules\Admins\Forms\DepartmentsForm;
use Backend\Modules\Admins\Forms\DepartmentsLangForm;
use Models\Departments;
use Models\DepartmentsLang;

class DepartmentsController  extends \BackendController {

    public function updateAction(){
        $forms_lang = [];
        $departments_lang = [];
        $languages = Language::find(['status = 1']);
        $dept_id = $this->session->get('dept_id');
        if(!$department = Departments::findFirstId($dept_id)){
            echo 'Không tìm thấy dữ liệu'; die;
        }
        $department->updated_at = date('Y-m-d H:i:s');
        $title = 'Cài đặt';
        foreach ($languages as $key => $lang) {
            $department_lang = DepartmentsLang::findFirst(['dept_id = :dept_id: AND lang_id = :lang_id:','bind' => ['dept_id' => $department->id, 'lang_id' => $lang->id]]);
            if($department_lang){
                $form_lang = new DepartmentsLangForm($department_lang);
                $departments_lang[$lang->id] = $department_lang;
                $forms_lang[$lang->id] = $form_lang;
            }else{
                echo 'Nội dung không phù hợp'; die;
            }
        }   

        $form_department = new DepartmentsForm($department);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_name = $this->request->getPost('name');
                $p_description = $this->request->getPost('description');
                $p_address = $this->request->getPost('address');
                $req_department = [
                    'status' => 1,
                    'level' => 0,
                    'slug' => $department->slug,
                    'phone' => $this->request->getPost('phone'),
                    'email' => $this->request->getPost('email'),
                    'code' => $this->request->getPost('code'),
                    'image' => $this->request->getPost('image'),
                    'logo' => $this->request->getPost('logo'),
                    'post_connect' => 0,
                ];

                if($dept_id != 1){
                    $req_department['post_connect'] = $this->request->getPost('post_connect');
                    $req_department['post_connect'] = $req_department['post_connect'] ? $req_department['post_connect'] : 0;
                }

                $form_department->bind($req_department, $department);
                if (!$form_department->isValid()) {
                    foreach ($form_department->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                foreach ($languages as $key => $lang) {
                    $req_department_lang[$lang->id] = [
                        'name' => $p_name[$lang->id],
                        'description' => $p_description[$lang->id],
                        'address' => $p_address[$lang->id],
                        'lang_id' => $lang->id,
                    ];

                    $forms_lang[$lang->id]->bind($req_department_lang[$lang->id], $departments_lang[$lang->id]);
                    if (!$forms_lang[$lang->id]->isValid()) {
                        foreach ($forms_lang[$lang->id]->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
                }

                if (!count($error)) {
                    if (!$department->save()) {
                        foreach ($department->getMessages() as $message) {
                            $this->flashSession->error($message);
                        }
                    } else {
                        foreach ($languages as $key => $lang) {
                            $departments_lang[$lang->id]->department_id = $department->id;
                            $departments_lang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(BACKEND_URL.'/departments/update');
                    }
                }else{
                    foreach ($error as $value) {
                        $this->flashSession->error($value);
                    }
                }
            }else{
                $this->flashSession->error("Token không chính xác");
                return $this->response->redirect(BACKEND_URL."/departments/update");
            }
        }

        $this->view->languages = $languages;
        $this->view->forms_lang = $forms_lang;
        $this->view->form_department = $form_department;
        $this->view->department = $department;
        $this->view->departments_lang = $departments_lang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->get_js_css();
    }

    // =================================
    // FUNCTION
    // =================================

    private function get_js_css (){
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/departments.js');
    }
}