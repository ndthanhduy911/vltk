<?php
use Library\Helper\HelperValidation;
class Slideshows extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("slideshows");
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
            'deptid' => 'Bộ môn',
            'deptname' => 'Bộ môn',
            'createdat' => 'Ngày tạo',
            'name' => 'Tiêu đề',
            'description' => 'Mô tả'
        ];
        return isset($feilds[$key]) ? $feilds[$key] : '';
    }

    public static function arrayFilter(){
        return [
            ['name'],
            ['status'],
            ['createdat']
        ];
    }

    public static function findTables () {
        return ['image','name','description','createdat','slug','status'];
    }

    public static function arrayOrder () {
        return ['name','status','createdat'];
    }
    
    public static function findFilters () {
        $filters = \Slideshows::arrayFilter();
        return array_merge($filters[0],$filters[1],$filters[2]);
    }

    public static function arrayTrashFilter(){
        return [
            ['name'],
            ['status'],
            ['createdat']
        ];
    }

    public static function findTrashTables () {
        return ['image','name','description','createdat','slug'];
    }

    public static function arrayTrashOrder () {
        return ['name','createdat'];
    }
    
    public static function findTrashFilters () {
        $filters = \Slideshows::arrayTrashFilter();
        return array_merge($filters[0],$filters[1],$filters[2]);
    }
}