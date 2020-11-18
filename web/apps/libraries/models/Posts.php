<?php

use Library\Helper\HelperValidation;

class Posts extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("posts");
    }

    public function getSource()
    {
        return 'posts';
    }

    public static function getUrlById($id = null)
    {
        if($post = parent::findFirst($id)){
            return WEB_URL.'/'.$post->slug;
        }else{
            return false;
        }
    }

    public static function getLang($postid =  null){
        if($post = PostsLang::findFirst(['postid = :postid: AND langid = :langid:','bind' => ['postid' => $postid, 'langid' => $_SESSION['langid']]])){
            return $post;
        }else{
            return false;
        }
    }
    
    public static function getTitleById($postid = null)
    {
        if($post = PostsLang::findFirst(['postid = :postid: AND langid = :langid:','bind' => ['postid' => $postid, 'langid' => $_SESSION['langid']]])){
            return $post->name;
        }else{
            return false;
        }
    }

    public static function getUrl($dept = NULL, $post = NULL)
    {
        if($post && $dept){
            return WEB_URL.($dept->id != 1 ? "/$dept->slug" : '' ).'/news/'.$post->slug;
        }else{
            return '';
        }
    }

    public static function createPaging($startPage,$total,$length = 25){
        $text = "";
        if($total <= $length){
            return $text;
        }

        $totalPage = ceil($total / $length);
        if ($startPage > $totalPage){
            $startPage = $totalPage;
        }else if ($startPage < 1){
            $startPage = 0;
        }
        if($totalPage){
            $text = "<ul class=\"pagination justify-content-center\">";
            if($totalPage < 5){
                if($startPage > 0){
                    $text .=  "<li class=\"page-item\">
                                <a class=\"page-link\" data-page=".($startPage - 1)." href=\"?paged=".($startPage - 1)."\" aria-label=\"Trước\">
                                    <i aria-hidden=\"true\" class=\"fa fa-angle-left\"></i>
                                    <span class=\"sr-only\">Trước</span>
                                </a>
                            </li>";
                }
                for ($i=0; $i < $totalPage; $i++) { 
                    $text .= "<li class=\"page-item ".($i == $startPage ? 'active' : '')."\"><a class=\"page-link\" data-page=\"{$i}\" href=\"?paged={$i}\">".($i+1)."</a></li>";
                }
    
                if($startPage !== $totalPage){
                    $text .="<li class=\"page-item\">
                                <a class=\"page-link\" data-page=".($startPage+1)." href=\"?paged=".($startPage+1)."\" aria-label=\"Sau\">
                                    <i aria-hidden=\"true\" class=\"fa fa-angle-right\"></i>
                                    <span class=\"sr-only\">Sau</span>
                                </a>
                            </li>";
                }
            }else{
                if($startPage > 0){
                    $text .=  "<li class=\"page-item\">
                                <a class=\"page-link\" data-page=".($startPage - 1)." href=\"?paged=".($startPage - 1)."\" aria-label=\"Trước\">
                                    <i aria-hidden=\"true\" class=\"fa fa-angle-left\"></i>
                                    <span class=\"sr-only\">Trước</span>
                                </a>
                            </li>";
                }
                $text .= "<li class=\"page-item ".($startPage == 0 ? 'active' : '')."\"><a class=\"page-link\" data-page=0 href=\"?paged=0\">1</a></li>";
                if($startPage > 2){
                    $text .= "<li class=\"page-item\"><a class=\"page-link disabled\">...</a></li>";
                }
    
                $snumber = $startPage > 2 ? ($startPage - 1) : 1;
                $enumber = ($snumber + 3) >= $totalPage ? $totalPage : ($snumber + 3);
                for ($i=$snumber; $i < $enumber; $i++) { 
                    $text .= "<li class=\"page-item ".($i == $startPage ? 'active' : '')."\"><a class=\"page-link\" data-page={$i} href=\"?paged={$i}\">".($i+1)."</a></li>";
                }
                if(($totalPage - $startPage) > 3){
                    $text .= "<li class=\"page-item\"><a class=\"page-link disabled\">...</a></li>";
                }
    
                if(($totalPage - $startPage) > 2){
                    $text .= "<li class=\"page-item ".(($totalPage - 1) == $startPage ? 'active' : '')."\"><a class=\"page-link\" data-page=".($totalPage-1)." href=\"?paged=".($totalPage-1)."\">{$totalPage}</a></li>";
                }        
        
                if($startPage < ($totalPage-1)){
                    $text .="<li class=\"page-item\">
                                <a class=\"page-link\" data-page=".($startPage+1)." href=\"?paged=".($startPage+1)."\" aria-label=\"Sau\">
                                    <i aria-hidden=\"true\" class=\"fa fa-angle-right\"></i>
                                    <span class=\"sr-only\">Sau</span>
                                </a>
                            </li>";
                }
            }
        }
        $text .= "</ul>";

        return $text;

    }

    public function vdUpdate($try = false){
        $helper = new HelperValidation();
        $helper->setValidation('required', [
            'name' => 'deptid',
            'msg' => 'Đơn vị/bộ phận không được để trống'
        ]);
        //calendar
        $helper->setValidation('max', [
            'name' => 'calendar',
            'len' => 16,
            'msg' => 'Ngày đăng không được quá 16 ký tự'
        ]);
        if(!empty($this->calendar)){
            $helper->setValidation('date', [
                'name' => 'calendar',
                'format' => 'd/m/Y H:i',
                'msg' => 'Ngày đăng không đúng định dạng'
            ]);
        }
        //slug
        $helper->setValidation('max', [
            'name' => 'slug',
            'len' => 255,
            'msg' => 'Slug không được dài quá 255 ký tự'
        ]);
        //catid
        $helper->setValidation('required', [
            'name' => 'catid',
            'msg' => 'Chuyên mục không được để trống'
        ]);
        //status
        $helper->setValidation('required', [
            'name' => 'status',
            'msg' => 'Trạng thái không được để trống'
        ]);

        if($try){
            if(!$this->validate($helper->getValidation())){
                foreach ($this->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
        }

        return $this->validate($helper->getValidation());
    }

    public static function filedName($key){
        $feilds = [
            'slug' => 'Liên kết',
            'catid' => 'Chuyên mục',
            'catname' => 'Chuyên mục',
            'status' => 'Trạng thái',
            'featured_image' => 'Hình đại diện',
            'author' => 'Tác giả',
            'authorname' => 'Tác giả',
            'deptid' => 'Đơn vị/bộ phận',
            'deptname' => 'Đơn vị/bộ phận',
            'calendar' => 'Ngày đăng',
            'title' => 'Tiêu đề',
            'excerpt' => 'Trích dẫn'
        ];
        return isset($feilds[$key]) ? $feilds[$key] : '';
    }

    public static function arrayFilter(){
        return [
            ['title'],
            ['catid','status'],
            ['calendar']
        ];
    }

    public static function findTables () {
        return ['featured_image','title','excerpt','catid','authorname','calendar','slug','status'];
    }

    public static function arrayOrder () {
        return ['title','catid','status','calendar'];
    }
    
    public static function findFilters () {
        $filters = \Posts::arrayFilter();
        return array_merge($filters[0],$filters[1],$filters[2]);
    }
}