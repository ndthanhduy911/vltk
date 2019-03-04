<?php
/**
 * Created by PhpStorm.
 * User: CHARIZARD
 * Date: 7/17/2015
 * Time: 8:43 PM
 */

define('LIB_DIR', APP_DIR . '/libraries');
require_once LIB_DIR."/Mobile_Detect.php";
$mobile  =  new Library\Mobile_Detect();
if($mobile->isMobile() || $mobile->isTablet() ){
    define('ERROR_FILE', APP_DIR . '/libraries/Error/404m.php');
}else{
    define('ERROR_FILE', APP_DIR . '/libraries/Error/404.php');
}