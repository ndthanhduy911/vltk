<?php

namespace Backend\Modules\Dashboard\Controllers;

use Library\Common;
use Library\Helper\Helper;

use Phalcon\Paginator\Adapter\QueryBuilder as Paginator;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Mvc\View;

use Models\Department;
use Backend\Modules\Dashboard\Forms\EditDepartmentForm;


class DepartmentController extends \BackendController
{
    public function indexAction(){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $data = Department::find(['id != 1']);
        $this->view->form = new EditDepartmentForm();
        $this->view->departments = $data;
    }

    public function addAction(){
        $departmentObj = new Department();
        $department = new EditDepartmentForm();
        if ($this->request->isAjax() && $this->request->isPost()) {
            $post = $this->request->getPost();
            $error = [];

            $checkMail = $post['email'] ? Department::findFirstByEmail($post['email']) : false;
            $checkName = $post['name'] ? Department::findFirstByName($post['name']) : false;
            $checkPhone = $post['phone'] ? Department::findFirstByPhone($post['phone']) : false;

            if($checkMail){
                array_push($error, 'Địa chỉ email đã tồn tại');
            }
            if($checkPhone){
                array_push($error, 'Số điện thoại đã tồn tại');
            }
            if($checkName){
                array_push($error, 'Tên đơn vị đã tồn tại');
            }

            if(count($error)){
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            }
            $department->bind($post, $departmentObj);
            if (!$department->isValid()) {
                $error = [];
                foreach ($department->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            }
            if (!$departmentObj->save()) {
                $error = [];
                foreach ($departmentObj->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            } else {
                $this->helper->write_log(1, 1, 'Thêm đơn vị <strong class="text-success">'.$departmentObj->name.'</strong>' , json_encode($departmentObj->toArray()));
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent([
                    'department' => $departmentObj->toArray()
                ]);
                return $this->response->send();
            }
        }
    }

    public function editAction($id = null){
        $department = Department::findFirstById($id);
        $saveDepartment = $department;
        $edit = new EditDepartmentForm();
        if ($this->request->isAjax() && $this->request->isPost()) {
            if (!$department) {
                $this->response->setStatusCode(404, 'Error');
                $this->response->setJsonContent([
                    'error' => ['Không tìm thấy đơn vị'],
                ]);
                return $this->response->send();
            }
            $post = $this->request->getPost();
            $error = [];

            $checkMail = false;
            $checkName = false;
            $checkPhone = false;

            if($post['email']){
                $checkMail = Department::findFirst([
                    "email='".$post['email']."' AND id != ".$id
                ]);
            }

            if($post['name']){
                $checkName = Department::findFirst([
                    "name='".$post['name']."' AND id != ".$id
                ]);
            }

            if($post['phone']){
                $checkPhone = Department::findFirst([
                    "phone='".$post['phone']."' AND id != ".$id
                ]);
            }

            if($checkMail){
                array_push($error, 'Địa chỉ email đã tồn tại');
            }
            if($checkName){
                array_push($error, 'Tên đơn vị đã tồn tại');
            }
            if($checkPhone){
                array_push($error, 'Số điện thoại đã tồn tại');
            }
            $edit->bind($post, $department);
            if (!$edit->isValid()) {
                $error = [];
                foreach ($edit->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(404, 'Error');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            } else {
                if (!$department->save()) {
                    $error = [];
                    foreach ($department->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(404, 'Error');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $this->helper->write_log(2, 1, 'Cập nhật thông tin đơn vị <strong class="text-info">'.$saveDepartment->name.'</strong>' , json_encode($saveDepartment->toArray()));
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'department' => $department->toArray()
                    ]);
                    return $this->response->send();
                }
            }
        }
    }

    public function getdepartmentAction(){
        $this->view->disable();
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'Models\Department.id',
            'Models\Department.name',
            'Models\Department.note',
            'Models\Department.time',
            'Models\Department.per_time',
            'Models\Department.status',
            'Models\Department.cost',
            'Models\Department.per_cost',
        ))
        ->from('Models\Department')
        ->limit(1000,10)
        ->where('1=1');
        $data = $data->getQuery()->execute();

        $count = $data->count();
        if ($count) {
            $count + 10;
        }
        $this->response->setStatusCode(200, 'OK');
        $this->response->setJsonContent([
            "recordsTotal" => $count,
            "recordsFiltered" => $count,
            'data' => $data->toArray()
        ]);
        $this->response->send();
    }

    public function deleteAction(){
        if ($this->request->isAjax()) {
            $this->view->disable();
            $id = (int)$this->request->getPost('id');
            if ($department = Department::findFirstById($id)) {
                $saveDepartment = $department;
                if ($department->delete()) {
                    $this->helper->write_log(3, 1, 'Xóa đơn vị <strong class="text-danger">'.$saveDepartment->name.'</strong>' , json_encode($saveDepartment->toArray()));
                    $this->response->setStatusCode(200, 'Deleted');
                    return $this->response->setJsonContent(['status' => 200]);
                } else {
                    $this->response->setStatusCode(500, 'Failed');
                    return $this->response->setJsonContent(['status' => 500]);
                }
            } else {
                $this->response->setStatusCode(404, 'Not find pack$department');
                return $this->response->setJsonContent(['status' => 404]);
            }
        } else {
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }
}
