<?php
namespace Backend\Modules\Dashboard\Controllers;

use Library\Helper\Helper;

use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\QueryBuilder as Paginator;
use Phalcon\Mvc\View;

use Models\Support;
use Models\Client;
use Models\Package;
use Models\User;
use Models\Department;
use Models\Comment;
use Models\CommentClient;
use Models\Notification;

use Backend\Modules\Dashboard\Forms\EditSupportForm;

class SupportController extends \BackendController
{
    public function indexAction(){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $userObj = $this->auth->getIdentity();
        $permission = $this->session->get("permission");
        $package_id = json_decode($userObj['package_id']);
        if($permission !== 1 && array_search('onlydept',$permission['support']) !== false){
            if(array_search('all',$package_id)!==false){
                $data = $this->modelsManager->createBuilder()
                ->columns(array(
                    'Models\Support.id',
                    'Models\Support.package_id',
                    'Models\Support.client_id',
                    'Models\Support.assign_person_id',
                    'Models\Support.user_assign_id',
                    'Models\Support.main_assign_person',
                    'Models\Support.des_assign',
                    'Models\Support.req_package',
                    'Models\Support.content',
                    'Models\Support.note',
                    'Models\Support.status',
                    'Models\Support.deadline',
                    'Models\Support.progress',
                    'Models\Support.file',
                    'Models\Support.priority',
                    'Models\Support.ticket',
                    'Models\Support.department_id',
                    'Models\Support.department_other',
                    'Models\Support.created_at',
                    'Models\Support.date_assign',
                    'C.name client_name',
                    'D.name department_name',
                    'P.name package_name', 
                ))
                ->from('Models\Support')
                ->join('Models\Client', 'C.id = Models\Support.client_id','C')
                ->join('Models\Package', 'P.id = Models\Support.package_id','P')
                ->join('Models\Department', 'D.id = Models\Support.department_id','D')
                ->orderBy('Models\Support.created_at DESC')
                ->where('1=1')
                ->andWhere('Models\Support.department_id = '.$userObj['department_id']);
                $data = $data->getQuery()->execute();
            }else{
                $data = $this->modelsManager->createBuilder()
                ->columns(array(
                    'Models\Support.id',
                    'Models\Support.package_id',
                    'Models\Support.client_id',
                    'Models\Support.assign_person_id',
                    'Models\Support.user_assign_id',
                    'Models\Support.main_assign_person',
                    'Models\Support.des_assign',
                    'Models\Support.req_package',
                    'Models\Support.content',
                    'Models\Support.note',
                    'Models\Support.status',
                    'Models\Support.deadline',
                    'Models\Support.progress',
                    'Models\Support.file',
                    'Models\Support.priority',
                    'Models\Support.ticket',
                    'Models\Support.department_id',
                    'Models\Support.department_other',
                    'Models\Support.created_at',
                    'Models\Support.date_assign',
                    'C.name client_name',
                    'D.name department_name',
                    'P.name package_name', 
                ))
                ->from('Models\Support')
                ->join('Models\Client', 'C.id = Models\Support.client_id','C')
                ->join('Models\Package', 'P.id = Models\Support.package_id','P')
                ->join('Models\Department', 'D.id = Models\Support.department_id','D')
                ->where('Models\Support.package_id IN ('.implode(",",$package_id).')')
                ->andWhere('Models\Support.department_id = '.$userObj['department_id'])
                ->orderBy('Models\Support.created_at DESC');
                $data = $data->getQuery()->execute();
            }
        }else {
            if(array_search('all',$package_id)!==false){
                $data = $this->modelsManager->createBuilder()
                ->columns(array(
                    'Models\Support.id',
                    'Models\Support.package_id',
                    'Models\Support.client_id',
                    'Models\Support.assign_person_id',
                    'Models\Support.user_assign_id',
                    'Models\Support.main_assign_person',
                    'Models\Support.des_assign',
                    'Models\Support.req_package',
                    'Models\Support.content',
                    'Models\Support.note',
                    'Models\Support.status',
                    'Models\Support.deadline',
                    'Models\Support.progress',
                    'Models\Support.file',
                    'Models\Support.priority',
                    'Models\Support.ticket',
                    'Models\Support.department_id',
                    'Models\Support.department_other',
                    'Models\Support.created_at',
                    'Models\Support.date_assign',
                    'C.name client_name',
                    'D.name department_name',
                    'P.name package_name', 
                ))
                ->from('Models\Support')
                ->join('Models\Client', 'C.id = Models\Support.client_id','C')
                ->join('Models\Package', 'P.id = Models\Support.package_id','P')
                ->join('Models\Department', 'D.id = Models\Support.department_id','D')
                ->orderBy('Models\Support.created_at DESC')
                ->where('1=1');
                $data = $data->getQuery()->execute();
            }else{
                $data = $this->modelsManager->createBuilder()
                ->columns(array(
                    'Models\Support.id',
                    'Models\Support.package_id',
                    'Models\Support.client_id',
                    'Models\Support.assign_person_id',
                    'Models\Support.user_assign_id',
                    'Models\Support.main_assign_person',
                    'Models\Support.des_assign',
                    'Models\Support.req_package',
                    'Models\Support.content',
                    'Models\Support.note',
                    'Models\Support.status',
                    'Models\Support.deadline',
                    'Models\Support.progress',
                    'Models\Support.file',
                    'Models\Support.priority',
                    'Models\Support.ticket',
                    'Models\Support.department_id',
                    'Models\Support.department_other',
                    'Models\Support.created_at',
                    'Models\Support.date_assign',
                    'C.name client_name',
                    'D.name department_name',
                    'P.name package_name', 
                ))
                ->from('Models\Support')
                ->join('Models\Client', 'C.id = Models\Support.client_id','C')
                ->join('Models\Package', 'P.id = Models\Support.package_id','P')
                ->join('Models\Department', 'D.id = Models\Support.department_id','D')
                ->where('Models\Support.package_id IN ('.implode(",",$package_id).')')
                ->orderBy('Models\Support.created_at DESC');
                $data = $data->getQuery()->execute();
            }
        }
        $currentPage = abs($this->request->getQuery('page', 'int', 1));
        if ($currentPage == 0) {
            $currentPage = 1;
        }
        $paginator = new PaginatorModel(
            [
                "data" => $data,
                "limit" => 10000000,
                "page" => $currentPage,
            ]
        );
        $this->view->form = new EditSupportForm();
        $this->view->page = $paginator->getPaginate();
        $this->view->user = User::find()->toArray();
    }

