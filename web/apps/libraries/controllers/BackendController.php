<?php
class BackendController extends \Phalcon\Mvc\Controller
{
    public function beforeExecuteRoute(\Phalcon\Mvc\Dispatcher $dispatcher)
    {
        if ($this->session->has("userid")) {
            $userid = $this->session->get('userid');
            if(!Online::check($userid)){
                $this->session->destroy();
                if($this->request->isAjax()){
                    $this->helper->responseJson($this, ["logout" => true]);
                }else{
                    header('Location: /admin/login');
                }
            }
            if(!$this->master->checkMaster($this)){
                if($this->request->isAjax()){
                    $this->helper->responseJson($this, ["error" => ["Truy cập không được phép"]]);
                }else{
                    require ERROR_FILE;die;
                }
            }
        } else {
            if($this->request->isAjax()){
                $this->helper->responseJson($this, ["logout" => true]);
            }else{
                header('Location: /admin/login');
            }
            exit;
        }
    }

    public function queryRaw($from,$columns="*",$params=[],$group=[],$order=[]){
        $where = count(empty($params[0]) ? [] : $params[0]) ? "WHERE " . implode(" AND ",$params[0]) : "";
        $bind = empty($params[1]) ? [] : $params[1];
        $group = count($group) ? "GROUP BY " . implode(",",$group) : "";
        $order = count($order) ? "ORDER BY " . implode(",",$order) : "";
        // var_dump("SELECT {$columns} FROM {$from} {$where} {$group}");die;
        $result = $this->db->fetchAll("SELECT {$columns} FROM {$from} {$where} {$group} {$order}", \Phalcon\Db::FETCH_BOTH, $bind);
        return $result;
    }
}
