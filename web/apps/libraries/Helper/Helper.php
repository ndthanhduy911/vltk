<?php
namespace Library\Helper;
use Sinergi\BrowserDetector\Os;
use Sinergi\BrowserDetector\Device;
use Sinergi\BrowserDetector\Browser;
use Library\ML\ML as MLML;

class Helper
{
    public function trimText($input, $length, $ellipses = true, $strip_html = true){
        //strip tags, if desired
        if ($strip_html) {
            $input = strip_tags($input);
        }

        //no need to trim, already shorter than trim length
        if (strlen($input) <= $length) {
            return $input;
        }

        //find last space within length
        $last_space = strrpos(substr($input, 0, $length), ' ');
        $trimmed_text = substr($input, 0, $last_space);

        //add ellipses (...)
        if ($ellipses) {
            $trimmed_text .= '...';
        }

        return $trimmed_text;
    }

    public function datetimeMysql($date = null, $type = 'Y-m-d H:i:s'){
        $date = str_replace('/', '-', $date );
        $dateCreate = date_create($date);
        return $date ? ($dateCreate ? date_format($dateCreate, $type): $date) : NULL;
    }

    public function dateMysql($date = null, $type = 'Y-m-d'){
        $date = str_replace('/', '-', $date );
        $dateCreate = date_create($date);
        return $date ? ($dateCreate ? date_format($dateCreate, $type): $date) : NULL;
    }

    public function datetimeVn($date = null, $type = "d/m/Y H:i"){
        return $date ? date_format(date_create($date), $type) : NULL;
    }

    public function dateVn($date = null, $type = "d/m/Y"){
        return $date ? date_format(date_create($date), $type) : NULL;
    }

    public function response($_this = null, $data = null, $status = 200){   
        $_this->view->disable();
        http_response_code($status);
        echo $data;
        die;
    }

