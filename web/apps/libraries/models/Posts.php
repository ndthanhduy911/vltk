<?php
class Posts extends \Phalcon\Mvc\Model
{
    public function getSource()
    {
        return 'posts';
    }

    public static function findFirstId($id, $columns = "*")
    {
        if($_SESSION['role'] === 1){
            return parent::findFirst([
                "conditions" => "id = :id:",
                "bind" => array('id' => $id),
                "columns" => $columns
            ]);
        }else{
            return parent::findFirst([
                "conditions" => "id = :id: AND dept_id IN (".implode(',',$_SESSION['dept_mg']).")",
                "bind" => array('id' => $id),
                "columns" => $columns
            ]);
        }
    }

    public static function getUrlById($id = null)
    {
        if($post = parent::findFirst($id)){
            return WEB_URL.'/'.$post->slug;
        }else{
            return false;
        }
    }

    public static function getLang($post_id =  null){
        if($post = PostsLang::findFirst(['post_id = :post_id: AND lang_id = :lang_id:','bind' => ['post_id' => $post_id, 'lang_id' => $_SESSION['lang_id']]])){
            return $post;
        }else{
            return false;
        }
    }
    
    public static function getTitleById($post_id = null)
    {
        if($post = PostsLang::findFirst(['post_id = :post_id: AND lang_id = :lang_id:','bind' => ['post_id' => $post_id, 'lang_id' => $_SESSION['lang_id']]])){
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
}