<?php
/**
 * Created by PhpStorm.
 * User: huynguyen
 * Date: 10/8/14
 * Time: 10:25 PM
 */

namespace Backend\Modules\User\Controllers;
use Backend\Modules\User\Forms\FormCreateUserGroup;
use Models\Users\Groups;
use Models\Users\Permissions;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Mvc\Model\Resultset;
use Library\Pagination\Pager as Pager;
use Library\Constant\Constant;
class UserGroupsController extends \BackendController
{
    public $urlUserGroup = 'groups';
    public function indexAction()
    {

        $currentPage = abs($this->request->getQuery('page', 'int', 1));
        $usersGroups = Groups::find();
        $data = array();

        if ($currentPage == 0) {
            $currentPage = 1;
        }
        $Paginator = new Paginator(array(
            'data'  => $usersGroups,
            'limit' => 10,
            'page'  => $currentPage
        ));
        $pager = new Pager($Paginator,
            array(
                'layoutClass' => 'Library\Pagination\Pager\Layout\Bootstrap',
                'rangeLength' => 5,
                'urlMask'     => '',
            )
        );

        $this->view->pager = $pager;
    }



    public function updateStatusAction()
    {
        $GroupId = $this->request->get('users_id' , 'int');
        $publish = $this->request->get('status');

        if($GroupId > 0)
        {
            $Group = Groups::findFirstById($GroupId);
            if($Group)
            {
                if($Group->publish != $publish) {
                    $Group->publish = $publish;
                    $Group->save();
                }
                $this->flashSession->success("Cập nhật trạng thái thành công.");
            }
            else
            {
                $this->flashSession->error("Cập nhật trạng thái thất bại");
            }

            return $this->response->redirect($this->request->getHTTPReferer());
        }
    }

    public function editAction($id)
    {
        if($id == ""){
            $usersGroups = new Groups();
        }else{
            $usersGroups = Groups::findFirstById($id);
        }

        if(!$usersGroups)
        {
            $this->flash->error("Users Groups was not found");
            return $this->dispatcher->forward(array(
                'action' => 'index'
            ));
        }
        $usersGroups->publish = ($usersGroups->publish == 0) ? 2 :  1;
        $form = new FormCreateUserGroup($usersGroups , array('edit' => true));
        $tab = $this->request->get('tab') ? $this->request->get('tab') : 'general';

        if($this->request->isPost())
        {
            switch($tab)
            {
                case 'general':
                    if($form->isValid($this->request->getPost()) != false)
                    {

                        $usersGroups->assign($this->request->getPost());
                        $usersGroups->publish = ($usersGroups->publish == 1) ? 1 :  0;
                        if($usersGroups->save())
                        {

                            return $this->response->redirect($this->getBackendUrl() . '/' . $this->urlUserGroup);
                        }
                        $this->flash->error($usersGroups->getMessages());
                    }
                    break;

                case 'permission':
                    if($this->request->hasPost('permissions') && $this->request->getPost('permissions'))
                    {
                        // Deletes the current permissions
                        $usersGroups->getPermissions()->delete();

                        $permissions = $this->request->getPost('permissions');
                        foreach ($permissions as $permission) {
                            $parts = explode('.', $permission);
                            $usersGroupsPermissions = new Permissions();
                            $usersGroupsPermissions->setGroupId($id);
                            $usersGroupsPermissions->setResource($parts[0]);
                            $usersGroupsPermissions->setAction($parts[1]);
                            $usersGroupsPermissions->save();
                        }

                        // Rebuild the ACL with


                    }
                    break;
            }
        }
        $this->acl->rebuild();
        // Pass the current permissions to the views
        $this->view->permissions = $this->acl->getPermissions($usersGroups);
        $this->view->form = $form;
        $this->view->tab = $tab;
    }

    public function deleteAction($id)
    {
        if($id == USER_SYSTEM && $id == GROUP_SYSTEM){
            $this->flashSession->error("Không thể xóa tài khoản hệ thống.");
            return $this->response->redirect($this->request->getHTTPReferer());
        }

        $usersGroups = Groups::findFirstById($id);
        if(!$usersGroups)
        {
            $this->flash->error("Users Groups was not found");
            return $this->dispatcher->forward(array(
                'action' => 'index'
            ));
        }


        if(!$usersGroups->delete())
        {
            $this->flash->error($usersGroups->getMessages());
        }
        else
        {
            $this->flash->success("Users Groups was deleted");
        }

        return $this->response->redirect($this->getBackendUrl() . '/' . $this->urlUserGroup);
    }
} 