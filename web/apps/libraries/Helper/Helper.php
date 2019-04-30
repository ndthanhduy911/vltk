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
}
