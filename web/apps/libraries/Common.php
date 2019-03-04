<?php
/**
 * Created by PhpStorm.
 * User: huynguyen
 * Date: 9/24/14
 * Time: 11:04 PM
 */

namespace Library;
use Models\News\News;
use Models\Film\FilmLike;
use Phalcon\Mvc\Model;
use Models\News\Category;

class Common extends Model
{
    public static function listYear()
    {
        $year = array();
        for($i = 2017;$i >= 1990; $i--)
        {
            $year[$i] = $i;
        }
        return $year;
    }

    public static function listMonth(){
        $month = array();
        for ($i=1; $i <= 12 ; $i++) {
            if($i < 10){
                $month['0' . $i] = '0' . $i;
            }else{
                $month["{$i}"] = "{$i}";
            }
        }
        return $month;
    }

    public static function listDate(){
        $date = array();
        for ($i=1; $i <= 31 ; $i++) {
            if($i < 10){
                $date['0' . $i] = '0' . $i;
            }else{
                $date["{$i}"] = "{$i}";
            }
        }
        return $date;
    }

    public static function listHour(){
        $hour = array();
        for ($i=0; $i < 24 ; $i++) {
            if($i < 10){
                $hour['0' . $i] = '0' . $i;
            }else{
                $hour["{$i}"] = "{$i}";
            }
        }
        return $hour;
    }

    public static function listUserStatus()
    {
        return array(
            '0' => 'Inactive',
            '1' =>'Active'
        );
    }

    public static function listStatusCart()
    {
        return array(
            'Y' => 'Đã thanh toán' ,
            'N' => 'Chưa thánh toán' ,
            'C' => 'Hủy'
        );
    }

    public static function listTypeMovie()
    {
        return array(
            'M' => 'Movie' ,
            'O' => 'Hậu trường' ,
        );
    }

    public static function getGender()
    {
        return array(
            '1' => 'Male' ,
            '2' => 'Female' ,
        );
    }

    public static function listTypeFanzoneProduct()
    {
        return array(
            'text'  => 'Text' ,
            'video' => 'Video' ,
            'audio' => 'Audio' ,
            'image' => 'Image' ,
        );
    }

    public static function listYesOrNo()
    {
        return array(
            '1' => 'Có' ,
            '0' => 'Không' ,
        );
    }

    public static function listTypeEvent()
    {
        return array(
            'N' => 'Tin tức' ,
            'I' => 'Thông báo' ,
        );
    }

    public static function listTypeNews()
    {
        return array(
            'N' => 'Tin tức' ,
            'I' => 'Thông báo' ,
        );
    }

    public static function listTypeStaticPage()
    {
        return array(
            1 => 'Guide' ,
            2 => 'Contact' ,
        );
    }

    public static function listTypeCeleb()
    {
        return array(
            'text' => 'text' ,
            'image' => 'image' ,
            'audio' => 'audio',
            'video' => 'video'
        );
    }


    public static function getStatusRequest($status)
    {
        if($status == true){
            return array(
                'status' => 'OK',
                'message' => 'Thành công',
                'data'    => array()
            );
        }
        return array(
            'status' => 'error',
            'message' => 'Bị lỗi',
            'data'    => array()
        );
    }

    public static function setLoadMoreToData($data , $loadMore)
    {
        $data['loadMore'] = $loadMore;
        return $data;
    }

    public static function getLoadMore($curentPage , $lastPage)
    {
        return $lastPage > $curentPage ? true : false;
    }

    public static function listObject()
    {
        return array(
            'album_music' => 'Album Nhạc' ,
            'music' => 'Bài hát' ,
            'movie' => 'Movie' ,
            'album_photo' => 'Album Photo' ,
            'show' => 'Lịch diễn' ,
            'event' => 'Sự kiện' ,
            'news'  => 'Tin tức'
        );
    }

    public static function listTypeProductShop()
    {
        return array(
            'M' => 'Music' ,
            'O' => 'Sản phẩm khác' ,
        );
    }


    public static function listProtocol()
    {
        return array(
            'http' => 'http',
            'https' => 'https',
        );
    }


