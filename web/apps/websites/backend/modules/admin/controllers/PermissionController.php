<?php
namespace Backend\Modules\Dashboard\Controllers;

use Library\Common;
use Library\Helper\Helper;

use Phalcon\Paginator\Adapter\QueryBuilder as Paginator;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Mvc\View;

use Models\GroupUser;
use Models\Permission;
use Backend\Modules\Dashboard\Forms\EditPermissionForm;
use Backend\Modules\Dashboard\Forms\EditGroupForm;


class PermissionController extends \BackendController
{
    public function indexAction(){
        if ($this->request->getQuery('single')){
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'Models\GroupUser.id',
                'Models\GroupUser.name',
                'Models\GroupUser.permission_id',
                'Models\GroupUser.status',
            ))
            ->from('Models\GroupUser')
            ->where('1=1')
            ->andWhere('id != 1');
        $data = $data->getQuery()->execute();

        $currentPage = abs($this->request->getQuery('page', 'int', 1));
        if ($currentPage == 0) {
            $currentPage = 1;
        }
        $paginator = new PaginatorModel(
            [
                "data" => $data,
                "limit" => 1000,
                "page" => $currentPage,
            ]
        );
        $this->view->form = new EditGroupForm();
        $this->view->optgroupForm = Permission::find([
            'id != 1 AND status!=0','order' => 'optgroup',
            'columns' => 'id, name, optgroup'
        ])->toArray();
        $this->view->page = $paginator->getPaginate();
    }

    public function listAction(){
        if ($this->request->getQuery('single')){
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'Models\Permission.id',
                'Models\Permission.name',
                'Models\Permission.controller',
                'Models\Permission.action',
                'Models\Permission.description',
                'Models\Permission.status',
            ))
            ->from('Models\Permission')
            ->orderBy('controller')
            ->where('1=1');
        $data = $data->getQuery()->execute();

        $currentPage = abs($this->request->getQuery('page', 'int', 1));
        if ($currentPage == 0) {
            $currentPage = 1;
        }
        $paginator = new PaginatorModel(
            [
                "data" => $data,
                "limit" => 10000,
                "page" => $currentPage,
            ]
        );
        $this->view->form = new EditPermissionForm();
        $this->view->page = $paginator->getPaginate();
    }

    public function addgroupAction(){
        $groupObj = new GroupUser();
        $group = new EditGroupForm();
        $this->view->form = $group;
        if ($this->request->isAjax() && $this->request->isPost()) {
            $post = $this->request->getPost();
            $group->bind($post, $groupObj);
            if (!$group->isValid()) {
                $error = [];
                foreach ($group->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            }
            $groupObj->permission_id=json_encode(explode(",",$post['permission_id']));
            if (!$groupObj->save()) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $groupObj->getMessages()
                ]);
                return $this->response->send();
            } else {
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent([
                    'group' => $groupObj->toArray()
                ]);
                return $this->response->send();
            }
        }
    }

    public function editgroupAction($group_id = null){

        if ($this->request->isAjax() && $this->request->isPost()) {
            $groupObj = GroupUser::findFirstById($group_id);
            $group = new EditGroupForm();
            $this->view->form = $group;
            $post = $this->request->getPost();
            $group->bind($post, $groupObj);
            if (!$group->isValid()) {
                $error = [];
                foreach ($group->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            }
            $groupObj->permission_id=json_encode(explode(",",$post['permission_id']));
            if (!$groupObj->save()) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $groupObj->getMessages()
                ]);
                return $this->response->send();
            } else {
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent([
                    'group' => $groupObj->toArray()
                ]);
                return $this->response->send();
            }
        }
    }

    public function editAction($id = null){

        if ($this->request->isAjax() && $this->request->isPost()) {
            $permissionObj = Permission::findFirstById($id);
            $permission = new EditPermissionForm();
            $this->view->form = $permission;
            $post = $this->request->getPost();
            $permission->bind($post, $permissionObj);
            if (!$permission->isValid()) {
                $error = [];
                foreach ($permission->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            }
            if (!$permissionObj->save()) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $permissionObj->getMessages()
                ]);
                return $this->response->send();
            } else {
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent([
                    'permission' => $permissionObj->toArray()
                ]);
                return $this->response->send();
            }
        }
    }

    public function deletegroupAction(){
        if ($this->request->isPost()) {
            if ($this->request->isAjax()) {
                $this->view->disable();
                $id = (int)$this->request->getPost('id');
                if ($user = GroupUser::findFirstById($id)) {
                    $saveUser = $user;
                    if ($user->delete()) {
                        $this->helper->write_log(3, 1, 'Xóa xóa nhóm quyền có ID: <strong class="text-danger">'.$saveUser->id.'</strong>' , json_encode($saveUser->toArray()));
                        $this->response->setStatusCode(200, 'Deleted');
                        return $this->response->setJsonContent(['status' => 200]);
                    } else {
                        $this->response->setStatusCode(500, 'Failed');
                        return $this->response->setJsonContent(['status' => 500]);
                    }
                } else {
                    $this->response->setStatusCode(404, 'Not find user');
                    return $this->response->setJsonContent(['status' => 404]);
                }
            } else {
                return $this->response->setStatusCode(403, ' Forbidden');
            }
        }
    }
}
