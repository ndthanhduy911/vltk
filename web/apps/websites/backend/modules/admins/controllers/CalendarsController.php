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
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$calendar = \Calendars::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $calendar->begin_date = $this->helper->datetime_vn($calendar->begin_date);
            $calendar->updated_at = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $calendar_lang = \CalendarsLang::findFirst(['calendar_id = :id: AND lang_id = :lang_id:','bind' => ['id' => $calendar->id, 'lang_id' => $lang->id]]);
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
            $calendar = new \Calendars();
            $calendar->dept_id = $this->session->get('dept_id');
            $calendar->created_at = date('Y-m-d H:i:s');
            $calendar->updated_at = $calendar->created_at;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $forms_lang[$lang->id] = new CalendarsLangForm();
                $calendars_lang[$lang->id] = new \CalendarsLang();
                $calendar_content[$lang->id] = '';
            }
        }

        $form_calendar = new CalendarsForm($calendar);
        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $error = [];
                $p_excerpt = $this->request->getPost('excerpt',['string','trim']);
                $req_calendar = [
                    'status' => $this->request->getPost('status'),
                    'featured_image' => $this->request->getPost('featured_image',['string','trim']),
                    'background_image' => $this->request->getPost('background_image',['string','trim']),
                    'class_id' => $this->request->getPost('class_id',['int','trim']),
                    'subject_id' => $this->request->getPost('subject_id',['int','trim']),
                    'year' => $this->request->getPost('year',['int','trim']),
                    'semester' => $this->request->getPost('semester',['string','trim']),
                    'location' => $this->request->getPost('location',['string','trim']),
                    'begin_date' => $this->request->getPost('begin_date',['string','trim']),
                    'day' => $this->request->getPost('day',['string','trim']),
                    'begin_time' => $this->request->getPost('begin_time',['string','trim']),
                    'end_time' => $this->request->getPost('end_time',['string','trim']),
                    'room' => $this->request->getPost('room',['string','trim']),
                ];

                $form_calendar->bind($req_calendar, $calendar);
                if (!$form_calendar->isValid()) {
                    foreach ($form_calendar->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                }

                foreach ($languages as $key => $lang) {
                    $req_calendar_lang[$lang->id] = [
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
                    $calendar->begin_date = $this->helper->datetime_mysql($calendar->begin_date);
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
                        return $this->response->redirect(WEB_ADMIN_URL.'/calendars');
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
        if ($calendar = \Calendars::findFirstId($id)) {
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
                    return $this->response->redirect(WEB_ADMIN_URL.'/trashs');
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
            $dept_id = $this->session->get('dept_id');
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'c.id',
                'c.status',
                'c.dept_id',
                'c.created_at',
                'c.class_id',
                'c.subject_id',
                'c.year',
                'c.created_at',
                'c.semester',
                'c.location',
                'c.begin_date',
                'c.day',
                'c.begin_time',
                'c.room',
                'c.end_time',
                'cl.excerpt excerpt',
                'sl.title subject_name',
                'cll.title class_name',
            ))
            ->from(['c' => 'Calendars'])
            ->where("c.deleted = 0 AND c.dept_id = {$dept_id}")
            ->leftJoin('CalendarsLang', 'cl.calendar_id = c.id AND cl.lang_id = 1','cl')
            ->leftJoin('SubjectsLang', 'sl.subject_id = c.subject_id AND sl.lang_id = 1','sl')
            ->leftJoin('ClassesLang', 'cll.class_id = c.class_id AND cll.lang_id = 1','cll')
            ->orderBy('c.dept_id ASC, c.created_at DESC');
    
            $search = 'cl.excerpt LIKE :search:';
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
        $this->assets->addJs($this->config->apCLication->baseUri.'/assets/backend/js/modules/calendars.js');
    }
}