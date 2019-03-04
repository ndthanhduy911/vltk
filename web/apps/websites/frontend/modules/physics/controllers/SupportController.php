<?php

namespace Frontend\Modules\Physics\Controllers;

use Library\Helper\Helper;

use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\QueryBuilder as Paginator;
use Phalcon\Mvc\View;

use PHPExcel;
use PHPExcel_IOFactory;

use Models\Support;
use Models\CommentClient;
use Models\Client;
use Models\Department;
use Models\Package;
use Models\Ticket;
use Models\User;
use Models\GenaralSetting;
use Models\Notification;
use Frontend\Modules\Physics\Forms\RegisterForm;
use Frontend\Modules\Physics\Forms\SupportForm;

class SupportController extends \FrontendController
{

    // ===================================
    // VIEW
    // ===================================

    public function detailAction($id = null){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        if($support = Support::findFirstById($id)){
            while($notification = Notification::findFirst(['view = 0 AND support_id = '.$support->id])){
                $notification->view = 1;
                $notification->save();
            };
            $this->view->support = $support;
            $this->view->package = Package::find()->toArray();
            $this->view->user = User::find()->toArray();
            $this->view->department = Department::find()->toArray();
        }else{
            return $this->response->redirect('/');
        }
    }

    // ===================================
    // API
    // ===================================

    public function indexAction(){
        if ($this->request->isAjax() && $this->request->isPost()) {
            $this->view->disable();
            $supportObj = new Support();
            $support = new SupportForm();
            $post = $this->request->getPost();
            $client = Client::findFirstByEmail($this->session->get("emailAddress"));
            $support->bind($post, $supportObj);
            if (!$support->isValid()) {
                $error = [];
                foreach ($support->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            }
            $content = [];
            $files =[];
            foreach ($post as $key => $value) {
                if($key != 'id' && $key != 'package_id' && $key != 'req_package' && $key != 'note' && $key != 'req_priority' && $key != 'department_other' && $key != 'department_id' ){
                    $content[$key] = $value;
                }
            }
            if ($this->request->hasFiles() == true) {
                foreach ($this->request->getUploadedFiles() as $file){
                    if($file->getSize()){
                        $now = strtotime("now");
                        $file->moveTo(BASE_DIR.'/public_html/files/support/'.$now.'_'.$file->getName());
                        array_push($files,$now.'_'.$file->getName());
                    }
                }
            }
            $content['file']= json_encode($files);
            $supportObj->file = json_encode($files);
            $supportObj->content = json_encode($content);
            $supportObj->client_id = $client->id;
            $supportObj->status = 0;
            if($ticket = Ticket::findFirstByPackage_id((int)$supportObj->package_id)){
                $supportObj->ticket = $ticket->name.'-'.str_pad((int) $ticket->number,5,"0",STR_PAD_LEFT);
            }else{
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Lỗi mã hỗ trợ'],
                ]);
                return $this->response->send();
            }
            if (!$supportObj->save()) {
                $error = [];
                $ticket->number = (int)$ticket->number + 1;
                foreach ($supportObj->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            } else {
                $ticket->number = (int)$ticket->number + 1;
                $ticket->save();
                $department = Department::findFirstById($client->department_id);
                $body = $this->helper->getTextHaveRequest($client->name, $department->name , !empty($content['content'])?$post['content']:'Tạo tài khoản email mới');
                $this->helper->write_log(1, 2, 'Đã gửi yêu cầu <strong class="text-success">'.$supportObj->ticket.'</strong>',json_encode($supportObj->toArray()),$this->session->get("user_id"));
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent([
                    'support'   => $supportObj->toArray(),
                    'body'      => $body,
                    'title'     => 'YÊU CẦU HỖ TRỢ MỚI',
                    'users'     => json_decode(GenaralSetting::findFirstByName('email_setting')->value)->users,
                ]);
                return $this->response->send();
            }
        }else{
            if ($this->request->getQuery('single')) {
                $this->view->setRenderLevel(
                    View::LEVEL_ACTION_VIEW
                );
            }
            $this->view->form = new RegisterForm($client);
            $this->view->formSuport = new SupportForm();
        }
    }

