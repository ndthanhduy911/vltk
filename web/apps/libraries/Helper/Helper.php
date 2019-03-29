<?php
namespace Library\Helper;
use Phalcon\Mvc\User\Component;
use Library\PHPMailer\PHPMailer;
use Models\Logs as Logs;
use Models\Emails;
use Models\GenaralSetting;
use Models\Notification;


class Helper extends Component
{

    public function slugify($text)
    {
        // replace non letter or digits by -
        $text = preg_replace('~[^\pL\d]+~u', '-', $text);

        // transliterate
        $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);

        // remove unwanted characters
        $text = preg_replace('~[^-\w]+~', '', $text);

        // trim
        $text = trim($text, '-');

        // remove duplicate -
        $text = preg_replace('~-+~', '-', $text);

        // lowercase
        $text = strtolower($text);

        if (empty($text)) {
            return 'n-a';
        }

        return $text;
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

    public function get_req_package($type) {
        switch ($type) {
            case 'update':
                return '<span class="badge badge-primary" style="font-size: 0.7rem; padding: 0.5rem">UPDATE</span>';
                break;
            case 'new':
                return 'NEW';
                break;
            case 'other':
                return '<span class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem">OTHER</span>';
                break;
            default:
                return 'Yêu cầu khác';
                break;
        }
    }

    public function get_frontend_req_package($type) {
        switch ($type) {
            case 'update':
                return '<span class="btn btn-info btn-xs" style="font-size: 11px; padding: 0.5rem">UPDATE</span>';
                break;
            case 'new':
                return 'NEW';
                break;
            case 'other':
                return '<span class="btn btn-success btn-xs" style="font-size: 11px; padding: 0.5rem">OTHER</span>';
                break;
            default:
                return 'Yêu cầu khác';
                break;
        }
    }


    public function get_priority($type) {
        switch ($type) {
            case 'low':
                return '<span class="badge badge-primary" style="font-size: 0.7rem; padding: 0.5rem">Chậm</span>';
                break;
            case 'normal':
                return '<span class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem">Thường</span>';
                break;
            case 'height':
                return '<span class="badge badge-warning text-white" style="font-size: 0.7rem; padding: 0.5rem">Cao</span>';
                break;
            case 'urgent':
                return '<span class="badge badge-danger text-white" style="font-size: 0.7rem; padding: 0.5rem;">Khẩn Cấp</span>';
                break;        
            default:
                return 'Chưa xác định';
                break;
        }
    }

    public function get_frontend_priority($type) {
        switch ($type) {
            case 'low':
                return '<span class="btn btn-info btn-xs" style="font-size: 11px; padding: 0.5rem">Chậm</span>';
                break;
            case 'normal':
                return '<span class="btn btn-success btn-xs" style="font-size: 11px; padding: 0.5rem">Thường</span>';
                break;
            case 'height':
                return '<span class="btn btn-warning btn-xs" style="font-size: 11px; padding: 0.5rem">Cao</span>';
                break;
            case 'urgent':
                return '<span class="btn btn-primary btn-xs" style="font-size: 11px; padding: 0.5rem;">Khẩn Cấp</span>';
                break;        
            default:
                return 'Chưa xác định';
                break;
        }
    }

    public function get_status_support($type) {
        switch ($type) {
            case 0:
                return '<span status="'.$type.'" class="badge badge-danger" style="font-size: 0.7rem; padding: 0.5rem ; line-height: 1.5">Chưa </br>giao</span>';
                break;
            case 1:
                return '<span status="'.$type.'" class="badge badge-info" style="font-size: 0.7rem; padding: 0.5rem ;line-height: 1.5">Đã </br>giao</span>';
                break;
            case 2:
                return '<span status="'.$type.'" class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem; line-height: 1.5">Xong</span>';
                break;
            case 3:
                return '<span status="'.$type.'" class="badge badge-primary" style="font-size: 0.7rem; padding: 0.5rem; line-height: 1.5">Đang </br>làm</span>';
                break;
            case 4:
                return '<span status="'.$type.'" class="badge badge-danger" style="font-size: 0.7rem; padding: 0.5rem; line-height: 1.5">Sự </br>cố</span>';
                break;
            
            default:
                return 'Chưa xác định';
                break;
        }
    }

