<?php

namespace Backend\Modules\Admin\Controllers;
use Phalcon\Mvc\View;
use Models\Client;
use Models\Department;
use Models\Support;
use Models\Package;

class DashboardController  extends \BackendController
{
    public function indexAction() {
        if($this->request->getQuery('single')){
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $this->view->count_client = Client::count();
        $this->view->count_department = Department::count()-1;
        $this->view->count_support = Support::count();
        $this->view->count_support_done = Support::count(['status = 2']);
        $this->view->count_support_doing = Support::count(['status = 3']);
        $this->view->count_support_notdoing = Support::count(['status != 2']);
    }

    public function chartAction(){
        if ($this->request->isAjax()) {
            $this->view->disable();
            $type = $this->request->get('type');
            $end = $this->request->get('end');
            $begin = $this->request->get('begin');

            if(!$begin && !$end){
                $end = date('Y-m-d');
                $begin = date('Y-m-d', strtotime('-6 days'));
            }else{
                $begin = date("Y-m-d H:i:s", strtotime($begin));
                $end = date("Y-m-d H:i:s", strtotime($end));
            }
            switch ($type) {
                case '1':{
                    $startTimeStamp = strtotime($begin);
                    $endTimeStamp = strtotime($end);
                    $timeDiff = abs($endTimeStamp - $startTimeStamp);
                    $number = $timeDiff/86400;  // 86400 seconds in one day
                    $number = intval($number); //So ngay tu ngay den ngay

                    $dataArray = Support::query()
                    ->columns(['COUNT(package_id) as count','date(created_at) as date', 'package_id'])
                    ->where("date(created_at) BETWEEN :begin: AND :end:")
                    ->orderBy('date')
                    ->bind(['begin' => $begin, 'end' => $end])
                    ->groupBy(['date','package_id'])
                    ->execute(); // Lay du lieu ho tro
                    $data = [];
                    $temp = [];
                    $dateArray = [];
                    $dataPack = Package::find();// Lay danh sach dich vu

                    for ($i=0; $i <= $number ; $i++) { 
                        array_push($temp, 0);
                        array_push($dateArray,date('Y-m-d', strtotime($end.' -'.($number-$i).' days')));
                    }
                    $data['date'] = $dateArray;// Mang danh sach cac ngay
                    foreach ($dataPack as $key => $package) {
                        $data[$package->id] = [
                            'pack_name'    =>  $package->name,
                            'data'         =>  $temp,
                        ];
                    }// Tao mang du lieu mac dinh
                    foreach ($dataArray as $key => $value) {
                        $index = array_search($value->date,$data['date']);
                        if($index !== false){
                            $data[$value->package_id]['data'][$index] = $value->count;
                        }
                    }//Gan du lieu tra ve
                    break;
                }
                case '2':{ // Lay du lieu tu thang bat dau den thang ket thuc
                    $number = $this->helper->countMonth(date("Y-m", strtotime($begin)),date("Y-m", strtotime($end)));
                    $dataArray = Support::query()
                    ->columns(['COUNT(package_id) as count','created_at as created','month(created_at) as month', 'year(created_at) as year', 'package_id'])
                    ->where("date(created_at) BETWEEN :begin: AND :end:")
                    ->orderBy('created')
                    ->bind(['begin' => date("Y-m-d H:i:s", strtotime($this->request->get('begin'))), 'end' => date("Y-m-d H:i:s", strtotime($this->request->get('end')))])
                    ->groupBy(['year','month','package_id'])
                    ->execute();
                    $data = [];
                    $temp = [];
                    $dateArray = [];
                    $dataPack = Package::find();
                    $month = (int)date("m", strtotime($begin));
                    $year = (int)date('Y', strtotime($begin));
                    for ($i=0; $i < $number ; $i++) { 
                        array_push($temp, 0);
                        if($month > 12){
                            $month -= 12;
                            $year += 1;
                            $Y_m = $year.'-'.$month;
                        }else{
                            $Y_m = $year.'-'.$month;
                        }
                        $month += 1;
                        array_push($dateArray,$Y_m);
                    }
                    $data['month'] = $dateArray;
                    foreach ($dataPack as $key => $package) {
                        $data[$package->id] = [
                            'pack_name'    =>  $package->name,
                            'data'         =>  $temp,
                        ];
                    }
                    foreach ($dataArray as $key => $value) {
                        $index = array_search($value->year.'-'.$value->month,$data['month']);
                        $value->year.'-'.sprintf("%02d", $value->month);
                        if($index !== false){
                            $data[$value->package_id]['data'][$index] = $value->count;
                        }
                    }
                    break;
                }
                case '3':{
                    $number = (int)$end - (int)$begin;
                    $dataArray = Support::query()
                    ->columns(['COUNT(package_id) as count','date(created_at) as date','year(created_at) as year' , 'package_id'])
                    ->where("date(created_at) BETWEEN :begin: AND :end:")
                    ->orderBy('date')
                    ->bind(['begin' => date("Y-m-d", strtotime($this->request->get('begin'))), 'end' => date("Y-m-d", strtotime($this->request->get('end')))])
                    ->groupBy(['year','package_id'])
                    ->execute();
                    $data = [];
                    $temp = [];
                    $dateArray = [];
                    $dataPack = Package::find();

                    
                    for ($i=0; $i <= $number ; $i++) { 
                        array_push($temp, 0);
                        array_push($dateArray,date('Y', strtotime($end.' -'.($number-$i).' years')));
                    }
                    $data['year'] = $dateArray;
                    foreach ($dataPack as $key => $package) {
                        $data[$package->id] = [
                            'pack_name'    =>  $package->name,
                            'data'         =>  $temp,
                        ];
                    }
                    foreach ($dataArray as $key => $value) {
                        $index = array_search($value->year,$data['year']);
                        if($index !== false){
                            $data[$value->package_id]['data'][$index] = $value->count;
                        }
                    }
                    break;
                }
                default: {
                    $year = date('Y');
                    $dataArray = Support::query()
                    ->columns(['COUNT(package_id) as count','month(created_at) as month', 'package_id'])
                    ->where("year(created_at) = :year:")
                    ->orderBy('package_id')
                    ->bind(['year' => $year])
                    ->groupBy(['month','package_id'])
                    ->execute();
                    $data = [];
                    $dataPack = Package::find();
                    foreach ($dataPack as $key => $value) {
                        $data[$value->id] = [
                            'pack_name'    =>  $value->name,
                            'data'         =>  [0,0,0,0,0,0,0,0,0,0,0,0]
                        ];
                    }
                    foreach ($dataArray as $key => $value) {
                        $data[$value->package_id]['data'][$value->month-1] = $value->count;
                    }
                    break;
                }
            }

            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent([
                'data' => $data,
                'begin' => $begin,
                'end'   => $end 
            ]);
            return $this->response->send();
        }
    }

    public function chartclientAction(){
        if ($this->request->isAjax()) {
            $this->view->disable();
            $type = $this->request->get('type');
            $end = $this->request->get('end');
            $begin = $this->request->get('begin');
            if(!$begin && !$end){
                $end = date('Y-m-d');
                $begin = date('Y-m-d', strtotime('-6 days'));
            }else{
                $begin = date("Y-m-d", strtotime($begin));
                $end = date("Y-m-d", strtotime($end));
            }
            switch ($type) {
                case '1':{
                    $count_support = Support::find([
                        "date(created_at) BETWEEN :begin: AND :end:",
                        'bind' =>['begin' => $begin, 'end' => $end]
                    ])->count();
                    $dataArray = $this->modelsManager->createBuilder()
                    ->columns(array(
                        'COUNT(Models\Support.id) as count',
                        'Models\Support.id',
                        'Models\Support.package_id',
                        'Models\Support.client_id',
                        'Models\Support.created_at',
                        'Models\Support.date_assign',
                        'C.name client_name',
                        'C.department_id client_id',
                        'D.name department_name',
                    ))
                    ->from('Models\Support')
                    ->join('Models\Client', 'C.id = Models\Support.client_id','C')
                    ->join('Models\Department', 'D.id = C.department_id','D')
                    ->where("date(Models\Support.created_at) BETWEEN :begin: AND :end:",['begin' => $begin, 'end' => $end])
                    ->orderBy('C.department_id DESC')
                    ->groupBy(['C.department_id'])
                    ->getQuery()
                    ->execute()
                    ->toArray();
                    break;
                } 
                case '2':{
                    $count_support = Support::find([
                        "date(created_at) BETWEEN :begin: AND :end:",
                        'bind' =>['begin' => $begin, 'end' => $end]
                    ])->count();
                    $dataArray = $this->modelsManager->createBuilder()
                    ->columns(array(
                        'COUNT(Models\Support.id) as count',
                        'Models\Support.id',
                        'Models\Support.package_id',
                        'Models\Support.client_id',
                        'Models\Support.created_at',
                        'Models\Support.date_assign',
                        'C.name client_name',
                        'C.department_id client_id',
                        'D.name department_name',
                    ))
                    ->from('Models\Support')
                    ->join('Models\Client', 'C.id = Models\Support.client_id','C')
                    ->join('Models\Department', 'D.id = C.department_id','D')
                    ->where("date(Models\Support.created_at) BETWEEN :begin: AND :end:",['begin' => $begin, 'end' => $end])
                    ->orderBy('C.department_id DESC')
                    ->groupBy(['C.department_id'])
                    ->getQuery()
                    ->execute()
                    ->toArray();
                    break;
                }
                case '3':{
                    $count_support = Support::find([
                        "date(created_at) BETWEEN :begin: AND :end:",
                        'bind' =>['begin' => $begin, 'end' => $end]
                    ])->count();
                    $dataArray = $this->modelsManager->createBuilder()
                    ->columns(array(
                        'COUNT(Models\Support.id) as count',
                        'Models\Support.id',
                        'Models\Support.package_id',
                        'Models\Support.client_id',
                        'Models\Support.created_at',
                        'Models\Support.date_assign',
                        'C.name client_name',
                        'C.department_id client_id',
                        'D.name department_name',
                    ))
                    ->from('Models\Support')
                    ->join('Models\Client', 'C.id = Models\Support.client_id','C')
                    ->join('Models\Department', 'D.id = C.department_id','D')
                    ->where("date(Models\Support.created_at) BETWEEN :begin: AND :end:",['begin' => $begin, 'end' => $end])
                    ->orderBy('C.department_id DESC')
                    ->groupBy(['C.department_id'])
                    ->getQuery()
                    ->execute()
                    ->toArray();
                    break;
                }                
                default:{
                    $year = date('Y');
                    $count_support = Support::find([
                        'year(created_at) = '.$year
                    ])->count();
                    $dataArray = $this->modelsManager->createBuilder()
                    ->columns(array(
                        'COUNT(Models\Support.id) as count',
                        'Models\Support.id',
                        'Models\Support.package_id',
                        'Models\Support.client_id',
                        'Models\Support.created_at',
                        'Models\Support.date_assign',
                        'C.name client_name',
                        'C.department_id client_id',
                        'D.name department_name',
                    ))
                    ->from('Models\Support')
                    ->join('Models\Client', 'C.id = Models\Support.client_id','C')
                    ->join('Models\Department', 'D.id = C.department_id','D')
                    ->where("year(Models\Support.created_at) = ".$year)
                    ->orderBy('C.department_id DESC')
                    ->groupBy(['C.department_id'])
                    ->getQuery()
                    ->execute()
                    ->toArray();
                    break;
                }
            }

            $data = [];
            $client = [];
            foreach ($dataArray as $key => $value) {
                if($key === 5) break;
                array_push($client,$value['department_name']);
                array_push($data,(float)$value['count']/(int)$count_support*100);
            }
            if(count($data)){
                echo $sum = array_sum($data);
                if(100 - $sum > 1){
                    array_push($data,(float)(100 - $sum));
                    array_push($client,'Đơn vị khác');
                }
            }
            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent([
                'data' => $data,
                'client' => $client,
                'begin' => $begin,
                'end'   => $end
            ]);
            return $this->response->send();
        }
    }
}
