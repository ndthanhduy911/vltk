<?php
namespace Backend\Modules\Dashboard\Controllers;

use Models\Logs;
use Models\User;
use Models\Client;
use Phalcon\Paginator\Adapter\QueryBuilder as Paginator;
use Library\Pagination\Pager as Pager;
use Phalcon\Mvc\View;

class LogController  extends \BackendController
{
    public function indexAction(){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'Models\Logs.id',
            'Models\Logs.user_id',
            'Models\Logs.page',
            'Models\Logs.type',
            'Models\Logs.name',
            'Models\Logs.detail',
            'Models\Logs.ip',
            'Models\Logs.divice',
            'Models\Logs.created_at',
        ))
        ->from('Models\Logs')
        ->where('Models\Logs.page=1')
        ->orderBy('Models\Logs.created_at DESC');
        $data = $data->getQuery()->execute();
        $this->view->logs = $data;
        $this->view->user = User::find()->toArray();
    }

    public function clientAction(){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'Models\Logs.id',
            'Models\Logs.user_id',
            'Models\Logs.page',
            'Models\Logs.type',
            'Models\Logs.name',
            'Models\Logs.detail',
            'Models\Logs.ip',
            'Models\Logs.divice',
            'Models\Logs.created_at',
        ))
        ->from('Models\Logs')
        ->where('Models\Logs.page=2')
        ->orderBy('Models\Logs.created_at DESC');
        $data = $data->getQuery()->execute();
        $this->view->logs = $data;
        $this->view->user = Client::find()->toArray();

    }

    public function viewAction($id = null){
        $log = Logs::findFirstById($id);
        if ($this->request->isAjax() && $this->request->isPost()) {
            if (!$log) {
                $this->response->setStatusCode(404, 'Error');
                $this->response->setJsonContent([
                    'error' => ['Not find log'],
                ]);
                return $this->response->send();
            }else{
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent([
                    'log' => $log->toArray()
                ]);
                return $this->response->send();
            }
        }
    }

    public function deleteAction(){
        if ($this->request->isAjax()) {
            $this->view->disable();
            $id = (int)$this->request->getPost('id');
            if ($log = Log::findFirstById($id)) {
                if ($log->delete()) {
                    $this->response->setStatusCode(200, 'Deleted');
                    return $this->response->setJsonContent(['status' => 200]);
                } else {
                    $this->response->setStatusCode(500, 'Failed');
                    return $this->response->setJsonContent(['status' => 500]);
                }
            } else {
                $this->response->setStatusCode(404, 'Not find pack$log');
                return $this->response->setJsonContent(['status' => 404]);
            }
        } else {
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }
}