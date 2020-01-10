<?php
namespace Backend\Modules\Admins\Controllers;
use Models\Calendars;
use Models\CalendarsLang;
use Models\Language;
use Backend\Modules\Admins\Forms\CalendarsForm;
use Backend\Modules\Admins\Forms\CalendarsLangForm;

class CalendarsController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function updateAction($id = 0){
        $forms_lang = [];
        $calendars_lang = [];
        $calendar_content = [];
        $languages = Language::find(['status = 1']);
        if($id){
            if(!$calendar = Calendars::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $calendar->updated_at = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $calendar_lang = CalendarsLang::findFirst(['calendar_id = :id: AND lang_id = :lang_id:','bind' => ['id' => $calendar->id, 'lang_id' => $lang->id]]);
                if($calendar_lang){
                    $form_lang = new CalendarsLangForm($calendar_lang);
                    $calendars_lang[$lang->id] = $calendar_lang;
                    $forms_lang[$lang->id] = $form_lang;
                    $calendar_content[$lang->id] = $calendar_lang->content;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $calendar = new Calendars();
            $calendar->author = $this->session->get('user_id');
            $calendar->dept_id = $this->session->get('dept_id');
            $calendar->created_at = date('Y-m-d H:i:s');
            $calendar->updated_at = $calendar->created_at;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $forms_lang[$lang->id] = new CalendarsLangForm();
                $calendars_lang[$lang->id] = new CalendarsLang();
                $calendar_content[$lang->id] = '';
            }
        }

        $form_calendar = new CalendarsForm($calendar);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_title = $this->request->getPost('title');
                $p_slug = $this->request->getPost('slug');
                $p_content = $this->request->getPost('content');
                $p_excerpt = $this->request->getPost('excerpt');
                $req_calendar = [
                    'status' => $this->request->getPost('status'),
                    'slug' => $p_slug ? $p_slug : $this->helper->slugify($p_title[1]),
                    'featured_image' => $this->request->getPost('featured_image'),
                    'background_image' => $this->request->getPost('background_image')
                ];

                $form_calendar->bind($req_calendar, $calendar);
                if (!$form_calendar->isValid()) {
                    foreach ($form_calendar->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                $check_slug = Calendars::findFirst([
                    "slug = :slug: AND id != :id:",
                    "bind" => [
                        "slug" => $req_calendar['slug'],
                        'id'    => $id,
                    ]
                ]);
    
                if($check_slug){
                    $req_calendar['slug'] = $req_calendar['slug'] .'-'. strtotime('now'); 
                }

                foreach ($languages as $key => $lang) {
                    $req_calendar_lang[$lang->id] = [
                        'title' => $p_title[$lang->id],
                        'content' => $p_content[$lang->id],
                        'excerpt' => $p_excerpt[$lang->id],
                        'lang_id' => $lang->id,
                    ];

                    $forms_lang[$lang->id]->bind($req_calendar_lang[$lang->id], $calendars_lang[$lang->id]);
                    if (!$forms_lang[$lang->id]->isValid()) {
                        foreach ($forms_lang[$lang->id]->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
                }

                if (!count($error)) {
                    if (!$calendar->save()) {
                        foreach ($calendar->getMessages() as $message) {
                            $this->flashSession->error($message);
                        }
                    } else {
                        foreach ($languages as $key => $lang) {
                            $calendars_lang[$lang->id]->calendar_id = $calendar->id;
                            $calendars_lang[$lang->id]->save();
                        }
                        $this->flashSession->success($title." thành công");
                        return $this->response->redirect(BACKEND_URL.'/calendars');
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
        $this->view->calendar_content = $calendar_content;
        $this->view->forms_lang = $forms_lang;
        $this->view->form_calendar = $form_calendar;
        $this->view->calendar = $calendar;
        $this->view->calendars_lang = $calendars_lang;
        $this->view->title = $title;
        $this->assets->addJs('/elfinder/js/require.min.js');
        $this->get_js_css();
    }

    public function deleteAction($id = null){
        if ($calendar = Calendars::findFirstId($id)) {
            $calendar->deleted = 1;
            if (!$calendar->save()) {
                if ($this->request->isAjax()) {
                    foreach ($calendar->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $data['error'] = $error;
                    $this->response->setStatusCode(400, 'error');
                    $this->response->setJsonContent($data);
                    return $this->response->send();
                } else {
                    foreach ($calendar->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                    return $this->response->redirect(BACKEND_URL.'/trashs');
                }
            }else{
                if ($this->request->isAjax()) {
                    $data['data'] = $calendar->toArray();
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
            $npCalendars = Calendars::getNamepace();
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                $npCalendars.'.id',
                $npCalendars.'.slug',
                $npCalendars.'.status',
                $npCalendars.'.dept_id',
                $npCalendars.'.created_at',
                'PL.excerpt excerpt',
                'PL.title title',
                'PL.content content',
            ))
            ->from($npCalendars)
            ->where("$npCalendars.deleted = 0 AND $npCalendars.dept_id = $dept_id")
            ->leftJoin('Models\CalendarsLang', 'PL.calendar_id = '.$npCalendars.'.id AND PL.lang_id = 1','PL')
            ->orderBy($npCalendars.'.dept_id ASC, '.$npCalendars.'.created_at DESC');
    
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
        $this->assets->addJs($this->config->application->baseUri.'/assets/backend/js/modules/calendars.js');
    }
}