    public function get_frontend_status_support($type) {
        switch ($type) {
            case 0:
                return '<span status="'.$type.'" class="btn btn-primary btn-xs" style="font-size: 11px; padding: 0.5rem ; line-height: 1.5">Chưa giao</span>';
                break;
            case 1:
                return '<span status="'.$type.'" class="btn btn-info btn-xs" style="font-size: 11px; padding: 0.5rem ;line-height: 1.5">Đã giao</span>';
                break;
            case 2:
                return '<span status="'.$type.'" class="btn btn-success btn-xs" style="font-size: 11px; padding: 0.5rem; line-height: 1.5">Xong</span>';
                break;
            case 3:
                return '<span status="'.$type.'" class="btn btn-warning btn-xs" style="font-size: 11px; padding: 0.5rem; line-height: 1.5">Đang làm</span>';
                break;
            case 4:
                return '<span status="'.$type.'" class="btn btn-primary btn-xs" style="font-size: 11px; padding: 0.5rem; line-height: 1.5">Sự cố</span>';
                break;
            
            default:
                return 'Chưa xác định';
                break;
        }
    }

    public function get_status_my_support($type) {
        switch ($type) {
            case 0:
                return '<span status="'.$type.'" class="badge badge-danger" style="font-size: 0.7rem; padding: 0.5rem; line-height: 1.5">Chưa </br>giao</span>';
                break;
            case 1:
                return '<span status="'.$type.'" class="badge badge-info" style="font-size: 0.7rem; padding: 0.5rem; line-height: 1.5">Đã </br>nhận</span>';
                break;
            case 2:
                return '<span status="'.$type.'" class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem; line-height: 1.5">Xong</span>';
                break;
            case 3:
                return '<span status="'.$type.'" class="badge badge-primary" style="font-size: 0.7rem; padding: 0.5rem; line-height: 1.5">Đang </br>làm</span>';
                break;
            case 4:
                return '<span status="'.$type.'" class="badge badge-danger" style="font-size: 0.7rem; padding: 0.5rem; line-height: 1.5">Sự </br>cố</span>';
                break;
            
            default:
                return 'Chưa xác định';
                break;
        }
    }

    public function get_type_log($type) {
        switch ($type) {
            case 1:{
                return '<span status="'.$type.'" class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem;">THÊM MỚI</span>';
                break;
            }
            case 2:{
                return '<span status="'.$type.'" class="badge badge-info" style="font-size: 0.7rem; padding: 0.5rem;">CẬP NHẬT</span>';
                break;
            }
            case 3:{
                return '<span status="'.$type.'" class="badge badge-danger" style="font-size: 0.7rem; padding: 0.5rem;">XÓA</span>';
                break;
            }
            case 4:{
                return '<span status="'.$type.'" class="badge badge-primary" style="font-size: 0.7rem; padding: 0.5rem;">ĐĂNG NHẬP</span>';
                break;
            }
            default:
                return 'Chưa xác định';
                break;
        }
    }

