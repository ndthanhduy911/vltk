<?php
/**
 * Created by PhpStorm.
 * User: huynguyen
 * Date: 9/26/14
 * Time: 8:10 PM
 */

namespace Base\Forms;


use Library\Common;

class BaseForm extends \Phalcon\Forms\Form
{
    // Form class
    public function appendMessage($field = '', $msg)
    {
        if (isset($this->_messages[$field])) {
            $this->_messages[$field]->appendMessage($msg);
        } else {
            $this->_messages[$field] = new \Phalcon\Validation\Message\Group();
            $this->_messages[$field]->appendMessage($msg);
        }
    }
    function getMessage($name){
        $element = $this->get($name);
        $messages = $this->getMessagesFor($element->getName());
        $messagesError = '';
        if (count($messages)) {
            foreach ($messages as $message) {
                $messagesError[]= '<p class="text-red">'. $message.'</p>';
            }
            $messagesError = implode(" ",$messagesError);
        }
        return $messagesError;
    }
    public function renderDefault($name)
    {
        $element = $this->get($name);
        $messages = $this->getMessagesFor($element->getName());
        $hasError = '';
        $messagesError = '';
        $html = '';
        if (count($messages)) {
            $hasError = ' has-error';
            foreach ($messages as $message) {
                $messagesError[]= '<div class="text-red">'. $message.'</div>';
            }
            $messagesError = implode(" ",$messagesError);
        }
        if($name == 'image'){
            $html .= ' <div class="form-group' . $hasError . '">
                <label class="col-sm-2 control-label">' . $element->getLabel() . '</label>
                    <div class="col-sm-8"> <a href="javascript:;" class="change_landscape_image">
                                                        <img src="' .Common::getImage($element->getValue()).'" width="80px"/>
                                                        <input type="hidden" id="image" name="image" value="'.$element->getValue().'">
                                                    </a>' . $messagesError . '</div></div>';
        }else {
            $html .= ' <div class="form-group' . $hasError . '">
                <label class="col-sm-2 control-label">' . $element->getLabel() . '</label>
                    <div class="col-sm-8">' . $this->render($element->getName()) . $messagesError . '</div></div>';
        }
        return $html;
    }

    public function renderRegister($name)
    {
        $element = $this->get($name);
        $messages = $this->getMessagesFor($element->getName());
        $hasError = '';
        $messagesError = '';
        $html = '';

        if (count($messages)) {
            $hasError = ' has-error';
            foreach ($messages as $message) {
                $messagesError[]= '<div class="text-notice">'. $message.'</div>';
            }
            $messagesError = implode(" ",$messagesError);
        }
         if($name =='captcha'){
                $html .='<div class="row"><div class="form-group">
                        <div ">
							<div class="capcha">
						<img width="90" id="CaptchaImage" src="/captcha?id=CaptchaImage"><a href="javascript:ReLoadCaptcha()" title="Thay đổi captcha" id="reloadCaptcha" class="btn repeat-captcha">
						<span class="glyphicon glyphicon-repeat color-captcha"></span></a></div>'. $this->render($name);
                if($hasError !=""){
                    $html .=$messagesError;
                }
                $html .='<script type="text/javascript"> $(function () {  $("#reloadCaptcha").on("click", function (e) { e.preventDefault(); $("#CaptchaImage").attr("src", "/captcha?id=CaptchaImage"); }); }); function ReLoadCaptcha() { $("#CaptchaInputText").val(""); $("#CaptchaImage").attr("src", "/captcha?id=CaptchaImage"); } </script></div></div></div>';

         }else if($name == 'firstname' || $name == 'lastname' || $name == 'month' || $name == 'day' || $name == 'year' ){
             $html .= '<div class="form-group has-feedback ' . $hasError . '">
                ' . $this->render($name) . '
            </div>';
             if ($hasError != "") {
                 $html .= $messagesError;
             }
         }else {
        $html .= '<div class="row"><div class="form-group has-feedback ' . $hasError . '">
                ' . $this->render($name) . '

            </div>';
        if ($hasError != "") {
            $html .= $messagesError;
        }
             $html .='</div>';
    }
        return $html;
    }
} 