    public function mysupportAction($id=null){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $userObj =  $this->session->get('auth-identity');
        if(!$this->request->isPost()){
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'Models\Support.id',
                'Models\Support.package_id',
                'Models\Support.client_id',
                'Models\Support.assign_person_id',
                'Models\Support.user_assign_id',
                'Models\Support.main_assign_person',
                'Models\Support.des_assign',
                'Models\Support.req_package',
                'Models\Support.content',
                'Models\Support.note',
                'Models\Support.status',
                'Models\Support.deadline',
                'Models\Support.progress',
                'Models\Support.file',
                'Models\Support.priority',
                'Models\Support.ticket',
                'Models\Support.department_id',
                'Models\Support.department_other',
                'Models\Support.created_at',
                'Models\Support.date_assign',
                'C.name client_name',
                'D.name department_name',
                'P.name package_name',
            ))
            ->from('Models\Support')
            ->join('Models\Client', 'C.id = Models\Support.client_id','C')
            ->join('Models\Package', 'P.id = Models\Support.package_id','P')
            ->join('Models\Department', 'D.id = Models\Support.department_id','D')
            ->where("Models\Support.assign_person_id LIKE :id:",["id" => '%"' . $userObj['id'] . '"%']);
            $data = $data->getQuery()->execute();
            $currentPage = abs($this->request->getQuery('page', 'int', 1));
            if ($currentPage == 0) {
                $currentPage = 1;
            }
            $paginator = new PaginatorModel(
                [
                    "data" => $data,
                    "limit" => 10000000,
                    "page" => $currentPage,
                ]
            );
            $this->view->form = new EditSupportForm();
            $this->view->page = $paginator->getPaginate();
            $this->view->user = User::find()->toArray();
        }
    }

    public function assignAction($id = null){
        $this->view->disable();
        if ($this->request->isAjax() && $this->request->isPost()) {
            $support = Support::findFirstById($id);
            if (!$support) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Không tìm thấy hỗ trợ này'],
                ]);
                return $this->response->send();
            }
            $post = $this->request->getPost();
            $assign_person_id = !empty($post['assign_person_id']) ? json_encode($post['assign_person_id']) : '[]';
            $main_assign_person = !empty($post['main_assign_person']) ? json_encode($post['main_assign_person']) : '[]';
            if(!$support->date_assign){
                $support->date_assign = date("Y-m-d H:i:s");
            }
            
            $post['deadline'] = $post['deadline'] ? date("Y-m-d H:i:s", strtotime($post['deadline'])) : null;
            $edit = new EditSupportForm();
            $edit->bind($post, $support);
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
                $userObj =  $this->session->get('auth-identity');
                $support->assign_person_id = $assign_person_id;
                $support->main_assign_person = $main_assign_person;

                if(!count($post['assign_person_id'])){
                    $support->status = 0;
                    $support->user_assign_id = 0;
                    $support->deadline = null;
                } else if (!$support->status){
                    $support->status = 1;
                    $support->user_assign_id = $userObj['id'];
                } else {
                    $support->user_assign_id = $userObj['id'];
                }
                $user = User::find([
                    'id IN (:ids:)',
                    'bind' => [
                        'ids' => implode(',',$post['assign_person_id']),
                    ]
                ])->toArray();
                // $this->helper->send_multiple_email($user, [], 'TECHNICAL SUPPORT CÔNG VIỆC ĐƯỢC GIAO',$this->helper->getTextHaveAssign($userObj['fullname'],$post['des_assign']));
                if (!$support->save()) {
                    $error = [];
                    foreach ($support->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $user = User::find([
                        'id IN (:ids:)',
                        'bind' => [
                            'ids' => implode(',',$post['assign_person_id']),
                        ]
                    ])->toArray();
                    $body = $this->helper->getTextHaveAssign($userObj['fullname'],$post['des_assign']);
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'support' => $support->toArray(),
                        'title'   => "[".$support->ticket."] ĐƯỢC GIAO XỬ LÝ YÊU CẦU",
                        'users'   => $post['assign_person_id'],
                        'body'    => $body
                    ]);
                    return $this->response->send();
                }
            }
        }
    }

    public function dosupportAction($id = null){
        $this->view->disable();
        if ($this->request->isAjax() && $this->request->isPost()) {
            $support = Support::findFirstById($id);
            if (!$support) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Không tìm thấy hỗ trợ này'],
                ]);
                return $this->response->send();
            }
            $post = $this->request->getPost();
            $edit = new EditSupportForm();
            $edit->bind($post, $support);
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
                $userObj =  $this->session->get('auth-identity');

                if (!$support->save()) {
                    $error = [];
                    foreach ($support->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'mysupport' => $support->toArray()
                    ]);
                    return $this->response->send();
                }
            }
        }
    }

    public function deleteAction(){
        if ($this->request->isAjax()) {
            $this->view->disable();
            $id = (int)$this->request->getPost('id');
            if ($support = Support::findFirstById($id)) {
                $saveSupport = $support;
                $files = json_decode($support->file);
                if ($support->delete()) {
                    $this->helper->write_log(1, 1, 'Xóa hỗ trợ <strong class="text-danger">'.$saveSupport->ticket. '</strong>', json_encode($saveSupport->toArray()));
                    if($files != "[]" && $files){
                        foreach ($files as $key => $file) {
                            unlink(BASE_DIR.'/public_html/files/support/'.$file);
                        }
                    }
                    $this->response->setStatusCode(200, 'Deleted');
                    return $this->response->setJsonContent(['status' => 200]);
                } else {
                    $this->response->setStatusCode(500, 'Failed');
                    return $this->response->setJsonContent(['status' => 500]);
                }
            } else {
                $this->response->setStatusCode(404, 'Not find support');
                return $this->response->setJsonContent(['status' => 404]);
            }
        } else {
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }

    public function getcommentAction($support_id=null){
        if($this->request->isAjax()){
            $this->view->disable();
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'Models\Comment.id',
                'Models\Comment.user_id',
                'Models\Comment.support_id',
                'Models\Comment.content',
                'Models\Comment.file',
                'Models\Comment.created_at',
                'Models\Comment.updated_at',
                'U.fullname name',
                'U.email user_name',
                'S.id support_id'
            ))
            ->from('Models\Comment')
            ->join('Models\User', 'U.id = Models\Comment.user_id','U')
            ->join('Models\Support', 'S.id = Models\Comment.support_id','S')
            ->where('S.id = '.$support_id)
            ->orderBy('Models\Comment.created_at ASC');
            $data = $data->getQuery()->execute();

            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent([
                'comment' => $data->toArray(),
            ]);
            return $this->response->send();
        }else{

        }

    }

    public function getmessageAction($support_id=null){
        if($this->request->isAjax()){
            $this->view->disable();
            $data = $this->modelsManager->createBuilder()
            ->columns(array(
                'Models\CommentClient.id',
                'Models\CommentClient.user_id',
                'Models\CommentClient.support_id',
                'Models\CommentClient.type_user',
                'Models\CommentClient.content',
                'Models\CommentClient.file',
                'Models\CommentClient.created_at',
                'Models\CommentClient.updated_at',
                'S.id support_id'
            ))
            ->from('Models\CommentClient')
            ->join('Models\Support', 'S.id = Models\CommentClient.support_id','S')
            ->where('S.id = '.$support_id)
            ->orderBy('Models\CommentClient.created_at ASC');
            $data = $data->getQuery()->execute();

            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent([
                'message'   => $data->toArray(),
                'client'    => Client::find([
                    'columns' => 'id, name, email, avatar'
                ])->toArray(),
                'user'      => User::find([
                    'columns' => 'id, fullname, email, avatar'
                ])->toArray()
            ]);
            return $this->response->send();
        }else{

        }

    }

    public function sendcommentAction($support_id=null){
        if($this->request->isAjax()){
            $this->view->disable();
            $commentObj = new Comment();
            $commentObj->content = $this->request->getPost('content');
            $commentObj->support_id = $support_id;
            $userObj = $this->auth->getIdentity();
            $commentObj->user_id = $userObj['id'];
            if ($this->request->hasFiles() == true) {
                $files =[];
                foreach ($this->request->getUploadedFiles() as $file){
                    if($file->getSize()){
                        $now = strtotime("now");
                        $file->moveTo(BASE_DIR.'/public_html/files/support/'.$now.'_'.$file->getName());
                        array_push($files,$now.'_'.$file->getName());
                    }
                }
                $commentObj->file = json_encode($files);
            }
            if (!$commentObj->save()) {
                $error = [];
                foreach ($commentObj->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            } else {
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent([
                    'comment' => $commentObj->toArray(),
                    'email' => $userObj['email'],
                    'name'  => $userObj['fullname'],
                    'avatar'  => $userObj['avatar']
                ]);
                return $this->response->send();
            }
        }else{

        }
    }

    public function sendclientcommentAction($support_id=null){
        if($this->request->isAjax()){
            $this->view->disable();
            $commentObj = new CommentClient();
            $commentObj->content = $this->request->getPost('content');
            $commentObj->support_id = $support_id;
            $userObj = $this->auth->getIdentity();
            $commentObj->user_id = $userObj['id'];
            $commentObj->type_user = 2;
            if ($this->request->hasFiles() == true) {
                $files =[];
                foreach ($this->request->getUploadedFiles() as $file){
                    if($file->getSize()){
                        $now = strtotime("now");
                        $file->moveTo(BASE_DIR.'/public_html/files/support/'.$now.'_'.$file->getName());
                        array_push($files,$now.'_'.$file->getName());
                    }
                }
                $commentObj->file = json_encode($files);
            }
            if (!$commentObj->save()) {
                $error = [];
                foreach ($commentObj->getMessages() as $message) {
                    array_push($error, $message->getMessage());
                }
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => $error,
                ]);
                return $this->response->send();
            } else {
                $this->response->setStatusCode(200, 'OK');
                $notification = new Notification();
                $support = Support::findFirst($support_id);
                $notification->name = $userObj['fullname'].' đã bình luận yêu cầu <strong class="text-hnn">'.$support->ticket.'</strong>';
                $notification->user_id = $support->client_id;
                $notification->type_user = 2;
                $notification->support_id = $support_id;
                $notification->content = $this->helper->getExcerpt($commentObj->content, 0, 100);
                if (!$notification->save()) {
                    $error = [];
                    foreach ($notification->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                }
                $this->response->setJsonContent([
                    'comment' => $commentObj->toArray(),
                    'email' => $userObj['email'],
                    'name'  => $userObj['fullname'],
                    'avatar'  => $userObj['avatar']
                ]);
                return $this->response->send();
            }
        }else{

        }
    }

    public function deletecommentAction($id=null){
        if ($this->request->isAjax()) {
            $this->view->disable();
            if ($comment = Comment::findFirstById($id)) {
                $saveComment = $comment;
                $files = json_decode($comment->file);
                if ($comment->delete()) {
                    $this->helper->write_log(3, 1, 'Xóa bình luận' , json_encode($saveComment->toArray()));
                    if($files != "[]" && $files){
                        foreach ($files as $key => $file) {
                            unlink(BASE_DIR.'/public_html/files/support/'.$file);
                        }
                    }
                    $this->response->setStatusCode(200, 'Deleted');
                    return $this->response->setJsonContent(['status' => 200]);
                } else {
                    $this->response->setStatusCode(500, 'Failed');
                    return $this->response->setJsonContent(['status' => 500]);
                }
            } else {
                $this->response->setStatusCode(404, 'Không tìm thấy bình luận này');
                return $this->response->setJsonContent(['status' => 404]);
            }
        } else {
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }

    public function deleteclientcommentAction($id=null){
        if ($this->request->isAjax()) {
            $this->view->disable();
            if ($comment = CommentClient::findFirstById($id)) {
                $saveComment = $comment;
                $files = json_decode($comment->file);
                if ($comment->delete()) {
                    $this->helper->write_log(3, 1, 'Xóa bình luận' , json_encode($saveComment->toArray()));
                    if($files != "[]" && $files){
                        foreach ($files as $key => $file) {
                            unlink(BASE_DIR.'/public_html/files/support/'.$file);
                        }
                    }
                    $this->response->setStatusCode(200, 'Deleted');
                    return $this->response->setJsonContent(['status' => 200]);
                } else {
                    $this->response->setStatusCode(500, 'Failed');
                    return $this->response->setJsonContent(['status' => 500]);
                }
            } else {
                $this->response->setStatusCode(404, 'Không tìm thấy bình luận này');
                return $this->response->setJsonContent(['status' => 404]);
            }
        } else {
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }
    
    public function editcommentAction($id=null){
        if ($this->request->isAjax()) {
            $this->view->disable();
            if ($comment = Comment::findFirstById($id)) {
                $content = $this->request->getPost('content');
                $userObj = $this->auth->getIdentity();
                if(!trim($content) && !$this->request->hasFiles()){
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => ['Không có nội dung'],
                    ]);
                    return $this->response->send();
                }
                $comment->content = $content;
                if (!$comment->save()) {
                    $error = [];
                    foreach ($comment->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'comment' => $comment->toArray(),
                        'email' => $userObj['email'],
                        'name'  => $userObj['fullname'],
                        'avatar'  => $userObj['avatar']
                    ]);
                    return $this->response->send();
                }
            } else {
                $this->response->setStatusCode(404, 'Không tìm thấy bình luận này');
                return $this->response->setJsonContent(['status' => 404]);
            }
        } else {
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }

    public function editclientcommentAction($id=null){
        if ($this->request->isAjax()) {
            $this->view->disable();
            if ($comment = CommentClient::findFirstById($id)) {
                $content = $this->request->getPost('content');
                $userObj = $this->auth->getIdentity();
                if(!trim($content) && !$this->request->hasFiles()){
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => ['Không có nội dung'],
                    ]);
                    return $this->response->send();
                }
                $comment->content = $content;
                if (!$comment->save()) {
                    $error = [];
                    foreach ($comment->getMessages() as $message) {
                        array_push($error, $message->getMessage());
                    }
                    $this->response->setStatusCode(500, 'Failed');
                    $this->response->setJsonContent([
                        'error' => $error,
                    ]);
                    return $this->response->send();
                } else {
                    $this->response->setStatusCode(200, 'OK');
                    $this->response->setJsonContent([
                        'comment' => $comment->toArray(),
                        'email' => $userObj['email'],
                        'name'  => $userObj['fullname'],
                        'avatar'  => $userObj['avatar']
                    ]);
                    return $this->response->send();
                }
            } else {
                $this->response->setStatusCode(404, 'Không tìm thấy bình luận này');
                return $this->response->setJsonContent(['status' => 404]);
            }
        } else {
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }

    public function getuserAction($id = null){
        $this->view->disable();
        if ($this->request->isAjax()) {
            $user = User::findFirstById($id);
            if (!$user) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Not find user'],
                ]);
                return $this->response->send();
            }
            $user->password = '';
            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent([
                'user' => $user->toArray()
            ]);
            return $this->response->send();
        } 
    }

    public function getclientAction($id = null) {
        $this->view->disable();
        if ($this->request->isAjax()) {
            $client = $this->modelsManager->createBuilder()
            ->columns(array(
                'Models\Client.id',
                'Models\Client.name',
                'Models\Client.address',
                'Models\Client.department_id',
                'Models\Client.email',
                'Models\Client.phone',
                'Models\Client.status',
                'D.name department_name',
            ))
            ->from('Models\Client')
            ->join('Models\Department', 'D.id = Models\Client.department_id','D')
            ->where('Models\Client.id='.$id);
            $client = $client->getQuery()->execute();
            if (!$client->count()===1) {
                $this->response->setStatusCode(500, 'Failed');
                $this->response->setJsonContent([
                    'error' => ['Not find client'],
                ]);
                return $this->response->send();
            }
            $client[0]->password = '';
            $this->response->setStatusCode(200, 'OK');
            $this->response->setJsonContent([
                'client' => $client->toArray()[0],
            ]);
            return $this->response->send();
        } 
    }
}