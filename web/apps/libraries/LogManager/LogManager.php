<?php
namespace Library\LogManager;

class LogManager {

    public function write_log($type = null, $page=null, $name = null, $detail = '[]',$user_id = null){
        $log =  new \Logs();
        $log->type = $type;
        $log->user_id = $user_id ? $user_id : $_SESSION['user_id'];
        $log->name = $name;
        $log->page = $page;
        $log->detail = $detail;
        $log->ip = $this->getClientIp();
        $log->device = $this->get_device_client();
        $log->created_at = date('Y-m-d H:i:s');
        if(!$log->save()){
            foreach ($log->getMessages() as $message) {
                print_r( $message->getMessage());
            }
        }
    }

    public function getClientIp() {
        $ipaddress = '';
        if (getenv('HTTP_CLIENT_IP'))
            $ipaddress = getenv('HTTP_CLIENT_IP');
        else if(getenv('HTTP_X_FORWARDED_FOR'))
            $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
        else if(getenv('HTTP_X_FORWARDED'))
            $ipaddress = getenv('HTTP_X_FORWARDED');
        else if(getenv('HTTP_FORWARDED_FOR'))
            $ipaddress = getenv('HTTP_FORWARDED_FOR');
        else if(getenv('HTTP_FORWARDED'))
           $ipaddress = getenv('HTTP_FORWARDED');
        else if(getenv('REMOTE_ADDR'))
            $ipaddress = getenv('REMOTE_ADDR');
        else
            $ipaddress = 'UNKNOWN';
        return $ipaddress;
    }

    public function get_device_client(){
        return $_SERVER['HTTP_USER_AGENT'];
    }

    public function get_type($type=""){
        switch ((int)$type) {
            case 1:
                return 'Thêm';    
            case 2:
                return 'Sửa';
            case 3: 
                return 'Xóa';
            case 4:
                return 'Đăng nhập';
            default:
                return 'KXĐ';
        }
    }
}