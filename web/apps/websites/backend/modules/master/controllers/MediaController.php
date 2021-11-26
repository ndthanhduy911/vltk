<?php
namespace Backend\Modules\Master\Controllers;
use \Phalcon\Mvc\View;

class MediaController  extends \BackendController {

    function indexAction(){
    }

    function imageAction(){
    }

    function filesAction(){
    }

    function videoAction(){
    }

    function audioAction(){
    }

    function modalimageAction(){
        $this->view->setRenderLevel(
            View::LEVEL_ACTION_VIEW
        );
    }

    function modalvideoAction(){
        $this->view->setRenderLevel(
            View::LEVEL_ACTION_VIEW
        );
    }


    function modalfilesAction(){
        $this->view->setRenderLevel(
            View::LEVEL_ACTION_VIEW
        );
    }

    function modalaudioAction(){
        $this->view->setRenderLevel(
            View::LEVEL_ACTION_VIEW
        );
    }
    
    function connectorAction(){
        $roleid = $this->session->get('roleid');
        $deptid = $this->session->get('deptid');
        if($roleid != 1 && !$depts = \Depts::findFirstId($deptid)){
            die;
        }
        if($roleid == 1){
            $path = 'uploads/';
            $url = WEB_UPLOAD_URL."/";
            if (!is_dir(PUBLIC_DIR.'/uploads')){
                mkdir(PUBLIC_DIR.'/uploads', 0744, true);
            }
        }else{
            $path = 'uploads/'. $depts->fpath ;
            $url = WEB_UPLOAD_URL . $depts->fpath;
            if (!is_dir(PUBLIC_DIR.'/uploads' . $depts->fpath)){
                mkdir(PUBLIC_DIR.'/uploads' . $depts->fpath, 0744, true);
            }
        }

        $opts = array(
            'uploadMaxSize'=>'4M',
            'lang' => 'vi',
            'bind' => array(
                'mkdir.pre mkfile.pre rename.pre' => array(
                    'Plugin.Sanitizer.cmdPreprocess'
                ),
                'upload.presave' => array(
                    'Plugin.Sanitizer.onUpLoadPreSave'
                )
            ),
            'plugin' => array(
                'Sanitizer' => array(
                    'enable' => true,
                    'targets'  => array('\\','/',':',' ','*','?','"','<','>','|'), // target chars
                    'replace'  => '_'    // replace to this
                )
            ),
            'roots' => array(
                array(
                    'uploadMaxSize'=>'120M',
                    'driver' => 'LocalFileSystem',
                    'path' => $path,
                    'alias' => 'Data',
                    'tmbPath' => 'uploads/tmp/',
                    'tmbURL' => WEB_UPLOAD_URL.'/tmp',
                    'URL' => $url,
                    'uploadDeny' => array('all'),
                    'onlyMimes' =>array('image'),
                    'uploadAllow' => array('image'),
                    'uploadOrder' => array('deny', 'allow')
                )
            )
        );
        $connector = new \elFinderConnector(new \elFinder($opts),true);
        $connector->run();
    }

    function connectoraudioAction(){
        $roleid = $this->session->get('roleid');
        $deptid = $this->session->get('deptid');
        if($roleid != 1 && !$depts = \Depts::findFirstId($deptid)){
            die;
        }
        if($roleid == 1){
            $path = 'uploads/';
            $url = WEB_UPLOAD_URL."/";
            if (!is_dir(PUBLIC_DIR.'/uploads')){
                mkdir(PUBLIC_DIR.'/uploads', 0744, true);
            }
        }else{
            $path = 'uploads/'. $depts->fpath ;
            $url = WEB_UPLOAD_URL . $depts->fpath;
            if (!is_dir(PUBLIC_DIR.'/uploads' . $depts->fpath)){
                mkdir(PUBLIC_DIR.'/uploads' . $depts->fpath, 0744, true);
            }
        }
        $opts = array(
            'uploadMaxSize'=>'4M',
            'lang' => 'vi',
            'bind' => array(
                'mkdir.pre mkfile.pre rename.pre' => array(
                    'Plugin.Sanitizer.cmdPreprocess'
                ),
                'upload.presave' => array(
                    'Plugin.Sanitizer.onUpLoadPreSave'
                )
            ),
            'plugin' => array(
                'Sanitizer' => array(
                    'enable' => true,
                    'targets'  => array('\\','/',':',' ','*','?','"','<','>','|'), // target chars
                    'replace'  => '_'    // replace to this
                )
            ),
            'roots' => array(
                array(
                    'uploadMaxSize'=>'120M',
                    'driver' => 'LocalFileSystem',
                    'path' => $path,
                    'alias' => 'Data',
                    'tmbPath' => 'uploads/tmp/',
                    'tmbURL' => WEB_UPLOAD_URL.'/tmp',
                    'URL' => $url,
                    'uploadDeny' => array('all'),
                    'uploadAllow' => array('audio'),
                    'uploadOrder' => array('deny', 'allow')
                )
            )
        );
        $connector = new \elFinderConnector(new \elFinder($opts),true);
        $connector->run();
    }

