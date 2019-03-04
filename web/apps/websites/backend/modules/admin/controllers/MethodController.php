<?php

namespace Backend\Modules\Dashboard\Controllers;

use Library\Common;
use Library\Helper\Helper;

use Phalcon\Paginator\Adapter\QueryBuilder as Paginator;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Mvc\View;

use Models\Method;
use Models\Package;
use Backend\Modules\Dashboard\Forms\EditMethodForm;


class MethodController extends \BackendController
{
    public function indexAction(){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'Models\Method.id',
                'Models\Method.name',
                'Models\Method.content',
                'Models\Method.package_id',
                'P.name package_name',
            ))
            ->from('Models\Method')
            ->join('Models\Package', 'P.id = Models\Method.package_id','P')
            ->where('1=1');
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
        $this->view->form = new EditMethodForm();
        $this->view->page = $paginator->getPaginate();
    }

    public function addAction(){
        $methodObj = new Method();
        $method = new EditMethodForm();
        $this->view->form = $method;
        if ($this->request->isAjax() && $this->request->isPost()) {
            $post = $this->request->getPost();
            $method->bind($post, $methodObj);
            if (!$method->isValid()) {
                $error = [];
                foreach ($method->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            }
            if (!$methodObj->save()) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $methodObj->getMessages()
                ]);
                return $this->response->send();
            } else {
                $this->helper->write_log(1, 1, 'Thêm phương thức <strong class="text-success">'.$methodObj->name.'</strong>' , json_encode($methodObj->toArray()));
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent([
                    'method' => $methodObj->toArray()
                ]);
                return $this->response->send();
            }
        }
    }

    public function getmethodAction(){
        $this->view->disable();
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'Models\Method.id',
            'Models\Method.name',
            'Models\Method.note',
            'Models\Method.status',

        ))
        ->from('Models\Method')
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

    public function editAction($id = null){
        $method = Method::findFirstById($id);
        $saveMethod = $method;
        $edit = new EditMethodForm();
        if ($this->request->isAjax() && $this->request->isPost()) {
            if (!$method) {
                $this->response->setStatusCode(404, 'Error');
                $this->response->setJsonContent([
                    'error' => ['Not find method'],
                ]);
                return $this->response->send();
            }
            $post = $this->request->getPost();
            $edit->bind($post, $method);
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
                if (!$method->save()) {
                    $error = [];
                    foreach ($method->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(404, 'Error');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $this->helper->write_log(2, 1, 'Cập nhật phương thức <strong class="text-info">'.$saveMethod->name.'</strong>' , json_encode($saveMethod->toArray()));
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'method' => $method->toArray()
                    ]);
                    return $this->response->send();
                }
            }
        } else {
            if (!$method) {
                $this->flashSession->error("Method does not exist");
                return $this->response->redirect('/adcp/method');
            }
            if ($this->request->isPost()) {
                $post = $this->request->getPost();
                $edit->bind($post, $method);
                if (!$edit->isValid()) {
                    foreach ($edit->getMessages() as $message) {
                        $this->flashSession->error($message->getMessage());
                        return $this->response->redirect('/adcp/method/edit/' . $id);
                    }
                } else {
                    if (!$method->save()) {
                        foreach ($edit->getMessages() as $message) {
                            $this->flashSession->error($message->getMessage());
                            return $this->response->redirect('/adcp/method/edit/' . $id);
                        }
                    } else {
                        $this->flashSession->success('Change information of method successfully');
                        return $this->response->redirect('/adcp/method');
                    }
                }
            } else {
                $this->view->form = new EditMethodForm($method);
            }
        }
    }

    public function deleteAction(){
        if ($this->request->isAjax()) {
            $this->view->disable();
            $id = (int)$this->request->getPost('id');
            if ($method = Method::findFirstById($id)) {
                $saveMethod = $method;
                if ($method->delete()) {
                    $this->helper->write_log(3, 1, 'Xóa phương thức <strong class="text-danger">'.$saveMethod->name.'</strong>' , json_encode($saveMethod->toArray()));
                    $this->response->setStatusCode(200, 'Deleted');
                    return $this->response->setJsonContent(['status' => 200]);
                } else {
                    $this->response->setStatusCode(500, 'Failed');
                    return $this->response->setJsonContent(['status' => 500]);
                }
            } else {
                $this->response->setStatusCode(404, 'Not find pack$method');
                return $this->response->setJsonContent(['status' => 404]);
            }
        } else {
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }
}