    public static function listThumbnailOptionA()
    {
        return array(
            '250_250' => array(
                'width' => 250,
                'height' =>250
            ),
        );
    }

    public static function listThumbnailOptionB()
    {
        return array(
            '150_150' => array(
                'width' => 150,
                'height' => 150
            ),
        );
    }

    public static function listThumbnailOptionC()
    {
        return array(
            '500_500' => array(
                'width' => 500,
                'height' =>500
            ),
        );
    }

    public static function listThumbnailOptionD()
    {
        return array(
            '50_50' => array(
                'width' => 50,
                'height' =>50
            ),
            '100_100' => array(
                'width' => 100,
                'height' =>100
            ),
        );
    }


    public static function listGroupType()
    {
        return array(
            'U' => "User",
            'A' => "Administrators",
            'S' => "Super User",
        );
    }

    public static function getMobileNetWork()
    {
        return array(
            '1' => "Viettel",
            '2' => "Vinaphone",
            '3' => "Mobilephone",
            '4' => "VietnamMobile",
        );
    }

    public static function getColorShow()
    {
        $data = array(
            '1'=>'Màu hồng',
            '2'=>'Màu đỏ tươi',
            '3'=>'Màu chuối',
            '4'=>'Màu húng quế',
            '5'=>'Màu xanh nhạt',
            '6'=>'Màu xanh lam',
            '7'=>'Màu việt quất',
            '8'=>'Màu nho',
            '9'=>'Màu hồng hạc',
            '10'=>'Màu khói',
        );
        return $data;
    }

    public static function parserTime($time)
    {
        return $time;
    }

    public static function getRadomString($length)
    {
        return substr(md5(uniqid(mt_rand(), true)) , 0, $length);
    }

    public static function colorOption($getColor =false)
    {
        $data = array(
            '#EF569C'=>'Màu hồng',
            '#EE2B39'=>'Màu đỏ tươi',
            '#F8BE46'=>'Màu chuối',
            '#0A7A41'=>'Màu húng quế',
            '#12B676'=>'Màu xanh nhạt',
            '#2396D0'=>'Màu xanh lam',
            '#3D56A4'=>'Màu việt quất',
            '#81318B'=>'Màu nho',
            '#E5746F'=>'Màu hồng hạc',
            '#5E5E5E'=>'Màu khói',
        );

        return $data;

    }


    public static function getColorCode($color)
    {
        $colorOptios = self::colorOption(true);
        $i = 1;
        foreach($colorOptios as $key => $value){
            if($i == $color){
                return $key;
            }
            $i++;
        }
        return 'Chưa biết';
    }

    public static function getColorName($color)
    {
        $colorOptios = self::colorOption(true);
        $i = 1;
        foreach($colorOptios as $key => $value){
            if($i == $color){
                return $value;
            }
            $i++;
        }
        return 'Chưa biết';
    }

    public static function getTypePoint() {
        return array(
            ACTION_LISTEN => 'Nghe',
            ACTION_DOWNLOAD => 'Tải về',
            ACTION_COMMENT => 'Bình luận',
            ACTION_SHARE => 'Chia sẻ',
            ACTION_BUY => 'Mua',
            ACTION_SUBSCRIPTION => 'Đăng ký',
            ACTION_POST_FANZONE => 'Post fanzone'
        );
    }

    public static function stripTag($str){

        $str = preg_replace("/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/", 'a', $str);
        $str = preg_replace("/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/", 'e', $str);
        $str = preg_replace("/(ì|í|ị|ỉ|ĩ)/", 'i', $str);
        $str = preg_replace("/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/", 'o', $str);
        $str = preg_replace("/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/", 'u', $str);
        $str = preg_replace("/(ỳ|ý|ỵ|ỷ|ỹ)/", 'y', $str);
        $str = preg_replace("/(đ)/", 'd', $str);
        $str = preg_replace("/(À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)/", 'A', $str);
        $str = preg_replace("/(È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)/", 'E', $str);
        $str = preg_replace("/(Ì|Í|Ị|Ỉ|Ĩ)/", 'I', $str);
        $str = preg_replace("/(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)/", 'O', $str);
        $str = preg_replace("/(Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)/", 'U', $str);
        $str = preg_replace("/(Ỳ|Ý|Ỵ|Ỷ|Ỹ)/", 'Y', $str);
        $str = preg_replace("/(Đ)/", 'D', $str);
        $str = trim(strtolower(preg_replace('/[^ a-z0-9]+/i', '-', $str)));
        $str = str_replace('-','',$str) ;
        $str = trim(strtolower(preg_replace('/[^a-z0-9]+/i', '-', $str)));
        return $str;
    }

