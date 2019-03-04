<?php

namespace Backend\Modules\Dashboard\Controllers;

use Library\Common;
use Library\Helper\Helper;

use Phalcon\Paginator\Adapter\QueryBuilder as Paginator;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Mvc\View;

use Models\Client;
use Models\Package;
use Backend\Modules\Dashboard\Forms\EditPackageForm;


class PackageController extends \BackendController
{
    public function indexAction(){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'Models\Package.id',
                'Models\Package.name',
                'Models\Package.note',
                'Models\Package.status',


            ))
            ->from('Models\Package')
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
        $this->view->form = new EditPackageForm();
        $this->view->page = $paginator->getPaginate();
    }

    public function addAction(){
        $packageObj = new Package();
        $package = new EditPackageForm();
        $this->view->form = $package;
        if ($this->request->isAjax() && $this->request->isPost()) {
            $post = $this->request->getPost();
            $package->bind($post, $packageObj);
            if (!$package->isValid()) {
                $error = [];
                foreach ($package->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            }
            if (!$packageObj->save()) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $packageObj->getMessages()
                ]);
                return $this->response->send();
            } else {
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent([
                    'package' => $packageObj->toArray()
                ]);
                return $this->response->send();
            }
        } else {
            if ($this->request->isPost()) {
                $post = $this->request->getPost();
                $package->bind($post, $packageObj);
                if (!$package->isValid()) {
                    foreach ($package->getMessages() as $message) {
                        $this->flashSession->error($message->getMessage());
                        if ($this->dispatcher->getControllerName() != 'package') {
                            $this->dispatcher->forward([
                                'module' => 'adcp',
                                'controller' => 'package',
                                'action' => 'add',
                            ]);
                            return false;
                        }
                        return;
                    }
                }
                if (!$packageObj->save()) {
                    foreach ($packageObj->getMessages() as $message) {
                        $this->flashSession->error($message->getMessage());
                        if ($this->dispatcher->getControllerName() != 'package') {
                            $this->dispatcher->forward([
                                'module' => 'adcp',
                                'controller' => 'package',
                                'action' => 'add',
                            ]);
                            return false;
                        }
                        return;
                    }
                }

                $this->flashSession->success("Add package successfully");
                return $this->response->redirect('/adcp/package/index');
            }
        }
    }

    public function editAction($id = null){
        $package = Package::findFirstById($id);
        $edit = new EditPackageForm();
        if ($this->request->isAjax() && $this->request->isPost()) {
            if (!$package) {
                $this->response->setStatusCode(404, 'Error');
                $this->response->setJsonContent([
                    'error' => ['Not find package'],
                ]);
                return $this->response->send();
            }
            $post = $this->request->getPost();
            $edit->bind($post, $package);
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
                if (!$package->save()) {
                    $error = [];
                    foreach ($package->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(404, 'Error');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'package' => $package->toArray()
                    ]);
                    return $this->response->send();
                }
            }
        } else {
            if (!$package) {
                $this->flashSession->error("Package does not exist");
                return $this->response->redirect('/adcp/package');
            }
            if ($this->request->isPost()) {
                $post = $this->request->getPost();
                $edit->bind($post, $package);
                if (!$edit->isValid()) {
                    foreach ($edit->getMessages() as $message) {
                        $this->flashSession->error($message->getMessage());
                        return $this->response->redirect('/adcp/package/edit/' . $id);
                    }
                } else {
                    if (!$package->save()) {
                        foreach ($edit->getMessages() as $message) {
                            $this->flashSession->error($message->getMessage());
                            return $this->response->redirect('/adcp/package/edit/' . $id);
                        }
                    } else {
                        $this->flashSession->success('Change information of package successfully');
                        return $this->response->redirect('/adcp/package');
                    }
                }
            } else {
                $this->view->form = new EditPackageForm($package);
            }
        }
    }

    public function deleteAction(){
        if ($this->request->isAjax()) {
            $this->view->disable();
            $id = (int)$this->request->getPost('id');
            if ($package = Package::findFirstById($id)) {
                $savePackage = $package;
                if ($package->delete()) {
                    $this->helper->write_log(3, 1, 'Xóa mô tả dịch vụ <strong class="text-danger">'.$savePackage->name.'</strong>' , json_encode($savePackage->toArray()));
                    $this->response->setStatusCode(200, 'Deleted');
                    return $this->response->setJsonContent(['status' => 200]);
                } else {
                    $this->response->setStatusCode(500, 'Failed');
                    return $this->response->setJsonContent(['status' => 500]);
                }
            } else {
                $this->response->setStatusCode(404, 'Not find pack$package');
                return $this->response->setJsonContent(['status' => 404]);
            }
        } else {
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }
}
