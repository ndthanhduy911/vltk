<?php
use Library\Helper\HelperValidation;
class Pages extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("pages");
    }

    public function getSource()
    {
        return 'pages';
    }

    public static function getUrlById($id = null)
    {
        if($page = parent::findFirst($id)){
            return WEB_URL.'/'.$page->slug;
        }else{
            return null;
        }
    }

    public static function getTitleById($id = null)
    {
        if($page = PagesLang::findFirst(['page_id = :page_id:','bind' => ['page_id' => $id]])){
            return $page->name;
        }else{
            return null;
        }
    }

    public function vdUpdate($try = false){
        $helper = new HelperValidation();
        $helper->setValidation('required', [
            'name' => 'deptid',
            'msg' => 'Bộ môn không được để trống'
        ]);
        //calendar
        if(!empty($this->calendar)){
            $helper->setValidation('date', [
                'name' => 'calendar',
                'format' => 'Y-m-d H:i:s',
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
            'status' => 'Trạng thái',
            'image' => 'Hình đại diện',
            'author' => 'Tác giả',
            'authorname' => 'Tác giả',
            'deptid' => 'Bộ môn',
            'deptname' => 'Bộ môn',
            'createdat' => 'Ngày tạo',
            'title' => 'Tiêu đề',
            'excerpt' => 'Tóm tắt'
        ];
        return isset($feilds[$key]) ? $feilds[$key] : '';
    }

    public static function arrayFilter(){
        return [
            ['title'],
            ['status'],
            ['createdat']
        ];
    }

    public static function findTables () {
        return ['image','title','excerpt','authorname','createdat','slug','status'];
    }

    public static function arrayOrder () {
        return ['title','status','createdat'];
    }
    
    public static function findFilters () {
        $filters = \Pages::arrayFilter();
        return array_merge($filters[0],$filters[1],$filters[2]);
    }

    public static function arrayTrashFilter(){
        return [
            ['title'],
            ['catid'],
            ['createdat']
        ];
    }

    public static function findTrashTables () {
        return ['image','title','excerpt','authorname','createdat','slug'];
    }

    public static function arrayTrashOrder () {
        return ['title','calendar'];
    }
    
    public static function findTrashFilters () {
        $filters = \Pages::arrayTrashFilter();
        return array_merge($filters[0],$filters[1],$filters[2]);
    }
}