    function connectorvideoAction(){
        $roleid = $this->session->get('roleid');
        $deptid = $this->session->get('deptid');
        if($roleid != 1 && !$depts = \Depts::findFirstId($deptid)){
            die;
        }
        if($roleid == 1){
            $path = 'uploads/';
            $url = WEB_UPLOAD_URL."/";
            if (!is_dir(PUBLIC_DIR.'/uploads')){
                mkdir(PUBLIC_DIR.'/uploads', 0744, true);
            }
        }else{
            $path = 'uploads/'. $depts->fpath ;
            $url = WEB_UPLOAD_URL . $depts->fpath;
            if (!is_dir(PUBLIC_DIR.'/uploads' . $depts->fpath)){
                mkdir(PUBLIC_DIR.'/uploads' . $depts->fpath, 0744, true);
            }
        }
        $opts = array(
            'uploadMaxSize'=>'120M',
            'lang' => 'vi',
            'bind' => array(
                'mkdir.pre mkfile.pre rename.pre' => array(
                    'Plugin.Sanitizer.cmdPreprocess'
                ),
                'upload.presave' => array(
                    'Plugin.Sanitizer.onUpLoadPreSave'
                )
            ),
            'plugin' => array(
                'Sanitizer' => array(
                    'enable' => true,
                    'targets'  => array('\\','/',':',' ','*','?','"','<','>','|'), // target chars
                    'replace'  => '_'    // replace to this
                )
            ),
            'roots' => array(
                array(
                    'uploadMaxSize'=>'120M',
                    'driver' => 'LocalFileSystem',
                    'path' => $path,
                    'alias' => 'Data',
                    'tmbPath' => 'uploads/tmp/',
                    'tmbURL' => WEB_UPLOAD_URL.'/tmp',
                    'URL' => $url,
                    'onlyMimes' =>array('video/mp4'),
                    'uploadDeny' => array('all'),
                    'uploadAllow' => array('video/mp4'),
                    'uploadOrder' => array('deny', 'allow')
                )
            )
        );
        $connector = new \elFinderConnector(new \elFinder($opts),true);
        $connector->run();
    }

    function connectorfilesAction(){
        $roleid = $this->session->get('roleid');
        $deptid = $this->session->get('deptid');
        if($roleid != 1 && !$depts = \Depts::findFirstId($deptid)){
            die;
        }
        if($roleid == 1){
            $path = 'uploads/';
            $url = WEB_UPLOAD_URL."/";
            if (!is_dir(PUBLIC_DIR.'/uploads')){
                mkdir(PUBLIC_DIR.'/uploads', 0744, true);
            }
        }else{
            $path = 'uploads/'. $depts->fpath ;
            $url = WEB_UPLOAD_URL . $depts->fpath;
            if (!is_dir(PUBLIC_DIR.'/uploads' . $depts->fpath)){
                mkdir(PUBLIC_DIR.'/uploads' . $depts->fpath, 0744, true);
            }
        }
        $opts = array(
            'uploadMaxSize'=>'20M',
            'lang' => 'vi',
            'bind' => array(
                'mkdir.pre mkfile.pre rename.pre' => array(
                    'Plugin.Sanitizer.cmdPreprocess'
                ),
                'upload.presave' => array(
                    'Plugin.Sanitizer.onUpLoadPreSave'
                )
            ),
            'plugin' => array(
                'Sanitizer' => array(
                    'enable' => true,
                    'targets'  => array('\\','/',':',' ','*','?','"','<','>','|'), // target chars
                    'replace'  => '_'    // replace to this
                )
            ),
            'roots' => array(
                array(
                    'uploadMaxSize'=>'20M',
                    'driver' => 'LocalFileSystem',
                    'path' => $path,
                    'alias' => 'Data',
                    'tmbPath' => 'uploads/tmp/',
                    'tmbURL' => WEB_UPLOAD_URL.'/tmp',
                    'URL' => $url,
                    'uploadDeny' => array(),
                    'uploadAllow' => array('application/pdf'),
                    'uploadOrder' => array('deny', 'allow')
                )
            )
        );
        $connector = new \elFinderConnector(new \elFinder($opts),true);
        $connector->run();
    }
}