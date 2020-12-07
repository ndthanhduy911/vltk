<?php
class Logs extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("slogs");
    }

    public function vdUpdate($try=false){
        $validator = new \Phalcon\Validation();
        if($try){
            if(!$this->validate($validator)){
                foreach ($this->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
        }
        return $this->validate($validator);
    }

    public static function saveLogs($_this, $type, $name, $contentold = "", $contentnew = "")
    {
        $logs = new Logs();
        $params = $_this->dispatcher->getParams();
        $logs->userid = $_this->session->get('userid');
        $logs->deptid = $_this->session->get('deptid');
        $logs->type = $type;
        $logs->name = $name;
        $logs->controller = $_this->dispatcher->getControllerName();
        $logs->action = $_this->dispatcher->getActionName();
        $logs->paramid = $_this->dispatcher->getParam(0);
        $logs->params = $params ? json_encode($params) : "";
        $logs->contentold = $contentold ? json_encode($contentold) : "";
        $logs->contentnew = $contentnew ? json_encode($contentnew) : "";
        $logs->ip = $_this->request->getClientAddress();
        $logs->device = NULL;
        $logs->browser = $_this->helper->getBrowser($_SERVER['HTTP_USER_AGENT']);
        $logs->os = $_this->helper->getOs($_SERVER['HTTP_USER_AGENT']);
        $logs->createdat = date('Y-m-d H:i:s');

        if(!$reslut = $logs->save()){
            foreach ($logs->getMessages() as $message) {
                throw new \Exception($message->getMessage());
            }
        }

        return $reslut;
    }

    public static function getTypeLog($type) {
        switch ((int)$type) {
            case 1:
                return 'Thêm mới';
            case 2:
                return 'Cập nhật';
            case 3:
                return 'Xóa';
            case 4:
                return 'Đăng nhập'; 
            default:
                return '';
        }

    }
}
