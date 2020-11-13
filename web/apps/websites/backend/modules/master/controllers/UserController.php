<?php
namespace Backend\Modules\Master\Controllers;
use Backend\Modules\Master\Forms\ChangePWForm;
use Backend\Modules\Master\Forms\ProfileForm;
use Backend\Modules\Master\Forms\SearchUserForm;
use Backend\Modules\Master\Forms\UserForm;

class UserController extends \BackendController
{
    // ===============================
    // PAGE
    // ===============================
    public function indexAction(){
        $title = "Tài khoản người dùng";
        $this->getJsCss();
        $this->view->title = $title;
        $this->view->form = new UserForm();
        $this->view->form_search = new SearchUserForm();
    }

    public function profileAction(){
        $userid = $this->session->get("userid");
        if ($user = \User::findFirstId($userid)) {
            $title = "Thông tin cá nhân";
            if ($this->request->isPost()) {
                $checkMail = \User::findFirst([
                    "email = :email: AND deleted = 0 AND id != :id:",
                    "bind" => [
                        "email" => $this->request->getPost('email',['string','trim']),
                        "id" => $user->id,
                    ]
                ]);
                if($checkMail){
                    $this->flash->error('Địa chỉ mail đã được sử dụng.');
                }
                $userOld = $user->toArray();
                $user->fullname = $this->request->getPost('fullname');
                $user->gender = $this->request->getPost('gender');
                $user->email = $this->request->getPost('email');
                if (!$user->vdUpdate()) {
                    foreach ($user->getMessages() as $message) {
                        $this->flashSession->error($message->getMessage());
                    }
                }
                if (!$user->save()) {
                    foreach ($user->getMessages() as $message) {
                        $this->flashSession->error($message->getMessage());
                    }
                } else {
                    \Logs::saveLogs($this, 2, 'Cập nhật thông tin tài khoản của mình', $userOld, $user->toArray());
                    $this->flashSession->success("Cập nhật thành công");
                    return $this->response->redirect(WEB_ADMIN_URI.'/user/profile');
                }
            }
            $form = new ProfileForm($user);
            $this->view->form = $form;
            $this->view->title = $title;
            $this->view->formPW =  new ChangePWForm() ;
        } else {
            return $this->response->redirect('/');
        }
        $this->getJsCss();
    }

    // ===============================
    // API
    // ===============================
    
