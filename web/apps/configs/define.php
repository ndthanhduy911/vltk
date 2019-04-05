<?php
/**
 * Created by PhpStorm.
 * User: CHARIZARD
 * Date: 7/17/2015
 * Time: 8:43 PM
 */

if (isset($_SERVER['HTTP_HOST']) && $_SERVER['HTTP_HOST'] == 'demo.phys.honeynet.vn') {
    define("FRONTEND_URL", "http://demo.phys.honeynet.vn");
} else {
    define("FRONTEND_URL", "");
}

define("FRONTEND_URI", "");
define('LIB_DIR', APP_DIR . '/libraries');
define('ERROR_FILE', APP_DIR . '/libraries/Error/404.php');
define('PUBLIC_DIR', BASE_DIR . '/public_html');
define('BACKEND_URL',  FRONTEND_URL.'admin');
define('BACKEND_URI',  FRONTEND_URI.'/admin');
