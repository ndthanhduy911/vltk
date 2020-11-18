<?php
namespace Backend\Modules\Admins\Controllers;
use Backend\Modules\Admins\Forms\CalendarsForm;
use Backend\Modules\Admins\Forms\CalendarsLangForm;

class CalendarsController  extends \BackendController {

    public function indexAction(){
        $this->get_js_css();
        // $this->view->form = new UserForm();
    }

    public function updateAction($id = 0){
        $formslang = [];
        $calendarslang = [];
        $calendar_content = [];
        $languages = \Language::find(['status = 1']);
        if($id){
            if(!$calendar = \Calendars::findFirstId($id)){
                echo 'Không tìm thấy dữ liệu'; die;
            }
            $calendar->begindate = $this->helper->datetimeVn($calendar->begindate);
            $calendar->updatedat = date('Y-m-d H:i:s');
            $title = 'Cập nhật';
            foreach ($languages as $key => $lang) {
                $calendarlang = \CalendarsLang::findFirst(['calendarid = :id: AND langid = :langid:','bind' => ['id' => $calendar->id, 'langid' => $lang->id]]);
                if($calendarlang){
                    $formlang = new CalendarsLangForm($calendarlang);
                    $calendarslang[$lang->id] = $calendarlang;
                    $formslang[$lang->id] = $formlang;
                    $calendar_content[$lang->id] = $calendarlang->content;
                }else{
                    echo 'Nội dung không phù hợp'; die;
                }
            }   
        }else{
            $calendar = new \Calendars();
            $calendar->deptid = $this->session->get('deptid');
            $calendar->createdat = date('Y-m-d H:i:s');
            $calendar->updatedat = $calendar->createdat;
            $title = 'Thêm mới';
            foreach ($languages as $key => $lang) {
                $formslang[$lang->id] = new CalendarsLangForm();
                $calendarslang[$lang->id] = new \CalendarsLang();
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
                    'image' => $this->request->getPost('image',['string','trim']),
                    'background_image' => $this->request->getPost('background_image',['string','trim']),
                    'classid' => $this->request->getPost('classid',['int','trim']),
                    'subjectid' => $this->request->getPost('subjectid',['int','trim']),
                    'year' => $this->request->getPost('year',['int','trim']),
                    'semester' => $this->request->getPost('semester',['string','trim']),
                    'location' => $this->request->getPost('location',['string','trim']),
                    'begindate' => $this->request->getPost('begindate',['string','trim']),
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
                    $req_calendarlang[$lang->id] = [
                        'excerpt' => $p_excerpt[$lang->id],
                        'langid' => $lang->id,
                    ];

                    $formslang[$lang->id]->bind($req_calendarlang[$lang->id], $calendarslang[$lang->id]);
                    if (!$formslang[$lang->id]->isValid()) {
                        foreach ($formslang[$lang->id]->getMessages() as $message) {
                            array_push($error, $message->getMessage());
                        }
                    }
                }

                if (!count($error)) {
                    $calendar->begindate = $this->helper->datetimeMysql($calendar->begindate);
                    if (!$calendar->save()) {
                        foreach ($calendar->getMessages() as $message) {
                            $this->flashSession->error($message);
                        }
                    } else {
                        foreach ($languages as $key => $lang) {
                            $calendarslang[$lang->id]->calendarid = $calendar->id;
                            $calendarslang[$lang->id]->save();
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
        $this->view->formslang = $formslang;
        $this->view->form_calendar = $form_calendar;
        $this->view->calendar = $calendar;
        $this->view->calendarslang = $calendarslang;
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
            $deptid = $this->session->get('deptid');
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'c.id',
                'c.status',
                'c.deptid',
                'c.createdat',
                'c.classid',
                'c.subjectid',
                'c.year',
                'c.createdat',
                'c.semester',
                'c.location',
                'c.begindate',
                'c.day',
                'c.begin_time',
                'c.room',
                'c.end_time',
                'cl.excerpt excerpt',
                'sl.title subject_name',
                'cll.title class_name',
            ))
            ->from(['c' => 'Calendars'])
            ->where("c.deleted = 0 AND c.deptid = {$deptid}")
            ->leftJoin('CalendarsLang', 'cl.calendarid = c.id AND cl.langid = 1','cl')
            ->leftJoin('SubjectsLang', 'sl.subjectid = c.subjectid AND sl.langid = 1','sl')
            ->leftJoin('ClassesLang', 'cll.classid = c.classid AND cll.langid = 1','cll')
            ->orderBy('c.deptid ASC, c.createdat DESC');
    
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
        $this->assets->addJs($this->config->apCLication->baseUri.'/assets/backend/js/modules/admins/calendars.js');
    }
}