    public static function filterBadMessage($message)
    {
        $filter = array("shit", "ngu" , "dm" , "dkm" , "cl" ,"cc" , "cl" , "cặc" , "cặt" , "dốt" , "me may" , "cha may" , "cha mày");
        $message = str_replace($filter, "***", $message);
        return $message;
    }


    public static function endcodeString($string = '', $key = '%WinTeK@2015&') {
        $result = '';
        for ($i = 0; $i < strlen($string); $i++) {
            $char = substr($string, $i, 1);
            $keychar = substr($key, ($i % strlen($key)) - 1, 1);
            $ordChar = ord($char);
            $ordKeychar = ord($keychar);
            $sum = $ordChar + $ordKeychar;
            $char = chr($sum);
            $result .=$char;
        }
        return urlencode(base64_encode($result));
    }


    public static function decodeString($string, $key = '%WinTeK@2015&') {
        $result = '';
        $string = base64_decode(urldecode($string));
        for ($i = 0; $i < strlen($string); $i++) {
            $char = substr($string, $i, 1);
            $keychar = substr($key, ($i % strlen($key)) - 1, 1);
            $ordChar = ord($char);
            $ordKeychar = ord($keychar);
            $sum = $ordChar - $ordKeychar;
            $char = chr($sum);
            $result .=$char;
        }
        return $result;
    }
    public static function getVideoPhimmoi($link){

        try {
            ini_set('user_agent', 'Mozilla/4.0 (compatible; MSIE 6.0)');
            $opts = array(
                'http' => array(
                    'user_agent' => 'My company name',
                    'method' => "GET",
                    'header' => implode("\r\n", array(
                        'Content-type: text/plain;'
                    ))
                )
            );
            $context = stream_context_create($opts);
            $data = file_get_contents($link, false, $context);
            $pattern = "#currentEpisode.url='.*';#imsU";
            preg_match_all($pattern, $data, $chatluong);
            if (isset($chatluong[0]) && isset($chatluong[0][0])) {

                $chatluong = str_replace("currentEpisode.url='", "", $chatluong[0][0]);
                $chatluong = str_replace("';", "", $chatluong);
                $url = "http://www.phimmoi.net/player.php?url=" . $chatluong;

                $urlInfo = parse_url($url);
                $out = "GET  {$url} HTTP/1.1\r\n";
                $out .= "Host: {$urlInfo['host']}\r\n";
                $out .= "User-Agent: {$_SERVER['HTTP_USER_AGENT']}\r\n";
                $out .= "Connection: Close\r\n\r\n";
                if (!$con = @fsockopen($urlInfo['host'], 80, $errno, $errstr, 10))
                    return $errstr . " " . $errno;
                fwrite($con, $out);
                $data = '';
                while (!feof($con)) {
                    $data .= fgets($con, 512);
                }
                fclose($con);
                preg_match("!\r\n(?:Location|URI): *(.*?) *\r\n!", $data, $matches);

                if(isset($matches[1])){
                    $url = $matches[1];
                    return array(array('url' => $url, 'type' => 'phimmoi'));
                }
            }
        }catch (\Exception $e){

        }
        return "";
    }
    public static  function getLinkPicassa($link,$clearcache = false){
        $link = explode('|',$link);
        $common = new Common();
        $cache = $common->getDI()->getModelsCache();
        foreach($link as $l) {
            $cachekey = md5($l) . ".link";
            if ($clearcache) {
                $cache->delete($cachekey);
            }
            $data = $cache->get($cachekey);
            if ($data === null) {
                if (strstr($l, "photos.google.com")) {
                    $links = self::getVideoPhoto($l);
                } else {
                    $links = self::getVideoPicasa($l);
                }

                $data = '[';
                $index = 0;
                foreach ($links as $lf) {
                    if ($index > 0)
                        $data .= "{file:'" . ($lf['url']) . "',label:'" . $lf['height'] . "',type:'mp4','default':'true'},";
                    else
                        $data .= "{file:'" . ($lf['url']) . "',label:'" . $lf['height'] . "',type:'mp4'},";
                    $index = $index + 1;
                }
                $data = $data . ']';
                $cache->save($cachekey, $data, REMEMBER_1D);
            }
            if($data != '[]'){
                break;
            }
        }

        return  $data;
    }
    public static function getVideoPicasa($linkpicasa){

        if($linkpicasa == ""){
            return array();
        }
        try{
            $linkpart = explode('#',$linkpicasa);
            $data = @file_get_contents($linkpicasa);
            if(isset($linkpart[1])) {
                $pattern2 = '#feedPreload: {.*}}},#imsU';
                preg_match_all($pattern2, $data, $title);
                $links = array();
                if (isset($title[0]) && isset($title[0][0])) {
                    $title = str_replace("feedPreload: ", "", $title[0][0]);
                    $title = str_replace("]}}},", "]}}", $title);
                    $dataObject = json_decode($title);

                    if (is_object($dataObject)) {
                        if (isset($linkpart[1]) && isset($dataObject->feed) && isset($dataObject->feed->entry)) {
                            foreach ($dataObject->feed->entry as $i) {
                                $nameid = 'gphoto$id';
                                if ($i->$nameid == $linkpart[1]) {
                                    $media = $i->media->content;
                                    foreach ($media as $l) {
                                        if ($l->type == 'video/mpeg4') {
                                            $itemtmp['url'] = $l->url;
                                            $itemtmp['height'] = $l->height;
                                            $links[] = $itemtmp;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }


            }else{
                $a = explode('"media":{"content":[', $data);
                unset($a[0]);
                $a = explode('],"', $a[1]);
                $datar = explode('},', $a[0]);
                foreach ($datar as $key => $value) {
                    $value = str_replace("}}", "}", $value . "}");
                    $linkdata = json_decode($value, true);
                    if(isset($linkdata['type']) && $linkdata['type'] == "video/mpeg4"){
                        $links[] = $linkdata;
                    }
                }
            }
            return $links;
        }catch (\Exception $e){

        }
        return array();
    }
    public static function getVideoPhoto($link){
        $linktmp = array();
        try {
            $data = @file_get_contents($link);
            $pattern2 = '#,"url.*"]#imsU';
            preg_match_all($pattern2, $data, $title);
            $title = $title[0][0];
            $title = str_replace(',"url', '["url', $title);
            $title = json_decode($title);
            $title = urldecode($title['0']);
            $links = explode('url=', $title);
            foreach ($links as $link) {
                if ($link != "") {
                    $params = explode('&', $link);
                    if (strstr($params[2], 'video/mp4')) {
                        $quatity = str_replace("quality=", "", $params[3]);
                        $quatity = str_replace(",", "", $quatity);
                        $linktmp[] = array(
                            "url" => $params[0],
                            "height" => $quatity
                        );
                    }
                }
            }
        }catch (\Exception $e){

        }
            $linksfilm = array();
            if (count($linktmp) > 0) {
                for ($i = count($linktmp) - 1; $i >= 0; $i--) {
                    $linksfilm[] = $linktmp[$i];
                }
            }

        return $linksfilm;
    }
    public static function getVideoYoutube($link){

        if($link == ""){
            return array();
        }
        return YoutbeDownloader::getInstance()->getLink(str_replace('https://www.youtube.com/watch?v=','',$link));
    }
    public static  function getCDN($filename,$linkfull = false){
        $playlist = '[]';
        if(isset($filename) && $filename != ""){
            $cdnrand = rand(1,100);
            if($cdnrand < 33){
                $cdnserver  = "cdn1";
            }elseif($cdnrand >=33 && $cdnrand <=66 ){
                $cdnserver  = "cdn2";
            }else{
                $cdnserver  = "cdn3";
            }
            if($linkfull ==1){
                $playlist = 'http://'.$cdnserver.'.hdsieunhanh.com:1935/hdsieunhanh_vod/mp4:'.$filename.'.720p.mp4/playlist.m3u8';
            }else{
                $playlist = '[{ file: "http://'.$cdnserver.'.hdsieunhanh.com:1935/hdsieunhanh_vod/mp4:'.$filename.'.720p.mp4/playlist.m3u8",type:"hls"}]';
            }

        }
        return $playlist;
    }

//    Xóa cache
    public static function clearCache($slug = null){
        $common = new Common();
        $cache = $common->getDI()->getModelsCache();
        $keys =$cache->queryKeys();
//        print_r($keys); die();

        if ($slug != null ) {

//            Trang chi tiet View
            if(is_numeric($slug)) {

                $del[] = 'getViewByCats';
                $del[] = 'showHomePage';
                $del[] = 'getNewsNew';
                $del[] = 'getView.'. $slug;
                $del[] = 'shownews.'. $slug;
                $del[] = 'getVote.'. $slug;

//            Trang Categories
            }  else {

                $data = Category::findFirst(array(
                        'columns' => 'id',
                        'conditions' => 'alias = ?1',
                        'bind' => array(1 => $slug)
                    )
                );

                if ($data != null) {

                    $del[] = 'getCategoryFromSlug.' . $slug;
                    $del[] = 'getNewsBySubCat.' . $data->id;
                    $del[] = 'getXemNhieu.' . $data->id;
                    $del[] = 'getHotNewsByCat.' . $data->id;


                    // Kiểm tra có Catgories con không
                    $subCats = Category::find(
                        array(
                            'conditions' => 'categoryid = ?1',
                            'bind' => array(1 => $data->id)
                        )
                    );

                    if ($subCats->count() > 0) {
                        foreach ($subCats as $subCat) {
                            $del[] = 'getSubCatID.' . $subCat->id;
                            $del[] = 'getXemNhieu.' . $subCat->id;
                        }
                    }

                }
            }

        }


//        Kiểm tra cache có tồn tại trong thư mục cache không? Nếu có thì xóa
        foreach($keys as $key => $value) {
            if ($del != null) {

                foreach ($del as $item) {
                    if (strstr($value, $item)) {
                        $cache->delete($value);
                    }
                }


            } else {

                if (strstr($value, "get")) {
                    $cache->delete($value);
                }
                if (strstr($value, "show")) {
                    $cache->delete($value);
                }
                if (strstr($value, "search")) {
                    $cache->delete($value);
                }
                if (strstr($value, "List_Tags")) {
                    $cache->delete($value);
                }


            }
        }
    }
    public static function getVideoZing($link){
        $zing =  new Zing();
        $films_url =  $zing->getLink($link);
        return $films_url;
    }
    public static function isMobile() {
        return preg_match("/(android|avantgo|blackberry|bolt|boost|cricket|docomo|fone|hiptop|mini|mobi|palm|phone|pie|tablet|up\.browser|up\.link|webos|wos)/i", $_SERVER["HTTP_USER_AGENT"]);
    }
    public static function encrypt($x, $key = 'hd'){
        $x .= $key;
        $s = '';
        foreach (str_split($x) as $c)
            $s .= sprintf("%02X", ord($c));
        return ($s);
    }
public static function decrypt($x, $key = 'hd') {
        $x .= $key;
        $s = '';
        foreach (explode("\n", trim(chunk_split($x, 2))) as $h)
            $s .= chr(hexdec($h));
        return (substr($s, 0, -3));
    }

    public static function folder_exist($folder)
    {
        $path = realpath($folder);
        if($path !== false AND is_dir($path))
        {
            return true;
        }
        return false;
    }
   static function linkFilmDetail($film,$tap = ""){
       $common = new Common();
        $url = $common->getDI()->getUrl();
        if ($film['type_film'] == 2 && $tap == "") {
            $tap = 1;
        }
        if ($tap == "") {
            return URL_PUBLIC . $url->get(array(
                "for" => "show-film",
                "slug" => $common->stripTag($film['name']." ".$film['extension']),
                "code" => $common->encrypt($film['id'])
            ));
        } else {
            return URL_PUBLIC . $url->get(array(
                "for" => "show-film-episode",
                "slug" => $common->stripTag($film['name']." ".$film['extension']),
                "code" => $common->encrypt($film['id']),
                "episode" => $tap
            ));
        }
    }

    static function linkContent($item) {
        $common = new Common();
        $url = $common->getDI()->getUrl();
        return URL_PUBLIC . $url->get(array(
            "for" => "show-news",
            "slug" => Common::stripTag($item['title']),
            "id" => $item['id']
        ));
    }

    static function ImageContent($item) {
        if ($item['image']) {
            // IF image is url
            if (!filter_var($item['image'], FILTER_VALIDATE_URL) === false) {
                return $item['image'];
            }
            return STATIC_SERVER . "news/" .$item['image'];
        }
        return STATIC_SERVER."news/noimage.jpg";
    }

    static function linkShowDetail($film,$tap = ""){
        $common = new Common();
        $url = $common->getDI()->getUrl();
        if ($film['type_show'] == 2 && $tap == "") {
            $tap = 1;
        }
        if ($tap == "") {
            return URL_PUBLIC . $url->get(array(
                "for" => "show-news",
                "slug" => $common->stripTag($film['name']." ".$film['extension']),
                "code" => $common->encrypt($film['id'])
            ));
        } else {
            return URL_PUBLIC . $url->get(array(
                "for" => "show-episode",
                "slug" => $common->stripTag($film['name']." ".$film['extension']),
                "code" => $common->encrypt($film['id']),
                "episode" => $tap
            ));
        }
    }

    function linkCustomDetail($film){

    }
    static function showIntro($introtext,$characterintrotext = 390){
        if($introtext == "")
            return "";
        $d = strip_tags($introtext);
        $tmp = str_split($d);
        if(count($tmp) <= $characterintrotext)
            $shorttext = $d."...";
        else
        {
            if($tmp[$characterintrotext - 1]==" ")
                $shorttext = substr($d,0,$characterintrotext)."...";
            else
            {
                $num = $characterintrotext;
                while($tmp[$num - 1]!=" ")
                {
                    $num--;
                }
                $shorttext = substr($d,0,$num)."...";
            }
        }
        return $shorttext;
    }



    static function queryData($query,$cache=false,$show = "all"){
        $film =  new News();
        if($cache == true){
            $cachekey = md5($query);
            $cache = $film->getDI()->getModelsCache();
            $data = $cache->get($cachekey);
            if ($data == null) {
                if($show == "all"){
                    $data =  $film->getReadConnection()->query($query)->fetchAll(\PDO::FETCH_ASSOC);
                }else{
                    $data =  $film->getReadConnection()->query($query)->fetch(\PDO::FETCH_ASSOC);
                }
                $cache->save($cachekey, $data, REMEMBER_1D);
                return $data;
            }else{
                return $data;
            }
        }else{
            if($show == "all"){
                return $film->getReadConnection()->query($query)->fetchAll(\PDO::FETCH_ASSOC);
            }else{
                return $film->getReadConnection()->query($query)->fetch(\PDO::FETCH_ASSOC);
            }

        }
    }
    static function queryExecute($query){
        $film =  new News();
        $data =  $film->getReadConnection()->query($query);
        return $data;
    }
    public static function getImage($image)
    {
        if ($image) {

            if (!filter_var($image, FILTER_VALIDATE_URL) === false) {
                return $image;
            }
            return  "/files/" .$image;

        }
        return "/news/noimage.png";
    }
    public function getCropImage($image) {
        if ($image) {
            // IF image is url
            if (!filter_var($image, FILTER_VALIDATE_URL) === false) {
                return $image;
            }
            return STATIC_SERVER . "news/" . str_replace('thumb/','crop/',$image);
        }
        return STATIC_SERVER."news/noimage.jpg";
    }
    public static function getThumbImage($image){
        if ($image) {

            // IF image is url
            if (!filter_var($image, FILTER_VALIDATE_URL) === false) {
                return $image;
            }
            return STATIC_SERVER . "news/" .$image;

        }
        return STATIC_SERVER."news/noimage.jpg";
    }

    public static function getView($id,$viewFilm,$clearcache){
        $common = new Common();
        $cache = $common->getDI()->getModelsCache();
        $cachekey = "getView.".$id;
        // Nếu có token thì xóa cache
        if ($clearcache) {$cache->delete($cachekey);}
        $view = $cache->get($cachekey);
        if ($view == null) {
            $view = $viewFilm+1;
            $cache->save($cachekey, $view, REMEMBER_1D);
        }else{
            $view = $view + 1;
            $cache->save($cachekey, $view, REMEMBER_1D);
        }
        return $view;
    }
    public static function getShowView($id,$viewFilm,$clearcache){
        $common = new Common();
        $cache = $common->getDI()->getModelsCache();
        $cachekey = "getShowView.".$id;
        // Nếu có token thì xóa cache
        if ($clearcache) {$cache->delete($cachekey);}
        $view = $cache->get($cachekey);
        if ($view == null) {
            $view = $viewFilm+1;
            $cache->save($cachekey, $view, REMEMBER_1D);
        }else{
            $view = $view + 1;
            $cache->save($cachekey, $view, REMEMBER_1D);
        }
        return $view;
    }
    public static function getRedirect()
    {
        $redirect = "/";
        if (isset($_SERVER['HTTP_REFERER'])) {
            $redirect = $_SERVER['HTTP_REFERER'];
        }
        return $redirect;
    }
    public static function getDate()
    {
        $date = array();
        for ($i = 1; $i < 32; $i++) {
            if ($i < 10) {
                $date[$i] = "0" . $i;
            } else {
                $date[$i] = $i;
            }
        }
        return $date;
    }

    static function getMonth(){
        return array(
            "1"=>'January',
            "2"=>'February',
            "3"=>'March',
            "4"=>'April',
            "5"=>'May',
            "6"=>'June',
            "7"=>'July',
            "8"=>'August',
            "9"=>'September',
            "10"=>'October',
            "11"=>'November',
            "12"=>'December',
        );
    }

    public static function getYear()
    {
        $year = array();
        $now = date("Y");
        for ($i = $now; $i >= 1890; $i--) {
            $year[$i] = $i;
        }
        return $year;
    }
    public static function getProvince()
    {
        return array(
            "Hà Nội" => "Hà Nội",
            "TP HCM" => "TP HCM",
            "An Giang" => "An Giang",
            "Bà Rịa - Vũng Tàu" => "Bà Rịa - Vũng Tàu",
            "Bắc Giang" => "Bắc Giang",
            "Bắc Kạn" => "Bắc Kạn",
            "Bạc Liêu" => "Bạc Liêu",
            "Bắc Ninh" => "Bắc Ninh",
            "Bến Tre" => "Bến Tre",
            "Bình Định" => "Bình Định",
            "Bình Dương" => "Bình Dương",
            "Bình Phước" => "Bình Phước",
            "Bình Thuận" => "Bình Thuận",
            "Cà Mau" => "Cà Mau",
            "Cao Bằng" => "Cao Bằng",
            "Cần Thơ" => "Cần Thơ",
            "Đà Nẵng" => "Đà Nẵng",
            "Đắk Lắk" => "Đắk Lắk",
            "Đắk Nông" => "Đắk Nông",
            "Điện Biên" => "Điện Biên",
            "Đồng Nai" => "Đồng Nai",
            "Đồng Tháp" => "Đồng Tháp",
            "Gia Lai" => "Gia Lai",
            "Hà Giang" => "Hà Giang",
            "Hà Nam" => "Hà Nam",
            "Hà Tĩnh" => "Hà Tĩnh",
            "Hải Dương" => "Hải Dương",
            "Hải Phòng" => "Hải Phòng",
            "Hậu Giang" => "Hậu Giang",
            "Hòa Bình" => "Hòa Bình",
            "Hưng Yên" => "Hưng Yên",
            "Khánh Hòa" => "Khánh Hòa",
            "Kiên Giang" => "Kiên Giang",
            "Kon Tum" => "Kon Tum",
            "Lai Châu" => "Lai Châu",
            "Lâm Đồng" => "Lâm Đồng",
            "Lạng Sơn" => "Lạng Sơn",
            "Lào Cai" => "Lào Cai",
            "Long An" => "Long An",
            "Nam Định" => "Nam Định",
            "Nghệ An" => "Nghệ An",
            "Ninh Bình" => "Ninh Bình",
            "Ninh Thuận" => "Ninh Thuận",
            "Phú Thọ" => "Phú Thọ",
            "Quảng Bình" => "Quảng Bình",
            "Quảng Nam" => "Quảng Nam",
            "Quảng Ngãi" => "Quảng Ngãi",
            "Quảng Ninh" => "Quảng Ninh",
            "Quảng Trị" => "Quảng Trị",
            "Sóc Trăng" => "Sóc Trăng",
            "Sơn La" => "Sơn La",
            "Tây Ninh" => "Tây Ninh",
            "Thái Bình" => "Thái Bình",
            "Thái Nguyên" => "Thái Nguyên",
            "Thanh Hóa" => "Thanh Hóa",
            "Thừa Thiên Huế" => "Thừa Thiên Huế",
            "Tiền Giang" => "Tiền Giang",
            "Trà Vinh" => "Trà Vinh",
            "Tuyên Quang" => "Tuyên Quang",
            "Vĩnh Long" => "Vĩnh Long",
            "Vĩnh Phúc" => "Vĩnh Phúc",
            "Yên Bái" => "Yên Bái",
            "Phú Yên" => "Phú Yên",
        );
    }
    public static function registerSession($member)
    {
        $_SESSION['member'] = true;
        $member = $member->toArray();
        unset($member['password']);
        $_SESSION['user'] = $member;
        $_SESSION['user_id'] = $member['id'];
    }
    public static function randomString($limit = 10)
    {
        return substr(md5(rand()), 0, $limit);
    }
    public static function getClientIP()
    {
            if(isset($_SERVER["HTTP_CF_CONNECTING_IP"])) {
                $_SERVER['REMOTE_ADDR'] = $_SERVER["HTTP_CF_CONNECTING_IP"];
                $ip = $_SERVER['REMOTE_ADDR'];
                $test = $_SERVER['REMOTE_ADDR'];
                $t = explode(", ", $test);
                if (!empty($t[0])) {
                    $remote_add = $t[0];
                } else {
                    $remote_add = $ip;
                }
                $ip=$remote_add;
            }
            else {
                if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
                    $ip = $_SERVER['HTTP_CLIENT_IP'];
                } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
                    $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
                } else {
                    $ip = $_SERVER['REMOTE_ADDR'];
                }

            }
            $_SERVER['REMOTE_ADDR'] = $ip;

            return $ip;
    }
    static function sendEmailRegister($email, $password,$token = "")
    {
        $common = new Common();
        $config = $common->getDI()->getConfig();
        $mail = new \Library\PHPMailer\PHPMailer;
        $mail->isSMTP();
        $mail->SMTPDebug = 1;
        $mail->CharSet = 'UTF-8';
        $mail->Debugoutput = 'html';
        $mail->Host = $config->mail->smtp->server;
        $mail->Port = $config->mail->smtp->port;
        $mail->SMTPSecure = $config->mail->smtp->security;
        $mail->SMTPAuth = true;
        $mail->Username = $config->mail->smtp->username;
        $mail->Password = $config->mail->smtp->password;
        $mail->setFrom($config->mail->fromEmail,$config->mail->fromName, '');
        $mail->addAddress($email, '');
        $mail->Subject = 'Tài khoản đăng ký thành viên';
        $mail->msgHTML(Common::emailTemplateRegister($email, $password,$token));
        if (!$mail->send()) {
            echo "Mailer Error: " . $mail->ErrorInfo;
        } else {
            echo "Message sent!";
        }
    }
    static function getRtmp(){
        $m = new Mobile_Detect();
        if($m->isMobile() || $m->isTablet()){
           return false;
        }else{
            return true;
        }
    }

}
