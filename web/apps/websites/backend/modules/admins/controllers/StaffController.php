<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\StaffForm;
use Backend\Modules\Admins\Forms\StaffLangForm;

class StaffController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function updateAction($id = 0){
        $forms_lang = [];
        $staffs_lang = [];
        $staff_content = [];
        $languages = \Language::find(['status = 1']);
        $deptid = $this->session->get('deptid');
        if($id){
            if(!$staff = \Staff::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $staff->updatedat = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $staff_lang = \StaffLang::findFirst(['staff_id = :id: AND langid = :langid:','bind' => ['id' => $staff->id, 'langid' => $lang->id]]);
                if($staff_lang){
                    $form_lang = new StaffLangForm($staff_lang);
                    $staffs_lang[$lang->id] = $staff_lang;
                    $forms_lang[$lang->id] = $form_lang;
                    $staff_content[$lang->id] = $staff_lang->content;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $staff = new \Staff();
            $staff->deptid = $this->session->get('deptid');
            $staff->createdat = date('Y-m-d H:i:s');
            $staff->updatedat = $staff->createdat;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $forms_lang[$lang->id] = new StaffLangForm();
                $staffs_lang[$lang->id] = new \StaffLang();
                $staff_content[$lang->id] = '';
            }
        }

        $form_staff = new StaffForm($staff);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_title = $this->request->getPost('title',['string','trim']);
                $p_slug = $this->request->getPost('slug',['string','trim']);
                $p_content = $this->request->getPost('content',['trim']);
                $req_staff = [
                    'status' => $this->request->getPost('status',['int','trim']),
                    'slug' => $p_slug ? $p_slug : $this->helper->slugify($p_title[1]),
                    'featured_image' => $this->request->getPost('featured_image',['string','trim']),
                    'dept_position' => $this->request->getPost('dept_position',['string','trim']),
                    'email' => $this->request->getPost('email',['string','trim']),
                    'sort' => $this->request->getPost('sort',['int','trim']),
                    'deptid' => $this->request->getPost('deptid',['int','trim'])
                ];

                if($deptid == 1){
                    $req_staff['dean'] = $this->request->getPost('dean',['string','trim']);
                }

                $check_slug = \Staff::findFirst([
                    "slug = :slug: AND id != :id:",
                    "bind" => [
                        "slug" => $req_staff['slug'],
                        'id'    => $id,
                    ]
                ]);
    
                if($check_slug){
                    $req_staff['slug'] = $req_staff['slug'] .'-'. strtotime('now'); 
                }

                $form_staff->bind($req_staff, $staff);
                if (!$form_staff->isValid()) {
                    foreach ($form_staff->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }



                foreach ($languages as $key => $lang) {
                    $req_staff_lang[$lang->id] = [
                        'title' => $p_title[$lang->id],
                        'content' => $p_content[$lang->id],
                        'langid' => $lang->id,
                    ];

                    $forms_lang[$lang->id]->bind($req_staff_lang[$lang->id], $staffs_lang[$lang->id]);
                    if (!$forms_lang[$lang->id]->isValid()) {
                        foreach ($forms_lang[$lang->id]->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
                }

                if (!count($error)) {
                    if (!$staff->save()) {
                        foreach ($staff->getMessages() as $message) {
                            $this->flashSession->error($message);
                        }
                    } else {
                        foreach ($languages as $key => $lang) {
                            $staffs_lang[$lang->id]->staff_id = $staff->id;
                            $staffs_lang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(WEB_ADMIN_URL.'/staff');
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
        $this->view->staff_content = $staff_content;
        $this->view->forms_lang = $forms_lang;
        $this->view->form_staff = $form_staff;
        $this->view->staff = $staff;
        $this->view->staffs_lang = $staffs_lang;
        $this->view->title = $title;
        $this->view->deptid = $deptid;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->get_js_css();
    }

    public function deleteAction($id = null){
        if ($staff = \Staff::findFirstId($id)) {
            $staff->deleted = 1;
            if (!$staff->save()) {
                if ($this->request->isAjax()) {
                    foreach ($staff->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $data['error'] = $error;
                    $this->response->setStatusCode(400, 'error');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    foreach ($staff->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                    return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $staff->toArray();
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
                's.id',
                's.slug',
                's.featured_image',
                's.status',
                's.deptid',
                's.email',
                's.dean',
                's.dept_position',
                's.createdat',
                'sl.title title',
                'sl.content content',
                'd.name dept_name',
            ))
            ->from(['s'=>'Staff'])
            ->where("s.deleted = 0");
            
            if($deptid != 1){
                $data = $data->andWhere("s.deptid = $deptid");
            }

            $data = $data->leftJoin('DeptsLang', 'd.deptid = s.deptid AND d.langid = 1','d')
            ->leftJoin('StaffLang', 'sl.staff_id = s.id AND sl.langid = 1','sl')
            ->orderBy("s.dean ASC, s.deptid ASC, s.dept_position ASC");
    
            $search = 'sl.title LIKE :search:';
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
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/admins/staff.js');
    }
}