<?php
namespace Backend\Modules\Master\Controllers;

use Backend\Modules\Master\Forms\SearchLogsForm;
use Logs;

class LogsController extends \BackendController
{
    // ===============================
    // PAGE
    // ===============================
    public function indexAction(){
        $title = "Nhật ký";
        $this->getJsCss();
        $this->view->title = $title;
        $this->view->form_search = new SearchLogsForm();
    }

    public function exportAction(){
        if(!$perL = $this->master::checkPermissionDepted('logs', 'index')){
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $nameSearch = $this->request->get('nameSearch', ['string', 'trim']);
        $typeidSearch = $this->request->get('typeidSearch', ['string', 'trim']);
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'l.id',
            'l.userid',
            'l.deptid',
            'l.type',
            'l.name',
            'l.controller',
            'l.action',
            'l.paramid',
            'l.params',
            'l.ip',
            'l.device',
            'l.browser',
            'l.os',
            'l.createdat',
            '(SELECT u.username FROM User AS u WHERE u.id = l.userid) AS username'
        ))
        ->from(['l' => 'Logs'])
        ->orderBy('l.id DESC');

        $data = $this->master::builderPermission($data,$perL,'l');

        if($nameSearch){
            $data = $data->andWhere('l.name LIKE :nameSearch:',['nameSearch' => '%'.$nameSearch.'%']);
        }
        if(($typeidSearch && $typeidSearch != 'all')){
            $data = $data->andWhere('l.type = :typeidSearch:', ['typeidSearch' => $typeidSearch]);
        }
        // Export
        $export = new \Library\ExportExcel\ExportExcelLog();
        $export->run($data);
        die("\nError!!!");
    }

    // ===============================
    // API
    // ===============================
    public function getdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('logs', 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }

        $nameSearch = $this->request->get('nameSearch',['string', 'trim']);
        $typeidSearch = $this->request->get('typeidSearch',['string', 'trim']);

        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'l.id',
            'l.userid',
            'l.type',
            'l.name',
            'l.controller',
            'l.action',
            'l.paramid',
            'l.params',
            'l.ip',
            'l.device',
            'l.browser',
            'l.os',
            'l.createdat',
        ))
        ->from(['l' =>'Logs'])
        ->orderBy('l.id DESC');

        $data = $this->master::builderPermission($data,$perL,'l');

        if($nameSearch){
            $data = $data->andWhere('l.name LIKE :nameSearch:',['nameSearch' => '%'.$nameSearch.'%']);
        }

        if(($typeidSearch && $typeidSearch != 'all')){
            $data = $data->andWhere('l.type = :typeidSearch:', ['typeidSearch' => $typeidSearch]);
        }

        $search = '';
        $options = [
            'extra' => [
                'username' => [\User::class, 'id', 'username', 'userid']
            ]
        ];
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data, $search, [], $options));
    }

    public function getsingleAction($id = null)
    {
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted('logs', 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        if ($data = Logs::findFirstIdPermission($id,$perL)) {
            $data = $data->toArray();
            $this->helper->responseJson($this, $data);
        } else {
            $this->helper->responseJson($this, ['error' => ['Không tìm thấy dữ liệu']]);
        }
    }

    // ===============================
    // FUNCTION
    // ===============================

    private function getJsCss (){
        // And some local JavaScript resources
        $this->assets->addJs(WEB_URL.'/assets/backend/js/modules/master/logs.js?v='.VS_SCRIPT);
    }
}