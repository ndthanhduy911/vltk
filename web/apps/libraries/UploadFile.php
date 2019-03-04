<?php
/**
 * Created by PhpStorm.
 * User: huynguyen
 * Date: 9/27/14
 * Time: 9:32 AM
 */

namespace Library;

use Phalcon\Image\Adapter\GD;
use Phalcon\Image\Adapter\Imagick;
use Library\Upload\Ftp;

class UploadFile extends \Phalcon\Mvc\User\Component
{
    public function __construct()
    {

    }

    public function loadLibraryScript()
    {

    }

    public function doUploadFile($file , $data , $listThumbnail,$oldfile = "")
    {

        $type = $data['type'];
        switch(strtolower($type))
        {
            case 'image':
                switch(strtolower($file->getType()))
                {
                    case 'image/png':
                    case 'image/jpg':
                    case 'image/jpeg':
                    case 'image/gif':
                        $fileName = md5($file->getName()) . strtotime(date("Y-m-d H:i:s")) . '.' . $file->getExtension();
                        $imagePath = $data['folder_upload'] . '/' . $fileName;
                        if($file->moveTo($imagePath))
                        {

                            if($listThumbnail != null)
                            {
                                foreach($listThumbnail as $key => $thumbnail)
                                {

                                     $dirPathThumbnail =  $data['folder_upload'] .'/';

                                    if (!file_exists($dirPathThumbnail) && !is_dir($dirPathThumbnail)) {
                                        mkdir($dirPathThumbnail , 0777);
                                    }
                                    $imagePathThumbnail = $dirPathThumbnail . $fileName;
                                    $imageUpload = new GD($imagePath);
                                    $imageUpload->resize($thumbnail['width'] , $thumbnail['height']);
                                    $upload = $imageUpload->save($imagePathThumbnail , 100);
                                    if($oldfile != "" && $oldfile !="/files/avatar/".$key."/") {
                                        if(file_exists(str_replace($key."/","",$oldfile))){
                                            @unlink(str_replace($key."/","",$oldfile));
                                        }
                                        if(file_exists($oldfile)){
                                            @unlink($oldfile);
                                        }
                                    }
                                }
                            }


                            return $fileName;
                        }
                        break;
                }
                break;
            case 'sub':
                switch(strtolower($file->getType()))
                {
                    case 'application/octet-stream':
                        $fileName = md5($file->getName()) . strtotime(date("Y-m-d H:i:s")) . '.' . $file->getExtension();
                        $imagePath = $data['folder_upload'] . '/' . $fileName;
                        if($file->moveTo($imagePath))
                        {
                            return $fileName;
                        }
                        break;
                }
                break;
            case 'audio':
                switch(strtolower($file->getType()))
                {
                    case 'audio/mp3':
                    case 'audio/wav':
                    case 'audio/m4a':
                    case 'audio/x-m4a':
                        $fileName = md5($file->getName()) . strtotime(date("Y-m-d H:i:s")) . '.' . $file->getExtension();
                        $imagePath = $data['folder_upload'] . '/' . $fileName;
                        if($file->moveTo($imagePath))
                        {
                            return $fileName;
                        }
                        else{

                        }
                        break;
                    default:
                        //return strtolower($file->getType());
                        break;
                }

                break;
            case 'movie':
                switch(strtolower($file->getType()))
                {
                    case 'video/mp4':
                    case 'video/quicktime':
                        $fileName = md5($file->getName()) . strtotime(date("Y-m-d H:i:s")) . '.' . $file->getExtension();
                        $imagePath = $data['folder_upload'] . '/' . $fileName;
                        if($file->moveTo($imagePath))
                        {
                            return $fileName;
                        }
                        break;
                    default:
                        //return strtolower($file->getType());
                        break;
                }
                break;
        }
        return null;
    }

    public static function doUploadImage($file , $data , $listThumbnail)
    {
        switch(strtolower($file->getType()))
        {
            case 'image/png':
            case 'image/jpg':
            case 'image/jpeg':
            case 'image/gif':
                $fileName = md5($file->getName()) . strtotime(date("Y-m-d H:i:s")) . '.' . $file->getExtension();
                $imagePath = $data['folder_upload'] . '/' . $fileName;
                if($file->moveTo($imagePath))
                {
                    if($listThumbnail != null)
                    {
                        foreach($listThumbnail as $key => $thumbnail)
                        {
                            $dirPathThumbnail = $data['folder_upload'] . '/thumbnails/' . $key . '/';
                            if (!file_exists($dirPathThumbnail) && !is_dir($dirPathThumbnail)) {
                                mkdir($dirPathThumbnail , 0777);
                            }
                            $imagePathThumbnail = $dirPathThumbnail . $fileName;
                            $imageUpload = new GD($imagePath);
                            $imageUpload->resize($thumbnail['width'] , $thumbnail['height']);
                            $upload = $imageUpload->save($imagePathThumbnail , 100);
                        }
                    }
                    return $fileName;
                }
                break;
        }
        return null;
    }

    public static function doUploadPhoto($file , $data , $listThumbnail)
    {
        $fileName = strtotime(date("Y-m-d H:i:s")) . md5($file->getName()) . '.' . $file->getExtension();                 
        $imagePath = $data['folder_upload'] . '/' . $fileName;
        if($file->moveTo($imagePath))
        {
            if($listThumbnail != null)
            {
                foreach($listThumbnail as $key => $thumbnail)
                {
                    $dirPathThumbnail = $data['folder_upload'] . '/thumbnails/' . $key . '/';
                    if (!file_exists($dirPathThumbnail) && !is_dir($dirPathThumbnail)) {
                        mkdir($dirPathThumbnail , 0777);
                    }

                    $imagePathThumbnail = $dirPathThumbnail . $fileName;
                    $imageUpload = new GD($imagePath);
                    $imageUpload->resize($thumbnail['width'] , $thumbnail['height']);
                    $upload = $imageUpload->save($imagePathThumbnail , 100);
                }
            }
            return $fileName;
        }
        return null;
    }

    public function doUploadFtp($data , $listThumbnail)
    {
        try {
            $ftp = new Ftp;
            $ftp->connect($this->config->fpt->server);
            $ftp->login($this->config->fpt->user, $this->config->fpt->pass);

            foreach ($this->request->getUploadedFiles() as $file) {
                $fileName = strtotime("now") . $file->getName();
                $data['folder_upload'] = 'advertise';
                $imagePath = $data['folder_upload'] . '/' . $fileName;
                $upload = $ftp->put($imagePath , $file->getPathname() , FTP_BINARY);
                if (!$upload) { echo 'FTP upload failed!'; }
            }

            $ftp->close();
        } catch (\Exception $e) {
            echo 'Error: ', $e->getMessage();
        }
    }
} 