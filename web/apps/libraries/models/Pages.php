<?php
use Library\Helper\HelperValidation;
class Pages extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("pages");
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
        if($page = PagesLang::findFirst(['pageid = :pageid:','bind' => ['pageid' => $id]])){
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
        //slug
        $helper->setValidation('max', [
            'name' => 'slug',
            'len' => 255,
            'msg' => 'Slug không được dài quá 255 ký tự'
        ]);
        //attrid
        $helper->setValidation('required', [
            'name' => 'attrid',
            'msg' => 'Giao diện không được để trống'
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
            'slug' => 'Xem',
            'status' => 'Trạng thái',
            'image' => 'Hình đại diện',
            'createdby' => 'Tác giả',
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
        return ['image','title','excerpt','createdby','createdat','slug','status'];
    }

    public static function arrayOrder () {
        return ['title','status','createdat'];
    }
    
    public static function findFilters () {
        $filters = \Pages::arrayFilter();
        return array_merge($filters[0],$filters[1],$filters[2]);
    }
}