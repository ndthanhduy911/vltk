<?php
namespace Backend\Modules\Master\Controllers;
use \Phalcon\Mvc\View;

class MediaController  extends \BackendController {

    public function elfinderAction(){
        $this->view->disableLevel(View::LEVEL_AFTER_TEMPLATE);
        $this->view->pick('templates/elfinder');
    }

    public function connectorAction(){
        require LIB_DIR . '/elfinder/php/autoload.php';

        $d_id = isset($_GET['deptid']) ? $_GET['deptid'] : 0;
        $depts = [0,1,2,3,4,5,6,7,8,9,10];
        if(!in_array($d_id,$depts)){
            die;
        }
        $deptArray = [
            0 => '/404',
            1 => 'khoa-vat-ly',
            2 => 'vat-ly-tin-hoc',
            3 => 'vat-ly-ly-thuyet',
            4 => 'vat-ly-hat-nhan',
            5 => 'vat-ly-chat-ran',
            6 => 'vat-ly-ung-dung',
            7 => 'vat-ly-dien-tu',
            8 => 'vat-ly-dia-cau',
            9 => 'vat-ly-hai-duong',
        ];
        // var_dump(PUBLIC_DIR."/uploads/{$deptArray[$d_id]}");die;
        $opts = array(
            // 'debug' => true,
            'roots' => array(
                // Items volume
                array(
                    'driver'        => 'LocalFileSystem',           // driver for accessing file system (REQUIRED)
                    'path'          => PUBLIC_DIR."/uploads/{$deptArray[$d_id]}",                 // path to files (REQUIRED)
                    'URL'           => "/uploads/{$deptArray[$d_id]}", // URL to files (REQUIRED)
                    'trashHash'     => 't1_Lw',                     // elFinder's hash of trash folder
                    'winHashFix'    => DIRECTORY_SEPARATOR !== '/', // to make hash same to Linux one on windows too
                    'uploadDeny'    => array('all'),                // All Mimetypes not allowed to upload
                    'uploadAllow'   => array('image/x-ms-bmp', 'image/gif', 'image/jpeg', 'image/png', 'image/x-icon', 'text/plain'), // Mimetype `image` and `text/plain` allowed to upload
                    'uploadOrder'   => array('deny', 'allow'),      // allowed Mimetype `image` and `text/plain` only
                    'accessControl' => 'access',                     // disable and hide dot starting files (OPTIONAL)
                    'uploadMaxSize' => '2M'
                ),
                // Trash volume
                array(
                    'id'            => '1',
                    'driver'        => 'Trash',
                    'path'          => PUBLIC_DIR."/uploads/{$deptArray[$d_id]}"."/.trash/",
                    'tmbURL'        => "/uploads/{$deptArray[$d_id]}".'/.trash/.tmb/',
                    'winHashFix'    => DIRECTORY_SEPARATOR !== '/', // to make hash same to Linux one on windows too
                    'uploadDeny'    => array('all'),                // Recomend the same settings as the original volume that uses the trash
                    'uploadAllow'   => array('image/x-ms-bmp', 'image/gif', 'image/jpeg', 'image/png', 'image/x-icon', 'text/plain'), // Same as above
                    'uploadOrder'   => array('deny', 'allow'),      // Same as above
                    'accessControl' => 'access',                    // Same as above
                    'uploadMaxSize' => '2M'
                )
            )
        );

        // run elFinder
        $connector = new \elFinderConnector(new \elFinder($opts));
        $connector->run();
    }
}