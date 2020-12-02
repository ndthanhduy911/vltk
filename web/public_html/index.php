<?php
declare(strict_types=1);
use Phalcon\Mvc\Application;
session_start();
error_reporting(E_ALL);
header('Access-Control-Allow-Origin: *');
define('BASE_DIR', dirname(__DIR__));
define('APP_DIR', BASE_DIR . '/apps');
date_default_timezone_set('Asia/Ho_Chi_Minh');
try
{
    $define = include APP_DIR . '/configs/define.php';
    /**
     * Include functions
     */
    include APP_DIR . '/configs/functions.php';

    /**
     * Read the configuration
     */
    $config = include APP_DIR . '/configs/config.php';

    /**
     * Read auto-loader
     */
    include APP_DIR . '/configs/loader.php';

    /**
     * Include services
     */
    require APP_DIR . '/configs/services.php';

    /**
     * Handle the request
     */
    $application = new Application($di);
    
    /**
     * Include modules
     */
    require APP_DIR . '/configs/modules.php';
    // echo $application->handle()->getContent();
    echo $application->handle($_SERVER['REQUEST_URI'])->getContent(); //Vesion 4.0
}
catch (Phalcon\Exception $e)
{
    echo $e->getMessage();
    require ERROR_FILE;die;
    
}
catch (PDOException $e)
{
    echo $e->getMessage();
    require ERROR_FILE; die;
}
catch (Exception $e)
{
    echo $e->getMessage();
    require ERROR_FILE; die;
}