<?php
use Library\Helper\HelperValidation;
class Banners extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("banners");
    }

    public function vdUpdate($try = false){
        $helper = new HelperValidation();
        $helper->setValidation('required', [
            'name' => 'deptid',
            'msg' => 'Bộ môn không được để trống'
        ]);
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
        $filters = \Banners::arrayFilter();
        return array_merge($filters[0],$filters[1],$filters[2]);
    }

    public static function arrayTrashFilter(){
        return [
            ['title'],
            ['status'],
            ['createdat']
        ];
    }

    public static function findTrashTables () {
        return ['image','title','excerpt','authorname','createdat','slug'];
    }

    public static function arrayTrashOrder () {
        return ['title','createdat'];
    }
    
    public static function findTrashFilters () {
        $filters = \Banners::arrayTrashFilter();
        return array_merge($filters[0],$filters[1],$filters[2]);
    }
}