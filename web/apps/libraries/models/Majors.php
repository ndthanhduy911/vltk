<?php
use Library\Helper\HelperValidation;
class Majors extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("majors");
    }

    public static function getUrl($dept, $major = NULL)
    {
        if($dept->id == 1){
            return WEB_URL.'/nganh-hoc/'.$major->slug;
        }else{
            return WEB_URL."/$dept->slug".'/nganh-hoc/'.$major->slug;
        }
    }

    public static function getTitleById($id = null)
    {
        if($majors = MajorsLang::findFirst(['majorid = :majorid:','bind' => ['majorid' => $id]])){
            return $majors->name;
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
            'content' => 'Giới thiệu chung'
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
        $filters = \Majors::arrayFilter();
        return array_merge($filters[0],$filters[1],$filters[2]);
    }
}