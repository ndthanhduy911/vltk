<?php
namespace Backend\Modules\Master\Controllers;
use Backend\Modules\Master\Forms\RoleForm;
use Backend\Modules\Master\Forms\SearchRoleForm;
use Phalcon\Mvc\Model\Query;

class RoleController extends \BackendController
{
    // ===============================
    // PAGE
    // ===============================
    public function indexAction(){
        $title = "Nhóm người dùng";
        $this->getJsCss();
        $this->view->title = $title;
        
        $this->view->form = new RoleForm();
        $this->view->form_search = new SearchRoleForm();
        $this->view->dashboards = \Dashboard::findNoDelete("id,name,sort");
    }

    // ===============================
    // API
    // ===============================
    //Get data
    public function getdataAction(){
        if (!$this->request->isAjax() || !$this->master::checkPermission('role', 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }

        $nameSearch = $this->request->get('nameSearch',['string', 'trim']);
        $createddateSearch = $this->helper->date_mysql($this->request->get('createddateSearch', ['string', 'trim']));
        $statusSearch = $this->request->get('statusSearch',['string', 'trim']);

        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'Role.id',
            'Role.name',
            'Role.status',
            'Role.createdat',
            'Role.updatedat',
        ))
        ->from('Role')
        ->where("Role.deleted = 0 AND Role.id != 1")
        ->orderBy('Role.id DESC');

        $array_row = [
            'u' => $this->master::checkPermission('role', 'update', '1'),
            'd' => $this->master::checkPermission('role', 'delete'),
        ];

        if($nameSearch){
            $data = $data->andWhere('Role.name LIKE :nameSearch:',['nameSearch' => '%'.$nameSearch.'%']);
        }

        if($createddateSearch){
            $data = $data->andWhere('Role.createdat LIKE :createddateSearch:',['createddateSearch' => '%'.$createddateSearch.'%']);
        }

        if(($statusSearch && $statusSearch != 'all') || $statusSearch == '0'){
            $data = $data->andWhere('Role.status = :statusSearch:', ['statusSearch' => $statusSearch]);
        }

