<?php
namespace Backend\Modules\Dashboard\Controllers;

use Library\Helper\Helper;

use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\QueryBuilder as Paginator;
use Phalcon\Mvc\View;

use Models\Client;
use Models\Package;
use Models\User;
use Backend\Modules\Dashboard\Forms\EditClientForm;

class ClientController extends \BackendController
{
    public function indexAction(){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $permission = $this->session->get("permission");
        $user = $this->auth->getIdentity();
        if($permission !== 1 && array_search('onlydept',$permission['client']) !== false){
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'Models\Client.id',
                'Models\Client.name',
                'Models\Client.address',
                'Models\Client.department_id',
                'Models\Client.email',
                'Models\Client.phone',
                'Models\Client.status',
                'Models\Client.package_id',
                'D.name client_name'
            ))
            ->from('Models\Client')
            ->join('Models\Department', 'D.id = Models\Client.department_id','D')
            ->where('Models\Client.department_id='.$user['department_id']);
            $this->view->dept = $user['department_id'];
        }else{
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'Models\Client.id',
                'Models\Client.name',
                'Models\Client.address',
                'Models\Client.department_id',
                'Models\Client.email',
                'Models\Client.phone',
                'Models\Client.status',
                'Models\Client.package_id',
                'D.name client_name'
            ))
            ->from('Models\Client')
            ->join('Models\Department', 'D.id = Models\Client.department_id','D')
            ->where('1=1');
            $this->view->dept = false;
        }

        $package = json_decode($this->auth->getIdentity()['package_id']);
        if(array_search('all' , $package) !== false){
            $packageList =  Package::find();
        }else{
            $packageList =  Package::find(array(
                'id IN ('.implode(',',$package).')'
            ));
        }

        $data = $data->getQuery()->execute();
        $this->view->form = new EditClientForm();
        $this->view->clients = $data;
        $this->view->package = $packageList;
    }

    public function addAction(){
        if ($this->request->isAjax() && $this->request->isPost()) {
            $clientObj = new Client();
            $client = new EditClientForm();
            $permission = $this->session->get("permission");
            $user = $this->auth->getIdentity();
            $post = $this->request->getPost();
            $client->bind($post, $clientObj);
            if (!$client->isValid()) {
                $error = [];
                foreach ($client->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            }
            $error = [];

            $checkMail = Client::findFirstByEmail($post['email']);
            $checkMail2 = User::findFirstByEmail($post['email']);

            $checkPhone = Client::findFirstByPhone($post['phone']);

            if($checkMail || $checkMail2){
                array_push($error, 'Địa chỉ email đã tồn tại');
            }
            if($checkPhone){
                array_push($error, 'Số điện thoại đã tồn tại');
            }

            if(empty($post['package_id'])){
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Lỗi chọn loại dịch vụ'],
                ]);
                return $this->response->send();
            }

            if(count($error)){
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            }
            
            $clientObj->created_at = date("Y-m-d H:i:s");
            $clientObj->package_id = json_encode($post['package_id']);
            $clientObj->user_created_id = (int)$this->auth->getIdentity()['id'];
            $pRandom = $this->helper->random_code(8);
            $clientObj->password = $this->security->hash($pRandom);
            if($permission !== 1 && array_search('onlydept',$permission['client']) !== false){
                $clientObj->department_id = $user['department_id'];
            }
            if (!$clientObj->save()) {
                $error = [];
               
                foreach ($clientObj->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            } else {
                $this->helper->write_log(1, 1, 'Thêm người yêu cầu có ID: <strong class="text-success">'.$clientObj->id.'</strong>' , json_encode($clientObj->toArray()));
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent([
                    'client' => $clientObj->toArray(),
                    'title'   => 'TẠO TÀI KHOẢN THÀNH CÔNG',
                    'body'          => $this->helper->getTextEmailPassword($clientObj->name, $clientObj->email, $pRandom)
                ]);
                return $this->response->send();
            }
        }
    }

    public function editAction($id = null){
        if ($this->request->isAjax() && $this->request->isPost()) {
            $client = Client::findFirstById($id);
            if (!$client) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Not find client'],
                ]);
                return $this->response->send();
            }
            $saveClient = $client;
            $post = $this->request->getPost();
            $error = [];
            $checkMail = Client::findFirst([
                "email='".$post['email']."' AND id != ".$id
            ]);

            $checkMail2 = User::findFirstByEmail($post['email']);
            
            $checkPhone = Client::findFirst([
                "phone='".$post['phone']."' AND id != ".$id
            ]);

            if($checkMail || $checkMail2){
                array_push($error, 'Địa chỉ email đã tồn tại');
            }
            if($checkPhone){
                array_push($error, 'Số điện thoại đã tồn tại');
            }
            if(empty($post['package_id'])){
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Lỗi chọn loại dịch vụ'],
                ]);
                return $this->response->send();
            }
            if(count($error)){
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            }

            $edit = new EditClientForm();
            $edit->bind($post, $client);
            if (!$edit->isValid()) {
                $error = [];
                foreach ($edit->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            } else {
                $client->package_id = json_encode($post['package_id']);
                $client->updated_at = date("Y-m-d H:i:s");
                $permission = $this->session->get("permission");
                $user = $this->auth->getIdentity();
                if($permission !== 1 && isset($permission['client']) ? array_search('onlydept',$permission['client']) : false !== false){
                    if($client->department_id !== $user['department_id']){
                        $this->response->setStatusCode(500, 'Failed');
                        $this->response->setJsonContent([
                            'error' => ['Đơn vị không hợp lệ'],
                        ]);
                        return $this->response->send();
                    }else{
                        $client->department_id = $user['department_id'];
                    }
                }
                if (!$client->save()) {
                    $error = [];
                    foreach ($client->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $this->helper->write_log(2, 1, 'Cập nhật thông tin người yêu cầu ID: <strong class="text-info">'.$saveClient->id.'</strong>' , json_encode($saveClient->toArray()));
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'client' => $client->toArray()
                    ]);
                    return $this->response->send();
                }
            }
        }
    }

    public function changepasswordAction(){
        $this->view->disable();
        if ($this->request->isAjax() && $this->request->isPost()) {
            $post = $this->request->getPost();
            $id = $post['id'];
            $client = Client::findFirstById($id);
            if (!$client) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Not find client'],
                ]);
                return $this->response->send();
            }
            $permission = $this->session->get("permission");
            $user = $this->auth->getIdentity();
            if($permission !== 1 && isset($permission['client']) ? array_search('onlydept',$permission['client']) : false !== false){
                if($client->department_id !== $user['department_id']){
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => ['Đơn vị không hợp lệ'],
                    ]);
                    return $this->response->send();
                }
            }
            $saveClient = $client;
            $client->updated_at = date("Y-m-d H:i:s");
            $client->password = $this->security->hash($post['password']);
            if (!$client->save()) {
                $error = [];
                foreach ($client->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            } else {
                $this->helper->write_log(2, 1, 'Thay đổi mật khẩu người yêu cầu có ID: <strong class="text-info">'.$clientObj->id.'</strong>' , json_encode($saveClient->toArray()));
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent([
                    'client' => $client->toArray()
                ]);
                return $this->response->send();
            }
        }
    }


    public function deleteAction(){
        if ($this->request->isAjax()) {
            $this->view->disable();
            $id = (int)$this->request->getPost('id');
            if ($client = Client::findFirstById($id)) {
                $permission = $this->session->get("permission");
                $user = $this->auth->getIdentity();
                if($permission !== 1 && isset($permission['client']) ? array_search('onlydept',$permission['client']) : false !== false){
                    if($client->department_id !== $user['department_id']){
                        $this->response->setStatusCode(500, 'Failed');
                        $this->response->setJsonContent([
                            'error' => ['Đơn vị không hợp lệ'],
                        ]);
                        return $this->response->send();
                    }
                }
                $saveClient = $client;
                
                if ($client->delete()) {
                    $this->helper->write_log(3, 1, 'Xóa người yêu cầu có ID: <strong class="text-danger">'.$saveClient->id.'</strong>' , json_encode($saveClient->toArray()));
                    $this->response->setStatusCode(200, 'Deleted');
                    return $this->response->setJsonContent(['status' => 200]);
                } else {
                    $this->response->setStatusCode(500, 'Failed');
                    return $this->response->setJsonContent(['status' => 500]);
                }
            } else {
                $this->response->setStatusCode(404, 'Not find client');
                return $this->response->setJsonContent(['status' => 404]);
            }
        } else {
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }
}