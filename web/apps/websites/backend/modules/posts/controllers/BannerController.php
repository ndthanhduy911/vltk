<?php
namespace Backend\Modules\Posts\Controllers;
use Models\Language;
use Backend\Modules\Posts\Forms\BannerForm;
use Backend\Modules\Posts\Forms\BannerLangForm;
use Models\Banner;
use Models\BannerLang;

class BannerController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function updateAction($id = 0){
        $forms_lang = [];
        $banners_lang = [];
        $languages = Language::find(['status = 1']);
        if($id){
            if(!$banner = Banner::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $banner->updated_at = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $banner_lang = BannerLang::findFirst(['banner_id = :id: AND lang_id = :lang_id:','bind' => ['id' => $banner->id, 'lang_id' => $lang->id]]);
                if($banner_lang){
                    $form_lang = new BannerLangForm($banner_lang);
                    $banners_lang[$lang->id] = $banner_lang;
                    $forms_lang[$lang->id] = $form_lang;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $banner = new Banner();
            $banner->dept_id = $this->session->get('dept_id');
            $banner->created_at = date('Y-m-d H:i:s');
            $banner->updated_at = $banner->created_at;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $forms_lang[$lang->id] = new BannerLangForm();
                $banner_lang[$lang->id] = new BannerLang();
            }
        }

        $form_banner = new BannerForm($banner);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_name = $this->request->getPost('name');
                $p_description = $this->request->getPost('description');
                $req_banner = [
                    'status' => $this->request->getPost('status'),
                    'image' => $this->request->getPost('image'),
                    'link' => $this->request->getPost('link'),
                ];

                $form_banner->bind($req_banner, $banner);
                if (!$form_banner->isValid()) {
                    foreach ($form_banner->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                foreach ($languages as $key => $lang) {
                    $req_banner_lang[$lang->id] = [
                        'name' => $p_name[$lang->id],
                        'description' => $p_description[$lang->id],
                        'lang_id' => $lang->id,
                    ];

                    $forms_lang[$lang->id]->bind($req_banner_lang[$lang->id], $banners_lang[$lang->id]);
                    if (!$forms_lang[$lang->id]->isValid()) {
                        foreach ($forms_lang[$lang->id]->getMessages() as $message) {
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
                            $banners_lang[$lang->id]->banner_id = $banner->id;
                            $banners_lang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(BACKEND_URL.'/banner');
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
        $this->view->forms_lang = $forms_lang;
        $this->view->form_banner = $form_banner;
        $this->view->banner = $banner;
        $this->view->banners_lang = $banners_lang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->get_js_css();
    }

    public function deleteAction($id = null){
        if ($banner = Banner::findFirstId($id)) {
            if (!$banner->delete()) {
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
                    return $this->response->redirect(BACKEND_URL.'/trashs');
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
            $npBanner = Banner::getNamepace();
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                $npBanner.'.id',
                $npBanner.'.dept_id',
                $npBanner.'.image',
                $npBanner.'.button_link',
                $npBanner.'.dept_id',
                $npBanner.'.status',
                $npBanner.'.created_at',
                'BL.name name',
                'BL.description description',
                'BL.button_text button_text',
            ))
            ->from($npBanner)
            ->where("$npBanner.deleted = 0 AND $npBanner.dept_id = $dept_id")
            ->leftJoin('Models\BannerLang', 'BL.banner_id = '.$npBanner.'.id AND BL.lang_id = 1','BL')
            ->orderBy($npBanner.'.dept_id ASC, '.$npBanner.'.status DESC');

    
            $search = 'BL.name LIKE :search:';
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
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/banner.js');
    }
}