    public function getdataAction(){
        if (!$this->request->isAjax() || (!$perL = $this->master::checkPermissionDepted('user', 'index'))) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $userid = $this->session->get('userid');
        $fullnameSearch = $this->request->get('fullnameSearch',['string', 'trim']);
        $usernameSearch = $this->request->get('usernameSearch',['string', 'trim']);
        $emailSearch = $this->request->get('emailSearch',['string', 'trim']);
        $roleidSearch = $this->request->get('roleidSearch',['string', 'trim']);
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'u.id',
            'u.fullname',
            'u.username',
            'u.avatar',
            'u.gender',
            'u.email',
            'u.roleid',
            'u.status',
            'R.name rolename',
        ))
        ->from(['u' => 'User'])
        ->where("u.deleted = 0 AND u.id != 1 AND u.id != $userid")
        ->join('Role', 'R.id = u.roleid','R')
        ->orderBy('u.roleid DESC');

        $data = $this->master::builderPermission($data,$perL,'u');

        $array_row = [
            'u' => $this->master::checkPermission('user', 'update', '1'),
            'd' => $this->master::checkPermission('user', 'delete'),
        ];

        if($fullnameSearch){
            $data = $data->andWhere('User.fullname LIKE :fullnameSearch:',['fullnameSearch' => '%'.$fullnameSearch.'%']);
        }

        if($usernameSearch){
            $data = $data->andWhere('User.username LIKE :usernameSearch:',['usernameSearch' => '%'.$usernameSearch.'%']);
        }

        if($emailSearch){
            $data = $data->andWhere('User.email LIKE :emailSearch:',['emailSearch' => '%'.$emailSearch.'%']);
        }

        if($roleidSearch && $roleidSearch != 'all'){
            $data = $data->andWhere('User.roleid = :roleidSearch:', ['roleidSearch' => $roleidSearch]);
        }

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $array_row));
    }

    public function getsingleAction($id = 0){
        if (!$this->request->isAjax()) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $perL = $this->master::checkPermissionDepted('user', ['update','index'],[0,1]);
        if(!$perL){
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }

        if (!$user = \User::findFirstIdPermission($id,$perL)) {
            $this->helper->responseJson($this, ['error' => ['Không tìm thấy dữ liệu']]);
        }

        $data = $user->toArray();
        unset($data['password']);
        $this->helper->responseJson($this, $data);
    }

    public function updateAction($id = 0){
        
        if (!$this->security->checkToken()) {
            $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            $data['error'] = ['Token không chính xác'];
            $this->helper->responseJson($this, $data);
        }

        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
        if (!$this->request->isAjax() || !$this->request->isPost()) {
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        if ($id == 1) {
            $data['error'] = ['Truy cập không được phép'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];

        if($id){
            if(!$perL = $this->master::checkPermissionDepted('user', 'update','1')){
                $data['error'] = ['Truy cập không được phép'];
                $this->helper->responseJson($this, $data);
            }
    
            if (!$user = \User::findFirstIdPermission($id,$perL)) {
                $data['error'] = ['Không tìm thấy dữ liệu'];
                $this->helper->responseJson($this, $data);
            }
            $user->updatedat = date('Y-m-d H:i:s');
            $user->updatedby = $userid;
            $oldPassword = $user->password;
            $user->password = 'Honeynetvn2020';
        }else{
            $perL = $this->master::checkPermission('user', 'update');
            if(!$perL){
                $data['error'] = ['Truy cập không được phép'];
                $this->helper->responseJson($this, $data);
            }
            $user = new \User();
            $user->createdat = date('Y-m-d H:i:s');
            $user->updatedat = $user->createdat;
            $user->createdby = $userid;
            $user->updatedby = $userid;
            $user->valid = 1;
            $user->confirmed = 1;
            $user->confirmation_code = 1;
            $user->deleted = 0;
            $user->password = $this->request->getPost('addpassword');
        }
        $userOld = $user->toArray();
        $user->fullname = $this->request->getPost('fullname',['string','trim']);
        $user->username = $this->request->getPost('username',['string','trim']);
        $user->avatar = $this->request->getPost('avatar',['string','trim']);
        $user->gender = $this->request->getPost('gender',['int','trim']);
        $user->email = $this->request->getPost('email',['string','trim']);
        $user->roleid = $this->request->getPost('roleid',['int','trim']);
        $user->status = $this->request->getPost('status',['int','trim']);
        $user->deptid = $this->request->getPost('deptid',['int','trim']);

        $deptArray = \Depts::getArrayChildPermission($perL);
        if(!in_array($user->deptid, $deptArray)){
            $data['error'] = ['Đơn vị/bộ phận không hợp lệ'];
            $this->helper->responseJson($this, $data);
        }

        // $passwordVali = preg_match("#.*^(?=.{6,32})(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$#", $user->password);
        // if(!$passwordVali){
        //     $this->flashSession->error("Vui lòng nhập mật khẩu dài 6-32 ký tự, có ký tự chữ số, chữ hoa và chữ thường, ký tự @#$!%^&*");
        //     return $this->response->redirect(WEB_ADMIN_URI.'/user/profile');
        // }

        if (!$user->vdUpdate()) {
            foreach ($user->getMessages() as $message) {
                $data['error'] = [$message->getMessage()];
                $this->helper->responseJson($this, $data);
            }
        }

        if($id){
            $user->password = $oldPassword;
        }else{
            $user->password = $this->security->hash($user->password);
        }

        if (!$user->save()) {
            foreach ($user->getMessages() as $message) {
                $data['error'] = [$message->getMessage()];
                $this->helper->responseJson($this, $data);
            }
        }
        if($id){
            \Logs::saveLogs($this, 2, 'Cập nhật tài khoản '.$user->username, $userOld, $user->toArray());
        }else{
            \Logs::saveLogs($this, 1, 'Thêm mới tài khoản '.$user->username, "", $user->toArray());
        }
        $data['data'] = $user->toArray();
        unset($data['data']['password']);
        $this->helper->responseJson($this, $data);
    }

    public function deleteAction(){ 
        if (!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('user', 'delete')) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }
        $listId = $this->request->getPost('dataId',['string', 'trim']);
        if (!is_array($listId)) {
            $this->helper->responseJson($this, ["error" => ["Dữ liệu không hợp lệ"]]);
        }
        $listId = $this->helper->filterListIds($listId);

        try {
            $this->db->begin();
            foreach ($listId as $userid) {
                $this->deleteOne($userid,$perL);
            }
            $this->db->commit(); 
            $this->helper->responseJson($this, []);
        } catch (\Throwable $e) {
            $this->db->rollback();
            $this->helper->responseJson($this, ["error" => [$e->getMessage()]]);
        }    
    }

    public function changepasswordAction(){
        if ($this->request->isPost()) {

            if (!$this->security->checkToken()) {
                $this->flashSession->error("Token không chính xác.");
                return $this->response->redirect(WEB_ADMIN_URI.'/user/profile');
            }

            $userid = $this->session->get("userid");
            $password = $this->request->getPost('oldPassword');
            $newpassword = $this->request->getPost('password');
            // $passwordVali = preg_match("#.*^(?=.{6,32})(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$#", $newpassword);
            // if(!$passwordVali){
            //     $this->flashSession->error("Vui lòng nhập mật khẩu dài 6-32 ký tự, có ký tự chữ số, chữ hoa và chữ thường, ký tự @#$!%^&*");
            //     return $this->response->redirect(WEB_ADMIN_URI.'/user/profile');
            // }
            $user = \User::findFirstId($userid);
            if (!$user) {
                $this->flashSession->error("Không tìm thấy tài khoản này.");
                return $this->response->redirect(WEB_ADMIN_URI.'/user/profile');
            } else {
                if ($this->security->checkHash($password,$user->password)) {
                    $user->password = $this->security->hash($newpassword);
                    if (!$user->update()) {
                        $this->flashSession->error("Đổi mật khẩu thất bại.");
                        return $this->response->redirect(WEB_ADMIN_URI.'/user/profile');
                    } else {
                        \Logs::saveLogs($this, 2, 'Thay đổi mật khẩu');
                        $this->flashSession->success("Đổi mật khẩu thành công.");
                        return $this->response->redirect(WEB_ADMIN_URI.'/user/profile');
                    }
                }else{
                    $this->flashSession->error("Mật khẩu hiện tại không chính xác");
                    return $this->response->redirect(WEB_ADMIN_URI.'/user/profile');
                }
            }
        }else{
            return $this->response->redirect(WEB_ADMIN_URI.'/user/profile');
        }
    }

    public function avatarAction($id = null){
        if (!$this->request->isAjax() || !$this->request->isPost()) {
            $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
        }

        if (!$user = \User::findFirstId($id)) {
            $data['error'] = ['Không tìm thấy dữ liêụ'];
            $this->helper->responseJson($this, $data);
        }

        $userid = $this->session->get('userid');
        $user->updatedat = date('Y-m-d H:i:s');
        $user->updatedby = $userid;
        $checkAvatar = $this->helper->uploadImage('avatar',$user->avatar,'avatar/');
        if(!empty($checkAvatar['error'])){
            $data['error'] = [$checkAvatar['error']];
            $this->helper->responseJson($this, $data);
        }

        $user->avatar = $checkAvatar['filename'];

        if (!$user->vdUpdate()) {
            foreach ($user->getMessages() as $message) {
                $data['error'] = [$message->getMessage()];
                $this->helper->responseJson($this, $data);
            }
        } 

        if (!$user->save()) {
            foreach ($user->getMessages() as $message) {
                $data['error'] = [$message->getMessage()];
                $this->helper->responseJson($this, $data);
            }
        } 

        $this->session->set('avatar',$user->avatar);
        \Logs::saveLogs($this, 2, 'Thay đổi ảnh đại diện');
        $this->helper->responseJson($this, [
            'avatar' => [$user->avatar],
        ]);
        
    }

    public function checkAction(){
        if ($this->request->isPost()) {
            $password = $this->request->getPost('password');
            $user = \User::findFirstId($this->session->get("userid"));
            if ($this->security->checkHash($password,$user->password)) {
                $this->response->setStatusCode(200, "Password success");
                $this->response->setJsonContent([
                    'status' => 'OK',
                ]);
                $this->response->send();
            }else{
                $this->response->setStatusCode(400, "Password failed");
                $this->response->setJsonContent([
                    'status' => 'Failed',
                ]);
                $this->response->send();
            }
        }
    }

    public function exportAction(){
        $perL = $this->master::checkPermissionDepted('user', 'index');
        if (!$perL) {
            die('Truy cập không được phép');
        }
        $userid = $this->session->get('userid');
        $fullnameSearch = $this->request->get('fullnameSearch',['string', 'trim']);
        $usernameSearch = $this->request->get('usernameSearch',['string', 'trim']);
        $emailSearch = $this->request->get('emailSearch','email');
        $roleidSearch = $this->request->get('roleidSearch',['string', 'trim']);
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'u.id',
            'u.fullname',
            'u.username',
            'u.avatar',
            'u.gender',
            'u.email',
            'u.roleid',
            'u.status',
            'u.createdat',
            'R.name rolename',
            '(SELECT d.name FROM Depts AS d WHERE d.id = u.deptid) AS deptname'
        ))
        ->from(['u' => 'User'])
        ->where("u.deleted = 0 AND u.id != 1 AND u.id != $userid")
        ->join('Role', 'R.id = u.roleid','R')
        ->orderBy('u.roleid DESC');
        $data = $this->master::builderPermission($data,$perL,'u');
        if($fullnameSearch){
            $data = $data->andWhere('User.fullname LIKE :fullnameSearch:',['fullnameSearch' => '%'.$fullnameSearch.'%']);
        }
        if($usernameSearch){
            $data = $data->andWhere('User.username LIKE :usernameSearch:',['usernameSearch' => '%'.$usernameSearch.'%']);
        }
        if($emailSearch){
            $data = $data->andWhere('User.email LIKE :emailSearch:',['emailSearch' => '%'.$emailSearch.'%']);
        }
        if($roleidSearch && $roleidSearch != 'all'){
            $data = $data->andWhere('User.roleid = :roleidSearch:', ['roleidSearch' => $roleidSearch]);
        }
        // Export
        $export = new \Library\ExportExcel\ExportExcelUser();
        $export->run($data);
        die("\nError!!!");
    }

    public function importAction(){
        try {
            if (!$this->security->checkToken()) {
                $data['token'] = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
                $data['error'] = ['Token không chính xác'];
                $this->helper->responseJson($this, $data);
            }
            $token = ['key' => $this->security->getTokenKey(), 'value' => $this->security->getToken()];
            if (!$this->request->isAjax() || !$this->request->isPost() || !$perL = $this->master::checkPermissionDepted('user', 'update')) {
                $data['error'] = ['Truy cập không được phép'];
                $this->helper->responseJson($this, $data);
            }
            $this->db->begin();
            $importExcel = new \Library\ImportExcel\ImportExcelUser('importfile', [
                'size_max' => 2,
                'is_check_password' => false,
                'file_password' => EXCEL_PASSWORD,
                'perL' => $perL
            ]);
            $resValidation = $importExcel->validation();
            if ($resValidation !== true) {
                throw new \Exception($resValidation);
            }
            $importExcel->run();
            if (!empty($importExcel->error)) {
                throw new \Exception($importExcel->error);
            }
            $this->db->commit();
            $this->helper->responseJson($this, ["result" => ['Import thành công'], 'token' => $token]);
        } catch (\Exception $e) {
            $this->db->rollback();
            $this->helper->responseJson($this, ["error" => [$e->getMessage()], 'token' => $token]);
        }
    }

    // ===============================
    // FUNCTION
    // ===============================

    private function getJsCss (){
        // And some local JavaScript resources
        $this->assets->addJs(WEB_URL.'/assets/backend/js/modules/master/user.js?v='.VS_SCRIPT);
    }

    private function deleteOne($id,$perL) {

        $userid = $this->session->get('deptid');
        if($id == 1){
            throw new \Exception("ID: $id không được xóa");
        }

        if (!$user = \User::findFirstIdPermission($id,$perL)) {
            throw new \Exception("ID: $id không tồn tại");
        }

        $user->deleted = 1;
        $user->updatedat = date('Y-m-d H:i:s');
        $user->updatedby = $userid;

        if (!$user->save()) {
            foreach ($user->getMessages() as $message) {
                throw new \Exception("ID: $id ".$message->getMessage());                    
            }
        }
        \Logs::saveLogs($this, 3, "Xóa tài khoản người dùng: $user->username", ['table' => 'User','id' => $user->id]);
    }
}