    public function listAction(){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $emailAddress = $this->session->get('emailAddress');        
        if($client = Client::findFirstByEmail($emailAddress)){
            $this->view->user = User::find()->toArray();
            $this->view->supports = Support::find([
                'client_id = :client_id:',
                'order' => 'created_at DESC',
                'bind'      => [
                    'client_id' =>  $client->id
                ],
            ]);
        }
    }

    public function helpAction(){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
    }

    public function packageAction(){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $this->view->packages = Package::find(['status = 1','order' => 'location ASC']);
    }

    public function sendemailAction(){
        if ($this->request->isAjax() && $this->request->isPost()) {
            $this->view->disable();
            $post = $this->request->getPost();
            foreach ($post['users'] as $key => $id) {
                $user = User::findFirstById($id);
                $this->helper->send_email($user->fullname,$user->email,$post['title'],$post['body']);
            }
        }else{
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }

    public function editAction($support_id = null){
        if ($this->request->isAjax() && $this->request->isPost()) {
            $this->view->disable();
            $supportObj = Support::findFirst((int)$support_id);
            $supportSave = $supportObj;
            if(!$supportObj){
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Không tìm thấy hỗ trợ này'],
                ]);
                return $this->response->send();
            }
            $support = new SupportForm();
            $post = $this->request->getPost();
            $post['package_id'] = $supportObj->package_id;
            $post['req_package'] = $supportObj->req_package;
            $client = Client::findFirstByEmail($this->session->get("emailAddress"));
            if($client){
                $support->bind($post, $supportObj);
                if (!$support->isValid()) {
                    $error = [];
                    foreach ($support->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                }
                $content = [];
                $files =[];
                foreach ($post as $key => $value) {
                    if($key != 'id' && $key != 'package_id' && $key != 'req_package' && $key != 'note' && $key != 'priority' && $key != 'department_other' && $key != 'department_id' && $key != 'file_old' ){
                        $content[$key] = $value;
                    }
                }
                $post['file_old'] = json_decode($post['file_old']);
                if(empty($post['file_old'])){
                    $file_old = json_decode($supportObj->file);
                    if(!empty($file_old)){
                        foreach ($file_old as $key => $value) {
                            unlink(BASE_DIR.'/public_html/files/support/'.$value);
                        }
                    }
                }else{
                    $file_old = json_decode($supportObj->file);
                    foreach ($post['file_old'] as $key => $value) {
                        if(array_search($value , $commentObj->file) === false){
                            return $this->response->setStatusCode(500, 'Bad Request');
                        }else{
                            array_push($files,$value);
                        }
                    }
                    foreach ($file_old as $key => $value) {
                        if(array_search($value,$post['file_old'])===false){
                            unlink(BASE_DIR.'/public_html/files/support/'.$value);
                        }
                    }
                }
                if ($this->request->hasFiles() == true) {
                    foreach ($this->request->getUploadedFiles() as $file){
                        if($file->getSize()){
                            $now = strtotime("now");
                            $file->moveTo(BASE_DIR.'/public_html/files/support/'.$now.'_'.$file->getName());
                            array_push($files,$now.'_'.$file->getName());
                        }
                    }
                }
                $content['file']= json_encode($files);
                $supportObj->file = json_encode($files);
                $supportObj->content = json_encode($content);
                $supportObj->client_id = $client->id;
                $supportObj->updated_at = date('Y-m-d');
                if (!$supportObj->save()) {
                    $error = [];
                    $ticket->number = (int)$ticket->number + 1;
                    foreach ($supportObj->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $this->helper->write_log(2, 2, 'Đã cập nhật lại yêu cầu <strong class="text-info">'.$supportSave->ticket.'</strong>',json_encode($supportSave->toArray()),$this->session->get("user_id"));
                    $department = Department::findFirstById($client->department_id);
                    $assign_person_id = json_decode($supportObj->assign_person_id);
                    $body = $this->helper->getTextUpdateRequest($client->name, $department->name , !empty($content['content'])?$post['content']:'Tạo tài khoản email mới');
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'support' => $supportObj->toArray(),
                        'body'      => $body,
                        'title'     => 'CẬP NHẬT YÊU CẦU HỖ TRỢ',
                        'users'     => $assign_person_id ? json_decode($supportObj->assign_person_id) : json_decode(GenaralSetting::findFirstByName('email_setting')->value)->users,
                    ]);
                    return $this->response->send();
                }
            }else{
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Vui lòng đăng nhập đúng tài khoản'],
                ]);
                return $this->response->send();
            }
        }else{
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }

    public function formdefaultAction($pack_id = null){
        $this->view->setRenderLevel(
            View::LEVEL_ACTION_VIEW
        );
        
        if( $this->request->isAjax() && !empty($_FILES['importfile'])){
            $filepath = '';
            foreach ($this->request->getUploadedFiles() as $file){
                if($file->getSize()){
                    $now = strtotime("now");
                    $filepath = BASE_DIR.'/public_html/files/temp/'.$now.'_'.$file->getName();
                    $file->moveTo($filepath);
                }
            }
            error_reporting(E_ALL);
            ini_set('display_errors', TRUE);
            ini_set('display_startup_errors', TRUE);
            define('EOL',(PHP_SAPI == 'cli') ? PHP_EOL : '<br />');
            date_default_timezone_set('Asia/Ho_Chi_Minh');

            $objPHPExcel = new PHPExcel();
            $objPHPExcel = PHPExcel_IOFactory::load($filepath);

            $pack_id = $objPHPExcel->getActiveSheet()->getCell('A4')->getValue();
            $req_package = $objPHPExcel->getActiveSheet()->getCell('B4')->getValue();
            $support = [];
            $support['department_id'] = $objPHPExcel->getActiveSheet()->getCell('C4')->getValue();
            $support['note'] = $objPHPExcel->getActiveSheet()->getCell('H4')->getValue();
            $support['priority'] = $objPHPExcel->getActiveSheet()->getCell('G4')->getValue();

            if(!$pack_id){
                unlink($filepath);
                $this->view->disable();
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['ID dịch vụ không chính xác'],
                ]);
                return $this->response->send();
            }
            if(!$req_package){
                unlink($filepath);
                $this->view->disable();
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Loại yêu cầu không chính xác'],
                ]);
                return $this->response->send();
            }
            if($support['department_id']){
                if(!Department::findFirstById($support['department_id'])){
                    unlink($filepath);
                    $this->view->disable();
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => ['Mã đơn vị không chính xác'],
                    ]);
                    return $this->response->send();
                }
            }
            if($support['priority']){
                $priority = [
                    'low',
                    'normal',
                    'height',
                    'urgent'
                ];
                if(array_search($support['priority'],$priority) === false){
                    unlink($filepath);
                    $this->view->disable();
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => ['Mức độ khẩn cấp không chính xác'],
                    ]);
                    return $this->response->send();
                }
            }

            if($pack_id == 2 && $req_package == "update"){
                $content = [];
                $content['req_name_create'] = $objPHPExcel->getActiveSheet()->getCell('D4')->getValue();
                $content['req_phone'] = $objPHPExcel->getActiveSheet()->getCell('E4')->getValue();
                $content['req_email'] = $objPHPExcel->getActiveSheet()->getCell('F4')->getValue();
                if($content['req_email'] && !filter_var($content['req_email'], FILTER_VALIDATE_EMAIL)){
                    unlink($filepath);
                    $this->view->disable();
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => ['Địa chỉ email không chính xác'],
                    ]);
                    return $this->response->send();
                }
            }else{
                $content = [];
                
                $content['req_name'] = $objPHPExcel->getActiveSheet()->getCell('D4')->getValue();
                $content['req_phone'] = $objPHPExcel->getActiveSheet()->getCell('E4')->getValue();
                $content['content'] = $objPHPExcel->getActiveSheet()->getCell('F4')->getValue();
            }

            $ticket = Ticket::findFirstByPackage_id($pack_id);
            $this->view->req_package = $req_package;
            $this->view->department = Department::find();
            $this->view->package = Package::findFirstById($pack_id);
            if($ticket){
                $support['ticket'] = $ticket->name.'-'.str_pad((int) $ticket->number,5,"0",STR_PAD_LEFT);
                $this->view->form = new SupportForm((object)$support);
            }else{
                $this->view->form = new SupportForm();
            }
            $this->view->content = (object)$content;
            $this->view->support = (object)$support;
            unlink($filepath);
        }else if(!empty($this->request->getQuery('support_id')) && $this->request->isAjax()){
            if($support = Support::findFirstById($this->request->getQuery('support_id'))){
                $content = json_decode($support->content);
                $this->view->form = new SupportForm($support);
                $this->view->content = $content;
                $this->view->support = $support;
                $this->view->req_package = $support->req_package;
                $this->view->department = Department::find();
                $this->view->package = Package::findFirstById($support->package_id);
            }
        }else if($this->request->isAjax() && !empty($this->request->getQuery('req_package'))){
            $ticket = Ticket::findFirstByPackage_id($pack_id);
            $this->view->req_package = $this->request->getQuery('req_package');
            $this->view->department = Department::find();
            $this->view->package = Package::findFirstById($pack_id);
            $this->view->client = Client::findFirstByEmail($this->session->get('emailAddress'));
            if($ticket){
                $this->view->form = new SupportForm((object)[
                    'ticket' => $ticket->name.'-'.str_pad((int) $ticket->number,5,"0",STR_PAD_LEFT),
                ]);
            }else{
                $this->view->form = new SupportForm();
            }
 
        }else{
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }

    public function getchartAction($client_id = null){
        if($this->request->isAjax()){
            $this->view->disable();
            $type = $this->request->get('type');
            $end = $this->request->get('end');
            $begin = $this->request->get('begin');
    
            $low = [];
            $normal = [];
            $height = [];
            $urgent = [];
            switch ($type) {
                case '1':{
                    if(!$begin && !$end){
                        $end = date('Y-m-d');
                        $begin = date('Y-m-d', strtotime('-6 days'));
                    }else{
                        $begin = date("Y-m-d", strtotime($begin));
                        $end = date("Y-m-d", strtotime($end));
                    }
            
                    $startTimeStamp = strtotime($begin);
                    $endTimeStamp = strtotime($end);
                    $timeDiff = abs($endTimeStamp - $startTimeStamp);
                    $number = $timeDiff/86400;  // 86400 seconds in one day
                    $number = intval($number);
            
                    $dataArray = Support::query()
                    ->columns(['COUNT(priority) as count','date(created_at) as date', 'priority'])
                    ->where("client_id = :client_id:")
                    ->andWhere("date(created_at) BETWEEN :begin: AND :end:")
                    ->orderBy('date')
                    ->bind(["client_id" => (int)$client_id, 'begin' => $begin, 'end' => $end])
                    ->groupBy(['date','priority'])
                    ->execute()->toArray();
    
                    for ($i=0; $i <= $number; $i++) {
                        $low[$i] = 0;
                        $normal[$i] = 0;
                        $height[$i] = 0;
                        $urgent[$i] = 0;
                        $date = date('Y-m-d', strtotime($end.' -'.($number-$i).' days'));
                        foreach ($dataArray as $key => $value) {
                            if($date == $value['date']){
                                switch ($value['priority']) {
                                    case 'low': $low[$i] = $value['count'];
                                    break;
                                    case 'normal': $normal[$i] = $value['count'];
                                    break;
                                    case 'height': $height[$i] = $value['count'];
                                    break;
                                    case 'urgent': $urgent[$i] = $value['count'];
                                    break;
                                }
                                unset($dataArray[$key]);
                            }else{
                                break;
                            }
                        }
                    }
                    break;
                }
                case '2':{
                    if(!$begin && !$end){
                        $end = date('Y-m');
                        $begin = date('Y-m', strtotime('-6 months'));
                    }else{
                        $begin = date("Y-m", strtotime($begin));
                        $end = date("Y-m", strtotime($end));
                    }
                    $number = $this->helper->countMonth(date("Y-m", strtotime($begin)),date("Y-m", strtotime($end)));
                    $dataArray = Support::query()
                    ->columns(['COUNT(priority) as count','created_at as created','month(created_at) as month', 'year(created_at) as year', 'priority'])
                    ->where("client_id = :client_id:")
                    ->andWhere("date(created_at) BETWEEN :begin: AND :end:")
                    ->orderBy('created')
                    ->bind(["client_id" => (int)$client_id, 'begin' => date("Y-m-d", strtotime($this->request->get('begin'))), 'end' => date("Y-m-d", strtotime($this->request->get('end')))])
                    ->groupBy(['year','month','priority'])
                    ->execute()->toArray();
                    $month = (int)date("m", strtotime($this->request->get('begin')));
                    $year = (int)date('Y', strtotime($begin));
                    for ($i=0; $i < $number; $i++) {
                        $low[$i] = 0;
                        $normal[$i] = 0;
                        $height[$i] = 0;
                        $urgent[$i] = 0;
                        if($month > 12){
                            $month -= 12;
                            $year += 1;
                        }
    
                        foreach ($dataArray as $key => $value) {
                            if($month == $value['month'] && $year == $value['year']){
                                switch ($value['priority']) {
                                    case 'low': $low[$i] = $value['count'];
                                    break;
                                    case 'normal': $normal[$i] = $value['count'];
                                    break;
                                    case 'height': $height[$i] = $value['count'];
                                    break;
                                    case 'urgent': $urgent[$i] = $value['count'];
                                    break;
                                }
                                unset($dataArray[$key]);
                            }else{
                                break;
                            }
                        }
                        $month += 1;
                        
                    }
                    break;
                }
                case '3':{
                    if(!$begin && !$end){
                        $end = date('Y');
                        $begin = date('Y', strtotime('-6 years'));
                    }else{
                        $begin = date("Y", strtotime($begin));
                        $end = date("Y", strtotime($end));
                    }
                    $number = (int)$end - (int)$begin + 1;
    
                    $dataArray = Support::query()
                    ->columns(['COUNT(priority) as count','date(created_at) as date','year(created_at) as year' , 'priority'])
                    ->where("client_id = :client_id:")
                    ->andWhere("date(created_at) BETWEEN :begin: AND :end:")
                    ->orderBy('date')
                    ->bind(["client_id" => (int)$client_id, 'begin' => date("Y-m-d", strtotime($this->request->get('begin'))), 'end' => date("Y-m-d", strtotime($this->request->get('end')))])
                    ->groupBy(['year','priority'])
                    ->execute()->toArray();
                    $year = (int)$begin;
                    for ($i=0; $i <= $number; $i++) {
                        $low[$i] = 0;
                        $normal[$i] = 0;
                        $height[$i] = 0;
                        $urgent[$i] = 0;
                        foreach ($dataArray as $key => $value) {
                            if($year === (int)$value['year']){
                                switch ($value['priority']) {
                                    case 'low': $low[$i] = $value['count'];
                                    break;
                                    case 'normal': $normal[$i] = $value['count'];
                                    break;
                                    case 'height': $height[$i] = $value['count'];
                                    break;
                                    case 'urgent': $urgent[$i] = $value['count'];
                                    break;
                                }
                                unset($dataArray[$key]);
                            }else{
                                break;
                            }
                        }
                        $year += 1;
                    }
                    break;
                }
                default:{
                    if(!$begin && !$end){
                        $end = date('Y-m-d');
                        $begin = date('Y-m-d', strtotime('-6 days'));
                    }else{
                        $begin = date("Y-m-d", strtotime($begin));
                        $end = date("Y-m-d", strtotime($end));
                    }
            
                    $startTimeStamp = strtotime($begin);
                    $endTimeStamp = strtotime($end);
                    $timeDiff = abs($endTimeStamp - $startTimeStamp);
                    $number = $timeDiff/86400;  // 86400 seconds in one day
                    $number = intval($number);
            
                    $dataArray = Support::query()
                    ->columns(['COUNT(priority) as count','date(created_at) as date', 'priority'])
                    ->where("client_id = :client_id:")
                    ->andWhere("date(created_at) BETWEEN :begin: AND :end:")
                    ->orderBy('date')
                    ->bind(["client_id" => (int)$client_id, 'begin' => $begin, 'end' => $end])
                    ->groupBy(['date','priority'])
                    ->execute()->toArray();
    
                    for ($i=0; $i <= $number; $i++) {
                        $low[$i] = 0;
                        $normal[$i] = 0;
                        $height[$i] = 0;
                        $urgent[$i] = 0;
                        $date = date('Y-m-d', strtotime($end.' -'.($number-$i).' days'));
                        foreach ($dataArray as $key => $value) {
                            if($date == $value['date']){
                                switch ($value['priority']) {
                                    case 'low': $low[$i] = $value['count'];
                                    break;
                                    case 'normal': $normal[$i] = $value['count'];
                                    break;
                                    case 'height': $height[$i] = $value['count'];
                                    break;
                                    case 'urgent': $urgent[$i] = $value['count'];
                                    break;
                                }
                                unset($dataArray[$key]);
                            }else{
                                break;
                            }
                        }
                    }
                    break;
                }
            }
    
            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent([
                'low' => $low,
                'normal' => $normal,
                'height' => $height,
                'urgent' => $urgent,
                'begin' => $begin,
                'end'  => $end
            ]);
            return $this->response->send();
        }else{
            return $this->response->redirect('/');
        }

    }

    public function assessAction($id = null){
        if($this->request->isAjax()){
            $this->view->disable();
            if($support = Support::findFirstById($id)){
                $supportSave = $support;
                if(!preg_match('/0|1|2/',$this->request->getPost('assess'))){
                    return $this->response->setStatusCode(403, ' Forbidden');
                }
                $support->assess = $this->request->getPost('assess');
                if (!$support->save()) {
                    $error = [];
                    foreach ($support->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $this->helper->write_log(2, 2, 'Đã đánh giá yêu cầu <strong class="text-info">'.$supportSave->ticket.'</strong>',json_encode($supportSave->toArray()),$this->session->get("user_id"));
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'status' => ['Thành công']
                    ]);
                    return $this->response->send();
                }
            }else{
                return $this->response->setStatusCode(403, ' Forbidden');
            }
        }
    }

    public function getcommentAction($id=null){
        if($this->request->isAjax()){
            $this->view->disable();
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'Models\CommentClient.id',
                'Models\CommentClient.user_id',
                'Models\CommentClient.type_user',
                'Models\CommentClient.support_id',
                'Models\CommentClient.content',
                'Models\CommentClient.file',
                'Models\CommentClient.created_at',
                'Models\CommentClient.updated_at',
                // 'U.fullname name',
                // 'U.email user_name',
                'S.id support_id'
            ))
            ->from('Models\CommentClient')
            // ->join('Models\User', 'U.id = Models\CommentClient.user_id','U')
            ->join('Models\Support', 'S.id = Models\CommentClient.support_id','S')
            ->where('S.id = '.$id)
            ->orderBy('Models\CommentClient.created_at ASC');
            $data = $data->getQuery()->execute();

            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent([
                'comment' => $data->toArray(),
            ]);
            return $this->response->send();
        }else{
            return $this->response->setStatusCode(403, ' Forbidden');
        }

    }

    public function sendcommentAction($id=null){
        if($this->request->isAjax()){
            $this->view->disable();
            $commentObj = new CommentClient();
            $commentObj->type_user = 3;
            $commentObj->content = $this->request->getPost('content');
            $commentObj->support_id = $id;
            $userID = $this->session->get('user_id');
            $commentObj->user_id = $userID;
            if ($this->request->hasFiles() == true) {
                $files =[];
                foreach ($this->request->getUploadedFiles() as $file){
                    if($file->getSize()){
                        $now = strtotime("now");
                        $file->moveTo(BASE_DIR.'/public_html/files/support/'.$now.'_'.$file->getName());
                        array_push($files,$now.'_'.$file->getName());
                    }
                }
                $commentObj->file = json_encode($files);
            }
            $commentObj->created_at = date('Y-m-d H:i:s');
            if (!$commentObj->save()) {
                $error = [];
                foreach ($commentObj->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            } else {
                $support = Support::findFirst($id);
                $assign_person_id = json_decode($support->assign_person_id);
                $this->helper->write_log(1, 2, 'Đã gửi tin nhắn cho yêu cầu có ID: <strong class="text-success">'.$id.'</strong>' ,json_encode($commentObj->toArray()),$this->session->get("user_id"));
                $client = Client::findFirstByEmail($this->session->get("emailAddress"));
                $department = Department::findFirstById($client->department_id);
                $body = $this->helper->getTextNewComment($client->name, $department->name , $this->request->getPost('content'));
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent([
                    'comment' => $commentObj->toArray(),
                    'email' => $this->session->get('emailAddress'),
                    'name'  => $this->session->get('fullName'),
                    'avatar' => $this->session->get('avatar'),
                    'body'      => $body,
                    'title'     => 'BÌNH LUẬN YÊU CẦU HỖ TRỢ',
                    'users'     => count($assign_person_id) ? $assign_person_id : json_decode(GenaralSetting::findFirstByName('email_setting')->value)->users,
                    'ticket'    => $support->ticket,
                ]);
                return $this->response->send();
            }
        }else{
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }

    public function editcommentAction($id=null){
        if($this->request->isAjax()){
            $this->view->disable();
            $commentObj = CommentClient::findFirstById($id);
            if($commentObj){
                $post = $this->request->getPost();
                $commentObj->content = $post['content'];
                $files =[];
                $post['file_old'] = json_decode($post['file_old']);
                if(empty($post['file_old'])){
                    $file_old = json_decode($commentObj->file);
                    if(!empty($file_old)){
                        foreach ($file_old as $key => $value) {
                            unlink(BASE_DIR.'/public_html/files/support/'.$value);
                        }
                    }
                }else{
                    $file_old = json_decode($commentObj->file);
                    foreach ($post['file_old'] as $key => $value) {
                        if(array_search($value , $commentObj->file) === false){
                            return $this->response->setStatusCode(500, 'Bad Request');
                        }else{
                            array_push($files,$value);
                        }
                    }
                    foreach ($file_old as $key => $value) {
                        if(array_search($value , $post['file_old'])===false){
                            unlink(BASE_DIR.'/public_html/files/support/'.$value);
                        }
                    }
                }
                
                if($this->request->hasFiles() == true) {
                    foreach ($this->request->getUploadedFiles() as $file){
                        if($file->getSize()){
                            $now = strtotime("now");
                            $file->moveTo(BASE_DIR.'/public_html/files/support/'.$now.'_'.$file->getName());
                            array_push($files,$now.'_'.$file->getName());
                        }
                    }
                }
                $commentObj->file = json_encode($files);
                if (!$commentObj->save()) {
                    $error = [];
                    foreach ($commentObj->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $support = Support::findFirst($id);
                    $assign_person_id = json_decode($support->assign_person_id);
                    $this->helper->write_log(2, 2, 'Đã cập nhật bình luận của yêu cầu có ID: <strong class="text-info">'.$id.'</strong>' ,json_encode($commentObj->toArray()),$this->session->get("user_id"));
                    $client = Client::findFirstByEmail($this->session->get("emailAddress"));
                    $department = Department::findFirstById($client->department_id);
                    $body = $this->helper->getTextNewComment($client->name, $department->name , $this->request->getPost('content'));
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'comment' => $commentObj->toArray(),
                        'email' => $this->session->get('emailAddress'),
                        'name'  => $this->session->get('fullName'),
                        'avatar' => $this->session->get('avatar'),
                        'body'      => $body,
                        'title'     => 'CẬP NHẬT BÌNH LUẬN CỦA YÊU CẦU HỖ TRỢ',
                        'users'     => count($assign_person_id) ? $assign_person_id : json_decode(GenaralSetting::findFirstByName('email_setting')->value)->users,
                        'ticket'    => $support->ticket,
                    ]);
                    return $this->response->send();
                }
            }

        }else{
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }

    public function deletecommentAction($id=null){
        if ($this->request->isAjax()) {
            $this->view->disable();
            if ($comment = CommentClient::findFirstById($id)) {
                $commentSave = $comment; 
                $files = $comment->file;
                if ($comment->delete()) {
                    if($files != "[]" && $files){
                        $files = json_decode($files);
                        foreach ($files as $key => $file) {
                            unlink(BASE_DIR.'/public_html/files/support/'.$file);
                        }
                        
                    }
                    $this->helper->write_log(3, 2, 'Đã xóa bình luận của yêu cầu có ID: <strong class="text-danger">'.$id.'</strong>' ,json_encode($commentSave->toArray()),$this->session->get("user_id"));
                    $this->response->setStatusCode(200, 'Deleted');
                    return $this->response->setJsonContent(['status' => 200]);
                } else {
                    $this->response->setStatusCode(500, 'Failed');
                    return $this->response->setJsonContent(['status' => 500]);
                }
            } else {
                $this->response->setStatusCode(404, 'Không tìm thấy bình luận này');
                return $this->response->setJsonContent(['status' => 404]);
            }
        } else {
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }

    public function deleteAction(){
        if ($this->request->isAjax()) {
            $this->view->disable();
            $id = (int)$this->request->getPost('id');
            if ($client = Client::findFirstById($id)) {
                if ($client->delete()) {
                    $this->response->setStatusCode(200, 'Deleted');
                    return $this->response->setJsonContent(['status' => 200]);
                } else {
                    $this->response->setStatusCode(500, 'Failed');
                    return $this->response->setJsonContent(['status' => 500]);
                }
            } else {
                $this->response->setStatusCode(404, 'ID failed');
                return $this->response->setJsonContent(['status' => 404]);
            }
        } else {
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }
}