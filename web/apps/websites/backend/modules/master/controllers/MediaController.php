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
        if($roleid != 1 && !$depts = \Depts::findFirstId($d_id)){
            die;
        }
        if($roleid == 1){
            $slug = "";
        }else{
            $slug = $depts->slug;
        }
        $opts = array(
            // 'debug' => true,
            'roots' => array(
                // Items volume
                array(
                    'driver'        => 'LocalFileSystem',           // driver for accessing file system (REQUIRED)
                    'path'          => PUBLIC_DIR."/uploads{$slug}",                 // path to files (REQUIRED)
                    'URL'           => "/uploads{$slug}", // URL to files (REQUIRED)
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
                    'path'          => PUBLIC_DIR."/uploads{$slug}"."/.trash/",
                    'tmbURL'        => "/uploads{$slug}".'/.trash/.tmb/',
                    'winHashFix'    => DIRECTORY_SEPARATOR !== '/', // to make hash same to Linux one on windows too
                    'uploadDeny'    => array('all'),                // Recomend the same settings as the original volume that uses the trash
                    'uploadAllow'   => array('image/x-ms-bmp', 'image/gif', 'image/jpeg', 'image/png', 'image/x-icon', 'text/plain'), // Same as above
                    'uploadOrder'   => array('deny', 'allow'),      // Same as above
                    'accessControl' => 'access',                    // Same as above
                    'uploadMaxSize' => '2M'
                )
            )
        );

        $connector = new \elFinderConnector(new \elFinder($opts));
        $connector->run();
    }
}