        $search = 'Role.name LIKE :search:';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $array_row));
    }

    public function getsingleAction($id = null)
    {
        if (!$this->request->isAjax() || !$this->master::checkPermission('role', ['update','index'],[0,1])) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        if ($data = \Role::findFirstIdNoDelete($id)) {
            $data = $data->toArray();
            $data['permissions'] = $this->getPermissonList($data['id']);
            $data['dashboards'] = $this->getDashboardList($data['id']);
            $data['fgroup'] = $this->getGroupFieldList($data['id']);
            $this->helper->responseJson($this, $data);
        } else {
            $this->helper->responseJson($this, ['error' => ['Không tìm thấy dữ liệu']]);
        }
    }

    //Update data
    public function updateAction($id = 0){
 
        if (!$this->request->isAjax() || !$this->request->isPost()) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        if (!$this->security->checkToken()) {
            $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            $data['error'] = ['Token không chính xác'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];

        $dashboards = $this->request->getPost('dashboards',['string', 'trim']);
        $dashboards = $dashboards ? $dashboards : [];
        if (!is_array($dashboards)) {
            $data['error'] = ["Dữ liệu không hợp lệ"];
            $this->helper->responseJson($this, $data);
        }

        $assetfiled = $this->request->getPost('asset');
        $assetfiled = $assetfiled ? $assetfiled : [];
        $inventoryfiled = $this->request->getPost('inventory');
        $inventoryfiled = $inventoryfiled ? $inventoryfiled : [];
        $estimatefiled = $this->request->getPost('estimate');
        $estimatefiled = $estimatefiled ? $estimatefiled : [];
        $reductionfiled = $this->request->getPost('reduction');
        $reductionfiled = $reductionfiled ? $reductionfiled : [];
        $planfiled = $this->request->getPost('pcplan');
        $planfiled = $planfiled ? $planfiled : [];
        $furnishfiled = $this->request->getPost('furnish');
        $furnishfiled = $furnishfiled ? $furnishfiled : [];
        if (!is_array($dashboards)) {
            $data['error'] = ["Dữ liệu không hợp lệ"];
            $this->helper->responseJson($this, $data);
        }

        if($id == 1){
            $data['error'] = ["ID 1: Không được phép thay đổi"];
            $this->helper->responseJson($this, $data);
        }

        if($id){
            if(!$role = \Role::findFirstId($id)){
                $data['error'] = ['Không tìm thấy dữ liêụ'];
                $this->helper->responseJson($this, $data);
            }
            $role->updatedat = date('Y-m-d H:i:s');
            $role->updatedby = $userid;
        }else{
            $role = new \Role();
            $role->createdat = date('Y-m-d H:i:s');
            $role->updatedat = $role->createdat;
            $role->createdby = $userid;
            $role->updatedby = $userid;
            $role->deleted = 0;
        }
        $role_old = $role->toArray();
        $role->name = $this->request->getPost('name');
        $role->status = $this->request->getPost('status');
        $permissions = $this->request->getPost('permissions',['string', 'trim']);
        if(!is_array($permissions)) {
            $data['error'] = ['Phân quyền chưa hợp lệ'];
            $this->helper->responseJson($this, $data);
        }

        try {
            $this->db->begin();
            $role->vdUpdate(true);
            if (!$role->save()) {
                foreach ($role->getMessages() as $message) {
                    throw new \Exception($message->getMessage());                    
                }
            }

            $query = new Query("UPDATE PermissionList SET deleted = 1 WHERE roleid = $role->id", $this->getDI());
            $query->execute();
            foreach ($permissions as $string) {
                $permission = explode(",",(string)$string);
                $this->addPermissionOne($permission, $role->id);
            }

            $query = new Query("UPDATE DashboardList SET deleted = 1 WHERE roleid = $role->id", $this->getDI());
            $query->execute();
            foreach ($dashboards as $id) {
                $this->addDashboardOne($id,$role->id);
            }

            $this->addFiledGroup('asset',$role->id,$assetfiled);
            $this->addFiledGroup('inventory',$role->id,$inventoryfiled);
            $this->addFiledGroup('estimate',$role->id,$estimatefiled);
            $this->addFiledGroup('reduction',$role->id,$reductionfiled);
            $this->addFiledGroup('pcplan',$role->id,$planfiled);
            $this->addFiledGroup('furnish',$role->id,$furnishfiled);
            
            if($id){
                \Logs::saveLogs($this, 2, 'Cập nhật nhóm quyền '.$role->name, $role_old, $role->toArray());
            }else{
                \Logs::saveLogs($this, 1, 'Thêm mới nhóm quyền '.$role->name, "", $role->toArray());
            }
            $this->db->commit();
            $data['data'] = $role->toArray();
            $this->helper->responseJson($this, $data);
        } catch (\Throwable $e) {
            $this->db->rollback();
            $data['error'] = [$e->getMessage()];
            $this->helper->responseJson($this, $data);
        }
    }

    public function deleteAction(){ 
        if (!$this->request->isAjax() || !$this->request->isPost()) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }
        $listId = $this->request->getPost('dataId',['string', 'trim']);
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }
        $listId = $this->helper->filterListIds($listId);

        try {
            $this->db->begin();
            foreach ($listId as $roleid) {
                $this->deleteOne($roleid);
            }
            $this->db->commit(); 
            $this->helper->responseJson($this,[]);
        } catch (\Throwable $e) {
            $this->db->rollback();
            $this->helper->responseJson($this, ["error" => [$e->getMessage()]]);
        }    
    }

    // ===============================
    // FUNCTION
    // ===============================

    private function getJsCss (){
        // And some local JavaScript resources
        $this->assets->addJs(WEB_URL.'/assets/js/modules/master/role.js?v='.VS_SCRIPT);
    }

    private function addDashboardOne($id, $roleid)
    {
        $userid = $this->session->get('userid');
        if($dashboardList = \DashboardList::findFirst(["dashboardid = :dashboardid: AND roleid = :roleid:","bind" => ['dashboardid' => $id, 'roleid' => $roleid]])){
            $dashboardList->deleted = 0;
            $dashboardList->updatedby = $userid;
            $dashboardList->updatedat = date('Y-m-d H:i:s');
            if($dashboardList->save()){
                foreach ($dashboardList->getMessages() as $message) {
                    throw new \Exception($message->getMessage());                    
                }
            }
        }else{
            $dashboardList = new \DashboardList();
            $dashboardList->roleid = $roleid;
            $dashboardList->dashboardid = $id;
            $dashboardList->createdby = $userid;
            $dashboardList->updatedby = $userid;
            $dashboardList->createdat = date('Y-m-d H:i:s');
            $dashboardList->updatedat = $dashboardList->createdat;
            $dashboardList->deleted = 0;
            if($dashboardList->save()){
                foreach ($dashboardList->getMessages() as $message) {
                    throw new \Exception($message->getMessage());                    
                }
            }
        }
    }

    private function addPermissionOne($per, $roleid)
    {
        if(!is_array($per)){
            throw new \Exception("Danh sách quyền không hợp lệ");
        }
        if(!(int)$per[0] || !(int)$per[1]){
            throw new \Exception("Danh sách quyền không hợp lệ");
        }
        $userid = $this->session->get('userid');
        $depted = $this->request->getPost('roleDept'.$per[1]);
        if($permissionList = \PermissionList::findFirst(["permissionid = :permissionid: AND roleid = :roleid:","bind" => ['permissionid' => $per[0], 'roleid' => $roleid]])){
            $permissionList->deleted = 0;
            $permissionList->depted = (int)$depted;
            $permissionList->updatedby = $userid;
            $permissionList->updatedat = date('Y-m-d H:i:s');
            if($permissionList->save()){
                foreach ($permissionList->getMessages() as $message) {
                    throw new \Exception($message->getMessage());                    
                }
            }
        }else{
            $permissionList = new \PermissionList();
            $permissionList->roleid = $roleid;
            $permissionList->depted = (int)$depted;
            $permissionList->permissionid = $per[0];
            $permissionList->createdby = $userid;
            $permissionList->updatedby = $userid;
            $permissionList->createdat = date('Y-m-d H:i:s');
            $permissionList->updatedat = $permissionList->createdat;
            $permissionList->deleted = 0;
            if($permissionList->save()){
                foreach ($permissionList->getMessages() as $message) {
                    throw new \Exception($message->getMessage());                    
                }
            }
        }
    }

    private function deleteOne($id) {
        if (!$role = \Role::findFirstIdNoDelete($id)) {
            throw new \Exception("ID: $id không tồn tại");
        }

        if($id == 1){
            throw new \Exception("ID: $id không được xóa");
        }

        $role->deleted = 1;
        $role->updatedat = date('Y-m-d H:i:s');
        $role->updatedby = $_SESSION['userid'];

        if (!$role->save()) {
            foreach ($role->getMessages() as $message) {
                throw new \Exception("ID: $id ".$message->getMessage());                    
            }
        }
        \Logs::saveLogs($this, 3, "Xóa nhóm người dùng: $role->name", ['table' => 'Role','id' => $role->id]);
    }

    private function addFiledGroup($fkey,$roleid,$datas) {
        $userid = $this->session->get('userid');
        if($groups = \FieldGroup::findFirstKey($fkey, $roleid)){
            $groups->updatedby = $userid;
            $groups->updatedat = date('Y-m-d H:i:s');
            $groups->datas = json_encode($datas);
        }else{
            $groups = new \FieldGroup();
            $groups->roleid = $roleid;
            $groups->fieldkey = $fkey;
            $groups->deleted = 0;
            $groups->createdby = $userid;
            $groups->updatedby = $userid;
            $groups->createdat = date('Y-m-d H:i:s');
            $groups->updatedat = $groups->createdat;
            $groups->datas = json_encode($datas);
        }
        if(!$groups->save()){
            foreach ($groups->getMessages() as $message) {
                throw new \Exception($message->getMessage());                    
            }
        }
    }

    private function getPermissonList($id = 0)
    {
        $data = \PermissionList::find(["roleid = :roleid: AND deleted = 0", "columns" => "permissionid, depted, roleid", 'bind' => ['roleid' => $id]]);
        return $data = $data->toArray();
    }

    private function getDashboardList($id = 0)
    {
        $data = \DashboardList::find(["roleid = :roleid: AND deleted = 0", "columns" => "dashboardid", 'bind' => ['roleid' => $id]]);
        return $data = $data->toArray();
    }

    private function getGroupFieldList($id = 0)
    {
        $asset = \FieldGroup::findFirstKey('asset',$id);
        $data['asset'] = empty($asset->datas) ? [] :  json_decode($asset->datas);
        $inventory = \FieldGroup::findFirstKey('inventory',$id);
        $data['inventory'] = empty($inventory->datas) ? [] :  json_decode($inventory->datas);
        $estimate = \FieldGroup::findFirstKey('estimate',$id);
        $data['estimate'] = empty($estimate->datas) ? [] :  json_decode($estimate->datas);
        $reduction = \FieldGroup::findFirstKey('reduction',$id);
        $data['reduction'] = empty($reduction->datas) ? [] :  json_decode($reduction->datas);
        $plan = \FieldGroup::findFirstKey('pcplan',$id);
        $data['pcplan'] = empty($plan->datas) ? [] :  json_decode($plan->datas);
        $furnish = \FieldGroup::findFirstKey('furnish',$id);
        $data['furnish'] = empty($furnish->datas) ? [] :  json_decode($furnish->datas);
        return $data;
    }
}