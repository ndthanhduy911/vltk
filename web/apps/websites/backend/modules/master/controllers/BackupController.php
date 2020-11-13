<?php
namespace Backend\Modules\Master\Controllers;

use Backend\Modules\Master\Forms\SearchBackupForm;
use Backend\Modules\Master\Forms\SyncForm;

class BackupController extends \BackendController
{
    // ===============================
    // PAGE
    // ===============================
    public function indexAction(){
        if($this->request->get('singlePage','int') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }

        $title = "Sao lưu dự phòng";

        $configFilePath = CRONTAB_DIR . DIRECTORY_SEPARATOR . 'config.json';
        $config = $this->helper->getConfig($configFilePath);
        $configData = [
            'enable_backup' => null,
            'max_number_file_backup' => null,
            'period' => null,
            'period_value' => null
        ];
        if (is_object($config)) {
            $configData = [
                'enable_backup' => $config->enable_backup,
                'max_number_file_backup' => $config->max_number_file_backup,
                'period' => $config->period,
                'period_value' => $config->period_value
            ];
        }
        // var_dump($configData);die;
        $this->view->configData = $configData;
        $this->getJsCss();
        $this->view->title = $title;
        $this->view->formSearch = new SearchBackupForm();
    }

    public function syncAction(){
        if($this->request->get('singlePage','int') && $this->request->isAjax()){
            $this->view->setRenderLevel(
                \Phalcon\Mvc\View::LEVEL_ACTION_VIEW
            );
        }
        $title = "Nhập dữ liệu ban đầu";
        if($this->request->isPost()){
            $this->view->disable();
            if (!$this->security->checkToken()) {
                $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
                $data['error'] = ['Token không chính xác'];
                $this->helper->responseJson($this, $data);
            }
            $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            if(!$perL = \Library\Master\Master::checkPermissionDepted('backup','sync')){
                $data['error'] = ['Truy cập không được phép'];
                $this->helper->responseJson($this, $data);
            }
            $deptId = $this->request->getPost('deptid','int');
            $deptId = $deptId ? $deptId : 1;
            if(!$dept = \Depts::findFirstIdNoDelete($deptId)){
                $data['error'] = ['Đơn vị bộ phận không đúng'];
                $this->helper->responseJson($this, $data);
            }

            $typeId = $this->request->getPost('typeid',['trim','int']);
            if(!$aType = \AssetType::findFirstIdNoDelete($typeId,"*",["type = 1"])){
                $data['error'] = ['Loại tài sản không tồn tại'];
                $this->helper->responseJson($this, $data);
            }
            try {
                $this->db->begin();
                $importExcel = new \Library\ImportExcel\ImportExcelSync('importfile', [
                    'size_max' => 5,
                    'is_check_password' => false,
                    'file_password' => EXCEL_PASSWORD
                ]);
                $resValidation = $importExcel->validation();
                if ($resValidation !== true) {
                    throw new \Exception($resValidation);
                }
                $importExcel->run(['dept' => $dept, 'aType' => $aType, 'perL' => $perL]);
                if (!empty($importExcel->error)) {
                    throw new \Exception($importExcel->error);
                }
                $this->db->commit();
                $this->helper->responseJson($this, $data);
            } catch (\Exception $e) {
                $this->db->rollback();
                $data['error'] = [$e->getMessage()];
                $this->helper->responseJson($this, $data);
            }

            $typeId = $this->request->getPost('typeid',['trim','int']);

        }
        $this->getJsCss();
        $this->view->title = $title;
        $this->view->form = new SyncForm();
    }

    // ===============================
    // API
    // ===============================
    public function getdataAction(){
        if (!$this->request->isAjax()) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }

