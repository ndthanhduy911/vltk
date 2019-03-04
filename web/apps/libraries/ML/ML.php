<?php
namespace Library\ML;

function hasCreated($id, $where, $path){
    if(!file_exists($path)){
        return false;
    }
        
    $json = file_get_contents($path);
    $json_data = json_decode($json,true);
    $session = !empty($_SESSION['language']) ? (int)$_SESSION['language'] : 1;
    $string = $json_data ? array_search($id, array_column($json_data, 'id')) : false;
    if($string !== false){
        if($session === 2){
            return [
                'created' => true,
                'data'  => $json_data[$string]['en']
            ];
        } else {
            return [
                'created' => true,
                'data'  => $json_data[$string]['vi']
            ];
        }
    }
    return [
        'created' => false,
        'data'  => $json_data
    ];
}

class ML {
    static function _ml($vi, $where, $id, $controller){
        if(!empty($vi)){
            $path = BASE_DIR.'/public_html/language'.'/'.$where.'/'.$controller.'.json';
            $data = hasCreated($id, $where,  $path);
            if($data['created']){
                return $data['data'];
            }else{
                $strings = $data['data'] ? $data['data'] : [];
                array_unshift($strings,[
                    'id'   =>  $id,
                    'vi'   =>  $vi,
                    'en'   =>  $vi
                ]);
                $fp = fopen($path, 'w');
                fwrite($fp, json_encode($strings,JSON_UNESCAPED_UNICODE));
                fclose($fp);
                return $vi;
            }
        }
    }

    static function __ml($vi, $where, $id, $controller){
        if(!empty($vi)){
            $path = BASE_DIR.'/public_html/language'.'/'.$where.'/'.$controller.'.json';
            $data = hasCreated($id, $where,  $path);
            if($data['created']){
                return $data['data'];
            }else{
                $strings = $data['data'] ? $data['data'] : [];
                array_unshift($strings,[
                    'id'   =>  $id,
                    'vi'   =>  $vi,
                    'en'   =>  $vi
                ]);
                $fp = fopen($path, 'w');
                fwrite($fp, json_encode($strings,JSON_UNESCAPED_UNICODE));
                fclose($fp);
                return $vi;
            }
        }
    }
}