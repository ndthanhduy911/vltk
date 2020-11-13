<?php
namespace Backend\Modules\Master\Controllers;
use FeaturesList;
use Features;


class SettingController extends \BackendController
{
    // ===============================
    // PAGE
    // ===============================
    public function indexAction(){
        $featuresList = FeaturesList::find();
        $features = Features::find(['deleted = 0', 'columns' => 'id, name']);
        $title = "Cài đặt";
        $this->getJsCss();
        $this->view->title = $title;
        $this->view->featuresList = $featuresList->toArray();
        $this->view->features = $features;
    }

    // ===============================
    // API
    // ===============================
    public function filtersAction(){
        $this->view->disable();
        $userid = $this->session->get('userid');
        if (!$this->security->checkToken()) {
            $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            $data['error'] = ['Token không chính xác'];
            $this->helper->responseJson($this, $data);
        }
        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];

        if(!$this->request->isAjax() || !$this->request->isPost()){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $fkey = $this->request->getPost('fkey',['string', 'trim']);
        $tableList = \FilterSetting::getTableKeys($fkey);
        $filerList = \FilterSetting::getFilterKeys($fkey);
        if(!$filerList || !$tableList){
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }
        $filers = $this->request->getPost('filters',['string', 'trim']);
        $filers = is_array($filers) ? $filers : [];
        $tables = $this->request->getPost('tables',['string', 'trim']);
        $tables = is_array($tables) ? $tables : [];
        // var_dump($filerList);die;
        if(count(array_diff($tables,$tableList)) || count(array_diff($filers,$filerList))){
            $data['error'] = ['Dữ liệu không hợp lệ'];
            $this->helper->responseJson($this, $data);
        }

        if($filersetting = \FilterSetting::findFirstKey($fkey)){
            $filersetting->filters = json_encode($filers);
            $filersetting->tables = json_encode($tables);
            $filersetting->updatedat = date('Y-m-d H:i:s');
            $filersetting->updatedby = $userid;
        }else{
            $filersetting = new \FilterSetting();
            $filersetting->userid = $userid;
            $filersetting->fkey = $fkey;
            $filersetting->filters = json_encode($filers);
            $filersetting->tables = json_encode($tables);
            $filersetting->createdat = date('Y-m-d H:i:s');
            $filersetting->updatedat = $filersetting->createdat;
            $filersetting->createdby = $userid;
            $filersetting->updatedby = $userid;
            $filersetting->deleted = 0;
        }
        try {
            $this->db->begin();
            if(!$filersetting->save()){
                foreach ($filersetting->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                    
                }
            }
            \Logs::saveLogs($this, 2, "Cập nhật thiết lập giao diện".\FilterSetting::findNameKey($fkey),[],[]);
            $this->db->commit();
            $this->helper->responseJson($this, $data);
        } catch (\Throwable $e) {
            $this->db->rollback();
            $data['error'] = [$e->getMessage()];
            $this->helper->responseJson($this, $data);
        }

    }
    
    public function getsinglefilterAction(){
        if (!$this->request->isAjax()) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $fkey = $this->request->get('fkey',['string', 'trim']);
        if(!$perL = $this->master::checkPermissionDepted($fkey, 'index')){
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }

        if(!$filersetting = \FilterSetting::findFirstKey($fkey,"filters,tables")){
            $this->helper->responseJson($this, [
                'filters' => [],
                'tables' => []
            ]);
        }
        $filersetting->filters = $filersetting->filters ? json_decode($filersetting->filters) : [];
        $filersetting->tables = $filersetting->filters ? json_decode($filersetting->tables) : [];
        $data = $filersetting->toArray();
        $this->helper->responseJson($this, $data);
    }


    public function ajax_featuresAction(){
        $userid = $this->session->get('userid');
        if (!$this->request->isAjax() || !$this->request->isPost()) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        $feature_id = $this->request->getPost('feature_id');
        $view = $this->request->getPost('view');
        if($features = Features::findFirstId($feature_id)){
            if($featuresList = FeaturesList::findFirst(["features_id = $feature_id"])){
                $featuresList->view = $view;
                $featuresList->updatedat = date('Y-m-d H:i:s');
                $featuresList->save();
            }else{
                $featuresList = new FeaturesList();
                $featuresList->features_id = $feature_id;
                $featuresList->view = $view;
                $featuresList->createdat = date('Y-m-d H:i:s');
                $featuresList->updatedat = $featuresList->createdat;
                $featuresList->save();
            }
            $this->helper->responseJson($this, ["Success"]);
        }else{
            $this->helper->responseJson($this, ["error" => ["Error"]]);
        }

    }

    // ===============================
    // FUNCTION
    // ===============================

    private function getJsCss (){
        // And some local JavaScript resources
        $this->assets->addJs(WEB_URL.'/assets/js/modules/master/setting.js?v='.VS_SCRIPT);
    }
}