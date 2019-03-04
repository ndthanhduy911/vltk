<?php
namespace Backend\Modules\Dashboard\Controllers;

use Library\Common;
use Library\Helper\Helper;

use Phalcon\Mvc\View;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\QueryBuilder as Paginator;

use Models\MailRemind;
use Models\Client;

class MailremindController  extends \BackendController
{
    public function indexAction()
    {
        if($this->request->getQuery('single')){
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'Models\MailRemind.id',
                'Models\MailRemind.contract_id',
                'Models\MailRemind.email_receiver',
                'Models\MailRemind.client_receiver',
                'Models\MailRemind.status',
                'Models\MailRemind.sent_date',
                'contract.contract_id contract_name',
            ))
            ->from('Models\MailRemind')
            ->join('Models\Contract', 'contract.id = Models\MailRemind.contract_id', 'contract')
            ->offset(10);
        $data = $data->getQuery()->execute();

        $currentPage = abs($this->request->getQuery('page', 'int', 1));
        if ($currentPage == 0) {
            $currentPage = 1;
        }
        $paginator = new PaginatorModel(
            [
                "data" => $data,
                "limit" => 10,
                "page" => $currentPage,
            ]
        );
        $this->view->page = $paginator->getPaginate();
    }

    public function notificaitonAction(){
        $this->view->disable();
        if ($this->request->isPost()) {
            $id = (int)$this->request->getPost("data");
            $maintenancejob = Contract::findFirstById($id);
            $maintenancejob->notify = null;
            if($maintenancejob->update()) echo true;
            else echo false;
        }
    }

    public function deleteAction()
    {
        if ($this->request->isPost()) {
            if($this->request->isAjax()){
                $id = (int)$this->request->getPost('id');
                if ( $mail = MailRemind::findFirstById($id)) {
                    if ($mail->delete()) {
                        $this->response->setStatusCode(200, 'OK');
                        $this->response->send();
                    } else {
                        $error = [];
                        foreach ($mail->getMessages() as $message) {
                            array_push($error, $message);
                        }
                        $this->response->setStatusCode(403, 'Failed');
                        $this->response->setJsonContent([
                            "error" => $error,
                        ]);
                        $this->response->send();
                    }
                } else {
                    $this->response->setStatusCode(404, 'Failed');
                    $this->response->setJsonContent([
                        "error" => '404',
                    ]);
                    $this->response->send();
                }
            }
        } else {
            return $this->response->redirect('/adcp/mail');
        }
    }
}
