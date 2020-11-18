<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\BannerForm;
use Backend\Modules\Admins\Forms\BannerLangForm;


class BannerController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function updateAction($id = 0){
        $formslang = [];
        $bannerslang = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$banner = \Banner::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $banner->updatedat = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $bannerlang = \BannerLang::findFirst(['bannerid = :id: AND langid = :langid:','bind' => ['id' => $banner->id, 'langid' => $lang->id]]);
                if($bannerlang){
                    $formlang = new BannerLangForm($bannerlang);
                    $bannerslang[$lang->id] = $bannerlang;
                    $formslang[$lang->id] = $formlang;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $banner = new \Banner();
            $banner->deptid = $this->session->get('deptid');
            $banner->createdat = date('Y-m-d H:i:s');
            $banner->updatedat = $banner->createdat;
            $title = 'Thêm mới';
            foreach ($languages as $lang) {
                $formslang[$lang->id] = new BannerLangForm();
                $bannerslang[$lang->id] = new \BannerLang();
            }
        }

        $form_banner = new BannerForm($banner);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_name = $this->request->getPost('name',['string','trim']);
                $p_description = $this->request->getPost('description',['string','trim']);
                $p_button_text = $this->request->getPost('button_text',['string','trim']);
                $req_banner = [
                    'status' => $this->request->getPost('status',['int','trim']),
                    'image' => $this->request->getPost('image',['string','trim']),
                    'buttonlink' => $this->request->getPost('buttonlink',['string','trim']),
                ];

                $form_banner->bind($req_banner, $banner);
                if (!$form_banner->isValid()) {
                    foreach ($form_banner->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }
                foreach ($languages as $key => $lang) {
                    $req_bannerlang[$lang->id] = [
                        'name' => $p_name[$lang->id],
                        'description' => $p_description[$lang->id],
                        'button_text' => $p_button_text[$lang->id],
                        'langid' => $lang->id,
                    ];

                    $formslang[$lang->id]->bind($req_bannerlang[$lang->id], $bannerslang[$lang->id]);
                    if (!$formslang[$lang->id]->isValid()) {
                        foreach ($formslang[$lang->id]->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
                }

                if (!count($error)) {
                    if (!$banner->save()) {
                        foreach ($banner->getMessages() as $message) {
                            $this->flashSession->error($message);
                        }
                    } else {
                        foreach ($languages as $key => $lang) {
                            $bannerslang[$lang->id]->bannerid = $banner->id;
                            $bannerslang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(WEB_ADMIN_URL.'/banner');
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
        $this->view->formslang = $formslang;
        $this->view->form_banner = $form_banner;
        $this->view->banner = $banner;
        $this->view->bannerslang = $bannerslang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->get_js_css();
    }

    public function deleteAction($id = null){
        if ($banner = \Banner::findFirstId($id)) {
            $banner->deleted = 1;
            if (!$banner->save()) {
                if ($this->request->isAjax()) {
                    foreach ($banner->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $data['error'] = $error;
                    $this->response->setStatusCode(400, 'error');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    foreach ($banner->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                    return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $banner->toArray();
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
                'b.id',
                'b.deptid',
                'b.image',
                'b.buttonlink',
                'b.deptid',
                'b.status',
                'b.createdat',
                'bl.name name',
                'bl.description description',
                'bl.button_text button_text',
            ))
            ->from(['b' => 'Banner'])
            ->where("b.deleted = 0 AND b.deptid = {$deptid}")
            ->leftJoin('BannerLang', 'bl.bannerid = b.id AND bl.langid = 1','bl')
            ->orderBy('b.deptid ASC, b.status DESC');

    
            $search = 'bl.name LIKE :search:';
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
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/admins/banner.js');
    }
}