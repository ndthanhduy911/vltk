<?php

namespace Frontend\Modules\Physics\Controllers;

use Library\Helper\Helper;
use Phalcon\Mvc\View;

class CaptchasController extends \FrontendController
{
    public function indexAction(){
        $this->view->disable();
        $type = $this->request->get('type');
        if(!preg_match('/login|login_client/',$type)){
            die;
        }
        $name = $type ? $type : 'captcha';
        $cdata = 'captcha_' . $name;
        if($this->session->has($cdata)){
            $this->session->remove($cdata);
        }
        $num_chars = 6;
        $characters = array_merge(range(1, 9));
        shuffle($characters);
        $captcha_text = "";
        for ($i = 0; $i < $num_chars; $i++) {
            $c = $characters[rand(0, count($characters) - 1)];
            $captcha_text .= $c;
        }
        $this->session->set('captcha_'.$name,$captcha_text);
        $jpg_image = imagecreatefrompng('captcha/img/cbg2.png');
        $white = imagecolorallocate($jpg_image, 55, 0, 197);
        $font_path = BASE_DIR.'/public_html/captcha/fonts/segoeprb.ttf';
        $text = $captcha_text;
        imagettftext($jpg_image, 25, 0, 10, 40, $white, $font_path , $text);
        header("Content-type: image/png");
        imagepng($jpg_image);
        imagedestroy($jpg_image);
    }
}