    public function responseJson($_this = null, $data = null, $status = 200){
        $_this->view->disable();
        http_response_code($status);
        echo json_encode($data);
        die;
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

    public function getOS() { 
        $os = new Os();
        return $os->getName().' '.$os->getVersion();
    }

    public function getBrowser() {
        $browser = new Browser();
        return $browser->getName().' '.$browser->getVersion();
    }

    public function getDevice() {
        $device = new Device();
        return $device->getName();
    }

    public function uploadImage($filename, $oldFile = NULL, $upload_path = null, $size = 2){
        $data = [
            'filename' => $oldFile,
            'error' => ""
        ];
        if(!empty($_FILES[$filename]['name'])){
            $file = $_FILES[$filename];
            if(!preg_match("/(.*)\.(png|jpeg|jpg)$/i", $file['name'])){
                $data['error'] = "Tên tập tin không đúng định dạng";
                return $data;
            }

            $allowedFileType = ['image/jpeg', 'image/png'];
            if(!in_array($file["type"],$allowedFileType)){
                $data['error'] = "Loại tập tin không đúng định dạng";
                return $data;
            }

            if(((int)$file["size"] / 1024 / 1024) > $size){
                $data['error'] = "Kích thước tập tin không đúng định dạng";
                return $data;
            }

            $target_dir = $upload_path ? PUBLIC_DIR.'/uploads/'.$upload_path : PUBLIC_DIR.'/uploads/';
            $suffix = pathinfo(basename($file["name"]), PATHINFO_EXTENSION);
            $target_file = md5(strtotime('now')).'.'.$suffix;

            if(!move_uploaded_file($file["tmp_name"], $target_dir .'/'.$target_file)) {
                $data['error'] = "Upload tập tin thất bại";
                return $data;
            }

            if($oldFile && file_exists($target_dir.'/'.$oldFile)){
                unlink($target_dir.'/'.$oldFile);
            }

            $data['filename'] = $target_file;
            return $data;
        }
        return $data;
    }

    public function filterListIds($listId = []){
        $listIdFilter = array_map(function($value){
            return filter_var($value, FILTER_SANITIZE_NUMBER_INT);
        }, $listId);
        return array_filter($listIdFilter);
    }

    public function returnArr($in, $arr, $default = '', $rArr = false){
        if ($in == null) {
            return $arr;
        }
        if (isset($arr[$in])) {
            return $arr[$in];
        }
        if (!empty($default)) {
            return $default;
        }
        if ($rArr == true) {
            return [];
        }
        return '';
    }

    public function listTypeLog($in = null){
        $arr = [
            '1' => 'Thêm mới',
            '2' => 'Cập nhật',
            '3' => 'Xóa',
            '4' => 'Đăng nhập',
            '5' => 'Nhập (Import)',
            '6' => 'Khóa'
        ];
        return $this->returnArr($in, $arr);
    }

    public function showSort($order,$_this,$fkey,$text){
        $dirs = $_this->request->get('dir',['string', 'trim']);
        $orders = $_this->request->get('order',['string', 'trim']);
        $dirArray = explode(",",$dirs);
        $orderArray = explode(",",$orders);
        $orderField = \FilterSetting::getOrderKeys($fkey); 
        if(!in_array($order,$orderField)){
            return "{$text}";
        }
        if(count($dirArray) && in_array($order,$orderArray)){
            foreach ($dirArray as $dir) {
                if($dir == 1){
                    return "<a href='#' order='{$order}' dir='2' class='orderby text-nowrap text-black'>{$text}<i class='ml-1 fa fa-sort-up float-right text-dark'></i></a>";
                }
                if($dir == 2){
                    return "<a href='#' order='{$order}' dir='0' class='orderby text-nowrap text-black'>{$text}<i class='ml-1 fa fa-sort-down float-right text-dark'></i></a>";
                }
            }
        }
        return "<a href='#' order='{$order}' dir='1' class='orderby text-nowrap text-black'>{$text}<i class='ml-1 fa fa-sort float-right text-dark'></i></a>";
    }

    public function slugify($str) {
        if($str){
            $str = trim(mb_strtolower($str));
            $str = preg_replace('/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/', 'a', $str);
            $str = preg_replace('/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/', 'e', $str);
            $str = preg_replace('/(ì|í|ị|ỉ|ĩ)/', 'i', $str);
            $str = preg_replace('/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/', 'o', $str);
            $str = preg_replace('/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/', 'u', $str);
            $str = preg_replace('/(ỳ|ý|ỵ|ỷ|ỹ)/', 'y', $str);
            $str = preg_replace('/(đ)/', 'd', $str);
            $str = preg_replace('/[^a-z0-9-\s]/', '', $str);
            $str = preg_replace('/([\s]+)/', '-', $str);
        }

        return $str;
    }

    public function getPaging($total_records, $current_page, $limit = 10){
        if($total_records <= $limit){
            return false;
        }

        $total_page = CEIL($total_records / $limit);

        if ($current_page > $total_page){
            $current_page = $total_page;
        }
        else if ($current_page < 1){
            $current_page = 1;
        }

        $paging = [
            'total_page' => $total_page,
            'current_page' => $current_page,
        ];
        return $paging;
    }

    public function getPageById($pages = [], $id = null){
        foreach ($pages as $key => $page) {
            if((int)$page->id === (int)$id){
                return $page;
            }
        }
        return NULL;
    }

    public function getTarget($pos = ""){
        switch ((int)$pos) {
            case 0: 
                return  '_self' ;
            case 1: 
                return '_blank';       
            case 2: 
                return '_parent';      
            case 3: 
                return '_top';   
            default:
                return "_self";
                break;
        }
    }

    public function getWVN($date){
        if ($date == '0000-00-00 00:00:00' || $date == null) {
            return '';
        }

        switch ((int)date('w', strtotime($date))) {
            case 0: 
                return MLML::_ml_system('sunday',"Chủ Nhật");
            case 1: 
                return MLML::_ml_system('monday',"Thứ Hai");
            case 2: 
                return MLML::_ml_system('tuesday',"Thứ Ba");
            case 3: 
                return MLML::_ml_system('wednesday',"Thứ Tư");
            case 4: 
                return MLML::_ml_system('thursday',"Thứ Năm");
            case 5: 
                return MLML::_ml_system('friday',"Thứ Sáu");
            case 6: 
                return MLML::_ml_system('saturday',"Thứ Bảy");
        
            default:
                return "";
                break;
        }
    }

    public function getLinkImage($path, $path_default = '/assets/frontend/images/defaut_img.png'){
        return ($path && file_exists(dirname(PUBLIC_DIR.$path))) ? WEB_URL.$path : WEB_URL.$path_default;
    }

    public function getExcerpt($str, $startPos=0, $maxLength=100) {
        if(strlen($str) > $maxLength) {
            $excerpt   = substr($str, $startPos, $maxLength-3);
            $lastSpace = strrpos($excerpt, ' ');
            $excerpt   = substr($excerpt, 0, $lastSpace);
            $excerpt  .= '...';
        } else {
            $excerpt = $str;
        }
        return $excerpt;
    }
}
