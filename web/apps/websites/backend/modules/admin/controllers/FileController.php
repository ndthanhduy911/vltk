<?php

namespace Backend\Modules\Dashboard\Controllers;
use Library\CropAvatar;
use Library\ImageWorkshop;
use Library\Upload\UploadFile;
use Library\UploadFTP;
use Phalcon\Mvc\View;

class FileController extends \BackendController
{
    public function indexAction()
    {
        $this->view->CKEditorFuncNum = strip_tags($this->request->get('CKEditorFuncNum'));
        $ftp = new UploadFTP();
        $url = $ftp->uploadNoneFtp('news',$_FILES['upload']);
        if( $url != falses){
            $this->view->url = STATIC_SERVER.$url;
        }
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }
    public function cropAction()
    {
        
        $crop = new CropAvatar(
            isset($_POST['avatar_src']) ? $_POST['avatar_src'] : null,
            isset($_POST['avatar_data']) ? $_POST['avatar_data'] : null,
            isset($_FILES['avatar_file']) ? $_FILES['avatar_file'] : null
        );
//        print_r($crop->getName()); die();
        $response = array(
            'state'  => 200,
            'message' => $crop->getMsg(),
            'name' => $crop->getName(),
            'filename' => $crop->getFilename(),
            'result' => URL_PUBLIC."/files/tmp/".$crop -> getName()
        );

        echo json_encode($response);
        die;
    }
    public function productAction()
    {

        $crop = new \CropProduct(
            isset($_POST['avatar_src']) ? $_POST['avatar_src'] : null,
            isset($_POST['avatar_data']) ? $_POST['avatar_data'] : null,
            isset($_FILES['avatar_file']) ? $_FILES['avatar_file'] : null
        );
//        print_r($crop->getName()); die();
        $response = array(
            'state'  => 200,
            'message' => $crop->getMsg(),
            'name' => $crop->getName(),
            'filename' => $crop->getFilename(),
            'result' => URL_PUBLIC."/files/tmp/".$crop -> getName()
        );

        echo json_encode($response);
        die;
    }
    function resizeAction(){
        $images =  scandir('news');
        unset($images[0]);
        unset($images[1]);
        foreach($images as $img) {

            if(!file_exists('crop/'.$img )) {
                $layer = new ImageWorkshop(array(
                    "imageFromPath" => 'news/' . $img,
                ));
                $layer->resizeInPixel(467, 292, false);
                $createFolders = true;
                $backgroundColor = null; // transparent, only for PNG (otherwise it will be white if set null)
                $imageQuality = 100; // useless for GIF, usefull for PNG and JPEG (0 to 100%)
                $destination = 'crop';
                try {
                    $layer->save($destination, $img, $createFolders, $backgroundColor, $imageQuality);
                } catch (\Exception $e) {

                }
            }
        }
        die;
    }
}