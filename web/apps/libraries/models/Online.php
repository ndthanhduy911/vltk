<?php
class Online extends \ModelCore
{
    public $id;
    public $userid;
    public $updatedat;
    public $apitoken;
    public $apiidentified;
    public $apiupdatedat;
    public $apiip;

    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("online");
    }

    public static function check($userid){
        if($online = parent::findFirst(['userid = :userid:','bind' => ['userid' => $userid]])){
            $now = strtotime('now');
            $old = strtotime($online->updatedat);
            if(($now - $old) < 900){
                $online->updatedat = date('Y-m-d H:i:s');
                return $online->save();
            }else{
                return false;
            }
        }else{
            $online = new Online();
            $online->userid = $userid;
            $online->updatedat = date('Y-m-d H:i:s');
            return $online->save();
        }
    }

    public static function login($userid){
        if($online = parent::findFirst(['userid = :userid:','bind' => ['userid' => $userid]])){
            $online->updatedat = date('Y-m-d H:i:s');
            return $online->save();
        }else{
            $online = new Online();
            $online->userid = $userid;
            $online->updatedat = date('Y-m-d H:i:s');
            return $online->save();
        }
    }
}