        $nameSearch = $this->request->get('nameSearch', ['string', 'trim']);
        $createddateSearch = $this->helper->date_mysql($this->request->get('createddateSearch', ['string', 'trim']));

        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'b.id',
            'b.filename',
            'b.filesize',
            'b.downloads',
            'b.createdat'
        ))
        ->from(['b' => 'Backup']);

        $array_row = [
            'u' => $this->master::checkPermission('backup', 'update', '1'),
            'd' => $this->master::checkPermission('backup', 'delete'),
        ];

        if($nameSearch){
            $data = $data->andWhere('b.filename LIKE :nameSearch:',['nameSearch' => '%'.$nameSearch.'%']);
        }

        if($createddateSearch){
            $data = $data->andWhere('b.createdat LIKE :createddateSearch:',['createddateSearch' => '%'.$createddateSearch.'%']);
        }
        
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,false, $array_row));
        // $this->helper->responseJson($this, $res);
    }

    public function updateAction(){
        $this->view->disable();
        if (!$this->security->checkToken()) {
            $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            $data['error'] = ['Token không chính xác'];
            $this->helper->responseJson($this, $data);
        }
        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
        // if(!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('checkin','update',[0,1])){
        //     $data['error'] = ['Truy cập không được phép'];
        //     $this->helper->responseJson($this, $data);
        // }
        $configFilePath = CRONTAB_DIR . DIRECTORY_SEPARATOR . 'config.json';
        $config = $this->helper->getConfig($configFilePath);
        if (!is_object($config)) {
            $data['error'] = ['Có lỗi xảy ra khi mở tập tin cấu hình Crontjob'];
            $this->helper->responseJson($this, $data);
        }

        $isEnableBackup = $this->request->getPost('is_enable_backup', 'int');
        $isEnableBackup = (empty($isEnableBackup) ? 0 : $isEnableBackup);
        $maxNumberFileBackup = $this->request->getPost('max_number_file_backup', 'int');
        $period = $this->request->getPost('period', ['string', 'trim']);
        $periodValueArr = $this->request->getPost('period_value');
        $periodValue = $this->filter->sanitize($this->helper->returnArr($period, $periodValueArr), ['string', 'trim']);

        if (!in_array($isEnableBackup, [0,1])) {
            $data['error'] = ['Dữ liệu enable không hợp lệ'];
            $this->helper->responseJson($this, $data);
        }

        $schedule = $this->getScheduleCronjob($period, $periodValue);
        if (empty($schedule)) {
            $data['error'] = ['Lịch crontjob không hợp lệ'];
            $this->helper->responseJson($this, $data);
        }
        $cmdPath = 'php ' . BASE_DIR . '/crontab/script-backup.php';
        $resSetCrontJob = $this->helper->setCrontJob($schedule, $cmdPath);
        if ($resSetCrontJob == false) {
            $data['error'] = ['Thiết lập crontjob không thành công'];
            $this->helper->responseJson($this, $data);
        }
        $config->enable_backup = $isEnableBackup;
        $config->max_number_file_backup = $maxNumberFileBackup;
        $config->period = $period;
        $config->period_value = $periodValue;
        if (!file_put_contents($configFilePath, json_encode($config))) {
            $data['error'] = ['Lưu cấu hình không thành công'];
            $this->helper->responseJson($this, $data);
        }

        $this->helper->responseJson($this,$data);
    }

    public function downloadAction($id){
        $this->view->disable();
        $data = \Backup::findFirstIdNoDelete($id);
        $userid = $this->session->get('userid');
        if (!$data) {
            die('Dữ liệu không tồn tại');
        }
        $filePath = CRONTAB_DIR . DIRECTORY_SEPARATOR . 'backup' . DIRECTORY_SEPARATOR . $data->filename;
        if (!file_exists($filePath)) {
            die('Tập tin không tồn tại');
        }
        $this->helper->downloadFile($filePath);
        $data->downloads = (is_nan($data->downloads) ? 0 : ($data->downloads + 1));
        try {
            $this->db->begin();
            if (!$data->save()) {
                foreach ($data->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            if($backupuser = \BackupUser::findFirst(["userid = $userid AND backupid = $data->id"])){
                $backupuser->downloads = $backupuser->downloads + 1;
            }else{
                $backupuser =  new \BackupUser();
                $backupuser->userid = $userid;
                $backupuser->backupid = $data->id;
                $backupuser->downloads = 1;
                $backupuser->createdat = date('Y-m-d');
            }
            if (!$backupuser->save()) {
                foreach ($backupuser->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
            $this->db->commit();
            die('Tải thành công');
        } catch (\Throwable $e) {
            $this->db->rollback();
            die($e->getMessage());
            // $data['error'] = [$e->getMessage()];
            // $this->helper->responseJson($this, $data);
        }
    }

    public function getdownloadsAction($id){
        $this->view->disable();
        if(!$data = \Backup::findFirstIdNoDelete($id)){
            $this->helper->responseJson($this, ['error' => ['Sao lưu không tồn tại']]);
        }
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'b.id',
            'b.userid',
            'b.backupid',
            'b.downloads',
            'u.avatar avatar',
            'u.fullname fname'
        ))
        ->from(['b' => 'BackupUser'])
        ->where("backupid = :bkid:",['bkid' => $id])
        ->leftJoin('User', 'b.userid = u.id','u')
        ->getQuery()
        ->execute();
        $this->helper->responseJson($this, $data->toArray());
    }

    public function restoreAction(){
        $this->view->disable();
        if(!$this->request->isPost()){
            $this->helper->responseJson($this, ['error' => ["Truy cập không được phép"]]);
        }
        try {
            $this->db->begin();
            \ModelCore::truncate(new \Asset());
            \ModelCore::truncate(new \AssetLog());
            \ModelCore::truncate(new \CheckIn());
            \ModelCore::truncate(new \CheckOut());
            \ModelCore::truncate(new \DeAsset());
            \ModelCore::truncate(new \DeAssetDetail());
            \ModelCore::truncate(new \Reduction());
            \ModelCore::truncate(new \ReductionDetail());
            \ModelCore::truncate(new \CheckType());
            \ModelCore::truncate(new \Inventory());
            \ModelCore::truncate(new \InventoryDetail());
            \ModelCore::truncate(new \Estimate());
            \ModelCore::truncate(new \EstimateDetail());
            \ModelCore::truncate(new \Transfer());
            \ModelCore::truncate(new \TransferDetail());
            \ModelCore::truncate(new \Revoke());
            \ModelCore::truncate(new \RevokeDetail());
            \ModelCore::truncate(new \Repair());
            \ModelCore::truncate(new \RepairDetail());
            \ModelCore::truncate(new \Failing());
            \ModelCore::truncate(new \FailingDetail());
            \ModelCore::truncate(new \DbCalculator());
            (new \CheckType())->getDi()->getShared('db')->query("UPDATE `hnntypecode` SET `number` = '0'");
            $this->db->commit();
            $this->helper->responseJson($this, []);
        } catch (\Throwable $e) {
            $this->db->rollback();
            $data['error'] = [$e->getMessage()];
            $this->helper->responseJson($this, $data);
        }
    }
    // ===============================
    // FUNCTION
    // ===============================

    private function getJsCss (){
        // And some local JavaScript resources
        $this->assets->addCss(WEB_URL.'/assets/dist/plugins/timepicker/dist/wickedpicker.min.css');
        $this->assets->addJs(WEB_URL.'/assets/dist/plugins/timepicker/dist/wickedpicker.min.js');
        $this->assets->addJs(WEB_URL.'/assets/js/modules/master/backup.js');
    }

    private function getScheduleCronjob($period, $periodValue){
        $res = '';
        switch ($period) {
            case 'hour':{ // Hour in day
                $ptimeArr = explode(':', $periodValue);
                if (count($ptimeArr) == 2) {
                    $hour = intval($ptimeArr[0]);
                    $minute = intval($ptimeArr[1]);
                    $res = "{$minute} {$hour} * * *";
                }
                break;
            }
            case 'week':{ // Day of week
                $dayOfWeek = intval($periodValue);
                $res = "0 1 * * {$dayOfWeek}";
                break;
            }
            case 'day':{ // Day in month
                $dayOfMonth = intval($periodValue);
                $res = "0 1 {$dayOfMonth} * *";
                break;
            }
            default:
                $res = '';
                break;
        }
        return $res;
    }
}