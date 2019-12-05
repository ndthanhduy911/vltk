<?php
namespace Library\ML;

// function hasCreated($id, $where, $path){
//     if(!file_exists($path)){
//         return false;
//     }
        
//     $json = file_get_contents($path);
//     $json_data = json_decode($json,true);
//     $session = !empty($_SESSION['language']) ? (int)$_SESSION['language'] : 1;
//     $string = $json_data ? array_search($id, array_column($json_data, 'id')) : false;
//     if($string !== false){
//         if($session === 2){
//             return [
//                 'created' => true,
//                 'data'  => $json_data[$string]['en']
//             ];
//         } else {
//             return [
//                 'created' => true,
//                 'data'  => $json_data[$string]['vi']
//             ];
//         }
//     }
//     return [
//         'created' => false,
//         'data'  => $json_data
//     ];
// }

class ML {
    static function _ml_system($id = null, $sentence = ""){
        $lang_de = isset($_SESSION['short_name']) ? $_SESSION['short_name'] : 'vie';
        $path =  PUBLIC_DIR.'/language_file'.'/'.$lang_de.'/'.$lang_de.'.json';
        if(!file_exists($path)){
            return "Not find this vocabulary";
        }
        $json = file_get_contents($path);
        $json_data = json_decode($json,true);
        $json_data = $json_data ? $json_data : [];
        if(!empty($json_data[$id])){
            if($json_data[$id]['default'] !== $sentence){
                $json_data[$id]['trans'] = $sentence;
                $json_data[$id]['default'] = $sentence;
                return $json_data[$id]['trans'];
            }else{
                return $json_data[$id]['trans'];
            }
            
        }else{
            $json_data[$id] = ['default'=>$sentence, 'trans' => $sentence, 'key' => $id];
            $fp = fopen($path, 'w');
            fwrite($fp, json_encode($json_data,JSON_UNESCAPED_UNICODE));
            return $sentence;
        }
    }

    static function _ml_update($id = null, $sentence = "", $language){
        if($language){
            $short_name = strtolower($language->short_name);
            $path =  PUBLIC_DIR.'/language_file'.'/'.$short_name.'/'.$short_name.'.json';
            if(!file_exists($path)){
                return "Not find this vocabulary";
            }
            $json = file_get_contents($path);
            $json_data = json_decode($json,true);
            $json_data = $json_data ? $json_data : [];
            if(!empty($json_data[$id])){
                if($json_data[$id]['trans'] === $sentence){
                    return false;
                }else{
                    $json_data[$id]['trans'] = $sentence;
                    $fp = fopen($path, 'w');
                    fwrite($fp, json_encode($json_data,JSON_UNESCAPED_UNICODE));
                    return $json_data[$id]['trans'];
                }
            }
            return false;
        }else{
            return false;
        }
    }
}