<?php
namespace Library\Helper;
use Phalcon\Mvc\User\Component;
use Library\ML\ML as MLML;


class Helper extends Component
{

    public function slugify($str)
    {
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

    public function getGender($gender){
        $msg = '';
        switch($gender){
            case 0:
                $msg = 'Khác';
                break;
            case 1:
                $msg = 'Nữ';
                break;
            case 2:
                $msg = 'Nam';
                break;
        }
        return $msg;
    }

    static function getMonth(){
        return array(
            "1"=>'January',
            "2"=>'February',
            "3"=>'March',
            "4"=>'April',
            "5"=>'May',
            "6"=>'June',
            "7"=>'July',
            "8"=>'August',
            "9"=>'September',
            "10"=>'October',
            "11"=>'November',
            "12"=>'December',
        );
    }

    public function checkValidEmail($email){
        return preg_match('/^[A-z0-9_\-]+[@][A-z0-9_\-]+([.][A-z0-9_\-]+)+[A-z.]{2,4}$/', $email);
    }

    public function countMonth($begin, $end){
        $arrayBegin = explode('-',$begin);
        $arrayEnd   = explode('-',$end);
        return abs(abs((int)$arrayBegin[0] - (int)$arrayEnd['0'])*12 + abs((int)$arrayBegin[1] - (int)$arrayEnd['1'])) + 1;
    }

    public function write_log($type = null, $page=null, $name = null, $detail = '[]',$user_id = null){
        $log =  new \Logs();
        $log->type = $type;
        $log->user_id = $user_id ? $user_id : $this->auth->getIdentity()['id'];
        $log->name = $name;
        $log->page = $page;
        $log->detail = $detail;
        $log->created_at = date('Y-m-d H:i:s');
        if(!$log->save()){
            foreach ($log->getMessages() as $message) {
                print_r( $message->getMessage());
            }
        }
    }

    // public function send_email($nTo=null, $mTo=null, $title = null, $body=null, $content = null) {
    //     $email_setting = json_decode(GenaralSetting::findFirstByName('email_setting')->value);
    //     $nFrom = $email_setting->form_name;
    //     $mFrom = $email_setting->email_name;
    //     $mPass = $email_setting->password_email;
    //     $mail  = new PHPMailer();
    //     // idzidrtajyaiegul
    //     $mail->IsSMTP();             
    //     $mail->CharSet  = "utf-8";
    //     $mail->SMTPDebug  = 0;
    //     $mail->SMTPAuth   = true;
    //     $mail->SMTPSecure = "ssl";
    //     $mail->Host       = $email_setting->smtp_name;
    //     $mail->Port       = 465;

    //     $mail->Username   = $mFrom;
    //     $mail->Password   = $mPass;
    //     $mail->SetFrom($mFrom, $nFrom);
    //     $mail->AddReplyTo($mFrom, $nFrom);
    //     $mail->Subject    = $title;
    //     $mail->MsgHTML($body);
    //     $mail->AddAddress($mTo, $nTo);
    //     $email = new Emails();
    //     $email->type = 1;
    //     $email->person_from = $nFrom.'<br>('.$mFrom.')';
    //     $email->person_to = $nTo.'<br>('.$mTo.')';
    //     $email->title = $title;
    //     $email->content = $content;
    //     if(!$mail->Send()) {
    //         $email->status = 0;
    //         $email->save();
    //         return false;
    //     } else {
    //         $email->status = 1;
    //         $email->save();
    //         return true;
    //     }
    // }

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

    // public function getShowNotify(){
    //     return  Notification::find(['type_user= 2 AND user_id ='.$this->session->get('user_id'), 'order' => 'created_at DESC', 'limit' => array('number' => 20, 'offset' => 0)])->toArray();
    // }

    static function flatten($arrayToFlatten) {
        $flatArray = array();
        foreach($arrayToFlatten as $element) {
            if (is_array($element)) {
                $flatArray = array_merge($flatArray, Helper::flatten($element));
            } else {
                $flatArray[] = $element;
            }
        }
        return $flatArray;
    }

    public function datetime_mysql($date = null)
    {
        $date = str_replace('/', '-', $date );
        return $date ? date_format(date_create($date), "Y-m-d H:i:s") : NULL;
    }

    public function datetime_vn($date = null, $type = "d/m/Y H:i")
    {
        return $date ? date_format(date_create($date), $type) : NULL;
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

    public function getLinkImage($path, $path_default = '/assets/frontend/images/defaut_img.png')
    {
        return $path ? WEB_URL.$path : WEB_URL.$path_default;
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
}
