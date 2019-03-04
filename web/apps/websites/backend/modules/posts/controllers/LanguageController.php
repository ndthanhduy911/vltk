<?php
namespace Backend\Modules\Dashboard\Controllers;

use Library\Common;
use Library\Helper\Helper;

use Phalcon\Mvc\View;

use Phalcon\Paginator\Adapter\QueryBuilder as Paginator;
use Library\Pagination\Pager as Pager;
use Backend\Modules\Dashboard\Forms\EditLanguageForm;

class LanguageController  extends \BackendController
{
    public function indexAction()
    {
        if($this->request->getQuery('single')){
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $list_file = glob(BASE_DIR.'/public_html/language/frontend/*.json', GLOB_BRACE);
        $languages_frontend = [];
        foreach ($list_file as $key => $path) {
            $json = file_get_contents($path);
            $json_data = json_decode($json,true);
            if(!empty($json_data)){
                $languages_frontend[basename($path, '.json')] = $json_data;
            }
        }

        $this->view->languages_frontend = $languages_frontend;
        $this->view->form = new EditLanguageForm();
    }

    public function editAction($id = null){
        if ($this->request->isAjax() && $this->request->isPost()) {
            $post = $this->request->getPost();
            $edit = new EditLanguageForm();
            $path = BASE_DIR.'/public_html/language/frontend/'.$post['lang_cl'].'.json';
            if (!file_exists($path)) {
                $this->response->setStatusCode(404, 'Error');
                $this->response->setJsonContent([
                    'error' => ['Không tìm thấy nội dung này'],
                ]);
                return $this->response->send();
            }
            $json = file_get_contents($path);
            $json_data = json_decode($json,true);
            $key = array_search($post['lang_id'], array_column($json_data, 'id'));
            if($key === false){
                $this->response->setStatusCode(404, 'Error');
                $this->response->setJsonContent([
                    'error' => ['Không tìm thấy nội dung này'],
                ]);
                return $this->response->send();
            }
            $edit->bind($post, $language);
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
                $json_data[$key]['vi'] = $post['lang_vi'];
                $json_data[$key]['en'] = $post['lang_en'];
                $fp = fopen($path, 'w');
                fwrite($fp, json_encode($json_data,JSON_UNESCAPED_UNICODE));
                fclose($fp);
                $this->response->setStatusCode(200, 'OK');
                $this->response->setJsonContent([
                    'language' => [
                        'vi' => $json_data[$key]['vi'],
                        'en' => $json_data[$key]['en']  
                    ]
                ]);
                return $this->response->send();
            }
        }
    }

    public function deleteAction($id = null){
        if ($this->request->isAjax()) {
            $this->view->disable();
            $path = BASE_DIR.'/public_html/language/frontend/'.$post['lang_cl'].'.json';
            if (file_exists($path)) {
                $json = file_get_contents($path);
                $json_data = json_decode($json,true);
                $key = array_search($id, array_column($json_data, 'id'));
                unset($json_data[$key]);
                $fp = fopen($path, 'w');
                fwrite($fp, json_encode($json_data,JSON_UNESCAPED_UNICODE));
                fclose($fp);
                $this->response->setStatusCode(200, 'Deleted');
                return $this->response->setJsonContent(['status' => 200]);
            } else {
                $this->response->setStatusCode(404, 'Không tìm thấy nội dung');
                return $this->response->setJsonContent(['status' => 404]);
            }
        } else {
            return $this->response->setStatusCode(403, ' Forbidden');
        }
    }
}
