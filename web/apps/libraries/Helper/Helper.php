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

    public function unlinkFile($files,$target_dir = "", $json = false){
        if($files){
            if(file_exists($target_dir.'/'.$files)){
                unlink($target_dir.'/'.$files);
            }else{
                $files = $json ? json_decode($files) : [];
                if(is_array($files)){
                    foreach ($files as $value) {
                        if(file_exists($target_dir.'/'.$value)) unlink($target_dir.'/'.$value);
                    }
                }
            }
        }
    }

    public function uploadSFile($file, $oldFile = NULL,$upload_path = null, $size = 2){
        $data = [
            'filename' => $oldFile,
            'error' => ""
        ];
        if(!preg_match("/(.*)\.(png|jpeg|jpg|pdf)$/i", $file['name'])){
            $data['error'] = "Tên tập tin không đúng định dạng";
            return $data;
        }

        $allowedFileType = ['image/jpeg', 'image/png', 'application/pdf'];
        if(!in_array($file["type"],$allowedFileType)){
            $data['error'] = "Loại tập tin không đúng định dạng";
            return $data;
        }

        if(((int)$file["size"] / 1024 / 1024) > $size){
            $data['error'] = "Kích thước tập tin không đúng định dạng";
            return $data;
        }

        $target_dir = $upload_path ? BASE_DIR.'/uploads/'.$upload_path : BASE_DIR.'/uploads/';
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

    public function uploadMFile($files, $oldFile = NULL,$upload_path = null, $size = 2){
        if(empty($files['name'][0])){
            return ['filename' => $oldFile,'error' => []];
        }
        $data = [];
        $names = $files['name'];
        $types = $files['type'];
        $sizes = $files['size'];
        $tmps = $files['tmp_name'];
        try {
            $target_dir = $upload_path ? BASE_DIR .'/uploads/'.$upload_path : BASE_DIR .'/uploads/';
            foreach ($names as $key => $value) {
                if(!preg_match("/(.*)\.(png|jpeg|jpg|pdf)$/i", $names[$key])){
                    throw new \Exception("Tên tập tin không đúng định dạng");
                }
                $allowedFileType = ['image/jpeg', 'image/png','application/pdf'];
                if(!in_array($types[$key],$allowedFileType)){
                    throw new \Exception("Loại tập tin không đúng định dạng");
                }
                if(((int)$sizes[$key] / 1024 / 1024) > $size){
                    throw new \Exception("Kích thước tập tin không đúng định dạng");
                }
                $suffix = pathinfo(basename($names[$key]), PATHINFO_EXTENSION);
                $target_file = md5(strtotime('now')).$key.'.'.$suffix;
                if(!move_uploaded_file($tmps[$key], $target_dir .'/'.$target_file)) {
                    throw new \Exception("Upload tập tin thất bại");
                }
                array_push($data,$target_file);
            }
        } catch (\Throwable $th) {
            $this->unlinkFile($data, $target_dir);
            return ['filename' => $oldFile,'error' => $th->getMessage()];
        }
        $this->unlinkFile($oldFile, $target_dir, true);
        return ['filename' => json_encode($data),'error' => []];
    }

    public function uploadReportFile($filename, $oldFile = NULL, $upload_path = null, $size = 2){
        $data = [
            'filename' => $oldFile,
            'error' => ""
        ];
        if(!empty($_FILES[$filename])){
            $files = $_FILES[$filename];
            if(!is_array($files['name'])){
                return $this->uploadSFile($files,$oldFile,$upload_path,$size);
            }else{
                return $this->uploadMFile($files,$oldFile,$upload_path,$size);
            }
        }
        return $data;
    }

    public function uploadExcel($filename, $oldFile = NULL, $upload_path = null, $size = 2){
        $data = [
            'filename' => $oldFile,
            'error' => ""
        ];
        if(!empty($_FILES[$filename]['name'])){
            $file = $_FILES[$filename];
            if(!preg_match("/(.*)\.(xls|xlsx)$/i", $file['name'])){
                $data['error'] = "Tên tập tin không đúng định dạng";
                return $data;
            }

            $allowedFileType = ['application/vnd.ms-excel','text/xls','text/xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'];
            if(!in_array($file["type"],$allowedFileType)){
                $data['error'] = "Loại tập tin không đúng định dạng";
                return $data;
            }

            if(((int)$file["size"] / 1024 / 1024) > $size){
                $data['error'] = "Kích thước tập tin không đúng định dạng";
                return $data;
            }

            $target_dir = $upload_path ? PUBLIC_DIR.'/uploads/'.$upload_path : PUBLIC_DIR.'/uploads/';
            $target_file = strtotime('now').basename($file["name"]);

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

    public function uploadImageTwo($filename, $oldFile = NULL, $upload_path = null, $size = 2){
        $data = [
            'filename' => $oldFile,
            'error' => ""
        ];
        if(!empty($_FILES[$filename])){
            $files = $_FILES[$filename];
            if(!is_array($files['name'])){
                return $this->uploadSFile($files,$oldFile,$upload_path,$size);
            }else{
                return $this->uploadMFile($files,$oldFile,$upload_path,$size);
            }
        }
        return $data;
    }

    public function uploadSImage($file, $oldFile = NULL,$upload_path = null, $size = 2){
        $data = [
            'filename' => $oldFile,
            'error' => ""
        ];
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

        $target_dir = $upload_path ? BASE_DIR.'/uploads/'.$upload_path : BASE_DIR.'/uploads/';
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

    public function uploadMImage($files, $oldFile = NULL,$upload_path = null, $size = 2){
        if(empty($files['name'][0])){
            return ['filename' => $oldFile,'error' => []];
        }
        $data = [];
        $names = $files['name'];
        $types = $files['type'];
        $sizes = $files['size'];
        $tmps = $files['tmp_name'];
        try {
            $target_dir = $upload_path ? BASE_DIR .'/uploads/'.$upload_path : BASE_DIR .'/uploads/';
            foreach ($names as $key => $value) {
                if(!preg_match("/(.*)\.(png|jpeg|jpg)$/i", $names[$key])){
                    throw new \Exception("Tên tập tin không đúng định dạng");
                }
                $allowedFileType = ['image/jpeg', 'image/png'];
                if(!in_array($types[$key],$allowedFileType)){
                    throw new \Exception("Loại tập tin không đúng định dạng");
                }
                if(((int)$sizes[$key] / 1024 / 1024) > $size){
                    throw new \Exception("Kích thước tập tin không đúng định dạng");
                }
                $suffix = pathinfo(basename($names[$key]), PATHINFO_EXTENSION);
                $target_file = md5(strtotime('now')).$key.'.'.$suffix;
                if(!move_uploaded_file($tmps[$key], $target_dir .'/'.$target_file)) {
                    throw new \Exception("Upload tập tin thất bại");
                }
                array_push($data,$target_file);
            }
        } catch (\Throwable $th) {
            $this->unlinkFile($data, $target_dir);
            return ['filename' => $oldFile,'error' => $th->getMessage()];
        }
        $this->unlinkFile($oldFile, $target_dir, true);
        return ['filename' => json_encode($data),'error' => []];
    }

    public function uploadExcelTwo($filename, $oldFile = NULL, $upload_path = null, $size = 2){
        $data = [
            'filename' => $oldFile,
            'error' => ""
        ];
        if(!empty($_FILES[$filename]['name'])){
            $file = $_FILES[$filename];
            if(!preg_match("/(.*)\.(xls|xlsx)$/i", $file['name'])){
                $data['error'] = "Tên tập tin không đúng định dạng";
                return $data;
            }

            $allowedFileType = ['application/vnd.ms-excel','text/xls','text/xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'];
            if(!in_array($file["type"],$allowedFileType)){
                $data['error'] = "Loại tập tin không đúng định dạng";
                return $data;
            }

            if(((int)$file["size"] / 1024 / 1024) > $size){
                $data['error'] = "Kích thước tập tin không đúng định dạng";
                return $data;
            }

            $target_dir = $upload_path ? BASE_DIR . DIRECTORY_SEPARATOR . 'uploads' . DIRECTORY_SEPARATOR . $upload_path : BASE_DIR . DIRECTORY_SEPARATOR . 'uploads' . DIRECTORY_SEPARATOR;
            $target_file = strtotime('now').basename($file["name"]);

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

    public function copyFile($srcDir,$srcFilename,$dstDir){
        try {
            if (!file_exists($dstDir)) {
                throw new \Exception("Thư mục đích không tồn tại");
            }
            $arrayFilename = json_decode($srcFilename);
            if(is_array($arrayFilename)){
                $data = [];
                foreach ($arrayFilename as $fname) {
                    $srcFilePath = $srcDir . DIRECTORY_SEPARATOR . $fname;
                    $suffix = pathinfo(basename($fname), PATHINFO_EXTENSION);
                    $dstFilename = md5(uniqid()).'.'.$suffix;
                    $dstFilePath = $dstDir . DIRECTORY_SEPARATOR . $dstFilename;
                    if (!file_exists($srcFilePath)) {
                        throw new \Exception("Tập tin không tồn tại");
                    }
                    if (!copy($srcFilePath, $dstFilePath)) {
                        throw new \Exception("Copy tập tin {$srcFilename} không thành công");
                    }
                    array_push($data,$dstFilename);
                }
            }else{
                $data = null;
                $srcFilePath = $srcDir . DIRECTORY_SEPARATOR . $srcFilename;
                $suffix = pathinfo(basename($srcFilename), PATHINFO_EXTENSION);
                $dstFilename = md5(uniqid()).'.'.$suffix;
                $dstFilePath = $dstDir . DIRECTORY_SEPARATOR . $dstFilename;
                if (!file_exists($srcFilePath)) {
                    throw new \Exception("Tập tin không tồn tại");
                }
                if (!copy($srcFilePath, $dstFilePath)) {
                    throw new \Exception("Copy tập tin {$srcFilename} không thành công");
                }
                $data = $dstFilename;
            }
            return is_array($data) ? json_encode($data) : $data;
        } catch (\Throwable $th) {
            if(!empty($data)){
                if(is_array($data)){
                    foreach ($data as $fname) {
                        $uFile = $dstDir . DIRECTORY_SEPARATOR . $fname;
                        if (file_exists($uFile)) {
                            unlink($uFile);
                        }
                    }
                }else{
                    $uFile = $dstDir . DIRECTORY_SEPARATOR . $data;
                    if (file_exists($uFile)) {
                        unlink($uFile);
                    }
                }
            }
            return ['error' => $th->getMessage()];
        }
    }

    public function listYears(){
        $res = [];
        for ($i=0; $i <= 75; $i++) { 
            $res[1975 + $i] = 1975 + $i;
        }
        return $res;
    }

    public function isYear($strYear){
        if (preg_match("/^[0-9]{4}$/", $strYear)) {
            return true;
        } else {
            return false;
        }
    }

    public function getHostUrl(){
        return (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://" . $_SERVER['HTTP_HOST'];
    }

    public function getFileDisplayUrl($dir = '', $file = ''){
        $filePath = BASE_DIR . DIRECTORY_SEPARATOR . 'uploads' . DIRECTORY_SEPARATOR . $dir . DIRECTORY_SEPARATOR . $file;
        if (!file_exists($filePath)) {
            return '#';
        }
        return $this->getHostUrl() . '/files/display/' . $dir . '/' . $file;
    }

    public function displayOutputImage($filePath){
        $mimeFile = mime_content_type($filePath);
        header('Content-Type:'.$mimeFile);
        header('Content-Length: ' . filesize($filePath));
        readfile($filePath);
    }

    public function displayOutputPDF($filePath){
        $fileName = pathinfo($filePath, PATHINFO_BASENAME);
        header("Content-type:application/pdf");
        readfile($filePath);
    }

    public function filterListIds($listId = []){
        $listIdFilter = array_map(function($value){
            return filter_var($value, FILTER_SANITIZE_NUMBER_INT);
        }, $listId);
        return array_filter($listIdFilter);
    }

    public function convertDateTimeToDate($str, $format = 'Y-m-d'){
        return date($format, strtotime($str));
    }

    public static function showPriceVN($price, $unit = false) {
        return $unit ? number_format(($price/1000000),2) . ' ' . $unit : (float)number_format(($price/1000000),2);
    }

    public function dateIsFormat($str, $format = 'd/m/Y'){
        switch ($format) {
            case 'd/m/Y':{
                $regex = '/^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}$/';
                break;
            }
            default:{
                $regex = null;
                break;
            }
        }
        if ($regex === null) {
            return false;
        }
        preg_match($regex, $str, $outArr);
        if (count($outArr) == 0) {
            return false;
        }
        return true;
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

    public function listUserStatus($in = null){
        $arr = [
            '0' => 'Khóa',
            '1' => 'Hoạt động'
        ];
        return $this->returnArr($in, $arr);
    }

    public function listUserGender($in = null){
        $arr = [
            '1' => 'Nữ',
            '2' => 'Nam'
        ];
        return $this->returnArr($in, $arr);
    }

    public function listReductionType($in = null){
        $arr = [
            '1' => 'Thanh lý',
            '2' => 'Tiêu hủy'
        ];
        return $this->returnArr($in, $arr);
    }

    public function insertAliasModel($fileds,$alias){
        foreach ($fileds as $key => $value) {
            $fileds[$key] = $alias.'.'. $value;
        }
        return $fileds;
    }

    public function getConfig($path){
        if (!file_exists($path)) {
            return "File was not found";
        }
        $configStr = file_get_contents($path);
        if ($this->convertJSON($configStr) == null) {
            return "Invalid config";
        }
        return json_decode($configStr);
    }

    public function convertJSON($str){
        json_decode($str);
        if(json_last_error() == JSON_ERROR_NONE){
            return json_decode($str);
        }
        return null;
    }

    public function setCrontJob($schedule, $cmd){
        $cmdCrontJob = $schedule . ' ' . $cmd;
        $output = [];
        exec("crontab -l", $output);
        if (!empty($output)) {
            foreach ($output as $ko => $vo) {
                if (strpos($vo, $cmd) !== false) {
                    $output[$ko] = $cmdCrontJob;
                }
            }
        }else{
            $output[] = $cmdCrontJob;
        }
        file_put_contents('/tmp/qlts_crontab.txt', implode(PHP_EOL, $output) . PHP_EOL);
        $outputSet = [];
        exec('crontab /tmp/qlts_crontab.txt', $outputSet);
        unlink('/tmp/qlts_crontab.txt');
        return true;
    }

    public function downloadFile($path){
        header('Content-Type: application/octet-stream');
        header("Content-Transfer-Encoding: Binary"); 
        header("Content-disposition: attachment; filename=\"" . basename($path) . "\""); 
        readfile($path); 
    }

    public function dayOfWeek($in = null){
        $arr = [
            '0' => 'Chủ nhật',
            '1' => 'Thứ hai',
            '2' => 'Thứ ba',
            '3' => 'Thứ tư',
            '4' => 'Thứ năm',
            '5' => 'Thứ sáu',
            '6' => 'Thứ bảy'
        ];
        return $this->returnArr($in, $arr);
    }

    public function markPercentForm($params = []){
        $mark = new \Library\MarkPercentForm\MarkPercentForm();
        return $mark->run($params);
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

    public function createNumber($className,$columName,$text = ""){
        if($object = $className::findFirst(['order' => "id DESC"])){
            $stt = (int)$object->id + 1;
            $number = $text.str_pad($stt,5,"0",STR_PAD_LEFT);
            while ($className::findFirst(["{$columName} = :number:",'bind' => ['number' => $number]])) {
                $stt ++;
                $number = $text.str_pad($stt,5,"0",STR_PAD_LEFT);
            }
            return $number;
        }else{
            return $text.str_pad(1,5,"0",STR_PAD_LEFT);
        }
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

    public function getPaging($total_records, $current_page, $limit = 10)
    {
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

    public function getPageById($pages = [], $id = null)
    {
        foreach ($pages as $key => $page) {
            if((int)$page->id === (int)$id){
                return $page;
            }
        }
        return NULL;
    }

    public function getPosition($pos = "")
    {
        switch ((int)$pos) {
            case 1: 
                return  MLML::_ml_system('dean_dept',"Trưởng bộ môn") ;
            case 2: 
                return MLML::_ml_system('vice_dean_dept',"Phó bộ môn");       
            case 3: 
                return MLML::_ml_system('managing_lecturer',"Giáo vụ");      
            case 4: 
                return MLML::_ml_system('lecturer',"Giảng viên");  
            case 5: 
                return MLML::_ml_system('visiting_lecturer',"Cán bộ thỉnh giảng");  
            case 6: 
                return MLML::_ml_system('staff',"Nhân viên");  
            default:
                return "";
                break;
        }
    }

    public function getTarget($pos = "")
    {
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

    public function getDean($dean = "")
    {
        switch ((int)$dean) {
            case 1: 
                return MLML::_ml_system('dean',"Trưởng khoa");
            case 2: 
                return MLML::_ml_system('vice_dean',"Phó trưởng khoa");            
            default:
                return "";
                break;
        }
    }

    public function getWVN($date)
    {
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

    public function getLinkImage($path, $path_default = '/assets/frontend/images/defaut_img.png')
    {
        return $path ? WEB_URL.$path : WEB_URL.$path_default;
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