    public function write_log($type = null, $page=null, $name = null, $detail = '[]',$user_id = null){
        $log =  new Logs();
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

    public function send_email($nTo=null, $mTo=null, $title = null, $body=null, $content = null) {
        $email_setting = json_decode(GenaralSetting::findFirstByName('email_setting')->value);
        $nFrom = $email_setting->form_name;
        $mFrom = $email_setting->email_name;
        $mPass = $email_setting->password_email;
        $mail  = new PHPMailer();
        // idzidrtajyaiegul
        $mail->IsSMTP();             
        $mail->CharSet  = "utf-8";
        $mail->SMTPDebug  = 0;
        $mail->SMTPAuth   = true;
        $mail->SMTPSecure = "ssl";
        $mail->Host       = $email_setting->smtp_name;
        $mail->Port       = 465;

        $mail->Username   = $mFrom;
        $mail->Password   = $mPass;
        $mail->SetFrom($mFrom, $nFrom);
        $mail->AddReplyTo($mFrom, $nFrom);
        $mail->Subject    = $title;
        $mail->MsgHTML($body);
        $mail->AddAddress($mTo, $nTo);
        $email = new Emails();
        $email->type = 1;
        $email->person_from = $nFrom.'<br>('.$mFrom.')';
        $email->person_to = $nTo.'<br>('.$mTo.')';
        $email->title = $title;
        $email->content = $content;
        if(!$mail->Send()) {
            $email->status = 0;
            $email->save();
            return false;
        } else {
            $email->status = 1;
            $email->save();
            return true;
        }
    }

    public function send_multiple_email($emailAddAddress = [], $emailAddCC = [], $title = null, $body=null, $content = null) {
        $email_setting = json_decode(GenaralSetting::findFirstByName('email_setting')->value);
        $nFrom = $email_setting->form_name;
        $mFrom = $email_setting->email_name;
        $mPass = $email_setting->password_email;
        $mail  = new PHPMailer();
        // idzidrtajyaiegul
        $mail->IsSMTP();             
        $mail->CharSet  = "utf-8";
        $mail->SMTPDebug  = 0;
        $mail->SMTPAuth   = true;
        $mail->SMTPSecure = "ssl";
        $mail->Host       = $email_setting->smtp_name;
        $mail->Port       = 465;

        $mail->Username   = $mFrom;
        $mail->Password   = $mPass;
        $mail->SetFrom($mFrom, $nFrom);
        $mail->AddReplyTo($mFrom, $nFrom);
        $mail->Subject    = $title;
        $mail->MsgHTML($body);
        foreach ($emailAddAddress as $key => $value) {
            $mail->AddAddress($value['email'], $value['fullname']);
        }
        foreach ($emailAddCC as $key => $value) {
            $mail->AddCC($value['email'], $value['fullname']);
        }
        die;
        // $mail->AddCC('person1@domain.com', 'Person One');
        $email = new Emails();
        $email->type = 1;
        $email->person_from = $nFrom.'<br>('.$mFrom.')';
        $email->person_to = $nTo.'<br>('.$mTo.')';
        $email->title = $title;
        $email->content = $content;
        if(!$mail->Send()) {
            $email->status = 0;
            $email->save();
            return false;
        } else {
            $email->status = 1;
            $email->save();
            return true;
        }
    }

    public function getTextEmailPassword($name=null, $eamil=null, $password = null) {
        return 
        '<div style="width: 100%;">
            <h2>Xin chào '.$name.'</h2>
            <div>
                <p>Cảm ơn bạn đã sử dụng của dịch vụ hỗ trợ của <a href="#" style="color: blue">PHYSICS</a></p>
                <p>Tài khoản: '.$eamil.'<br>Mật khẩu: '.$password.'</p>
                <p>Bạn có thể truy cập vào link: <a href="https://it-support.vnuhcm.edu.vn">https://it-support.vnuhcm.edu.vn</a> để bắt đầu gửi yêu cầu hỗ trợ cho chúng tôi.</p>
            </div>
        </div>';
    }

    public function getTextHaveRequest($name = null, $dept_name = null, $contnet = null ) {
        return 
        '<div style="width: 100%;">
            <h2>Xin chào</h2>
            <div>
                <p>Bạn có một yêu cầu hỗ trợ mới:</p>
                <p>Người yêu cầu: '.$name.'</p>
                <p>Đơn vị: '.$dept_name.'</p>
                <p style="font-weight: 600;">NỘI DUNG:</p>
                <article>'
                    .$contnet.
                '</article>
                <p>Bạn hãy vào <a href="https://support.physics.vn/adcp">TRANG QUẢN TRỊ</a> để xử lý.</p>                
            </div>
        </div>';
    }

    public function getTextUpdateRequest($name = null, $dept_name = null, $contnet = null ) {
        return 
        '<div style="width: 100%;">
            <h2>Xin chào</h2>
            <div>
                <p>Yêu cầu hỗ trợ vừa được cập nhật:</p>
                <p>Người yêu cầu: '.$name.'</p>
                <p>Đơn vị: '.$dept_name.'</p>
                <p style="font-weight: 600;">NỘI DUNG:</p>
                <article>'
                    .$contnet.
                '</article>
                <p>Bạn hãy vào <a href="https://support.physics.vn/adcp">TRANG QUẢN TRỊ</a> để xử lý.</p>                
            </div>
        </div>';
    }

    public function getTextNewComment($name = null, $dept_name = null, $contnet = null ) {
        return 
        '<div style="width: 100%;">
            <h2>Xin chào</h2>
            <div>
                <p>Yêu cầu hỗ trợ vừa có bình luận mới:</p>
                <p>Người yêu cầu: '.$name.'</p>
                <p>Đơn vị: '.$dept_name.'</p>
                <p style="font-weight: 600;">NỘI DUNG:</p>
                <article>'
                    .$contnet.
                '</article>
                <p>Bạn hãy vào <a href="https://support.physics.vn/adcp">TRANG QUẢN TRỊ</a> để xử lý.</p>                
            </div>
        </div>';
    }

    public function getTextHaveAssign($name = null, $contnet = null ) {
        return 
        '<div style="width: 100%;">
            <h2>Xin chào</h2>
            <div>
                <p>Bạn vừa được giao xử lý một yêu cầu:</p>
                <p>Người giao: '.$name.'</p>
                <p style="font-weight: 600;">NỘI DUNG CÔNG VIỆC:</p>
                <article>'
                    .$contnet.
                '</article>
                <p>Bạn hãy vào <a href="https://support.physics.vn/adcp">TRANG QUẢN TRỊ</a> để xử lý.</p>                
            </div>
        </div>';
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

    public function getShowNotify(){
        return  Notification::find(['type_user= 2 AND user_id ='.$this->session->get('user_id'), 'order' => 'created_at DESC', 'limit' => array('number' => 20, 'offset' => 0)])->toArray();
    }
}
