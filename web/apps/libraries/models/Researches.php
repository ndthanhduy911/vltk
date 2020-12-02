<?php

class Researches extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("researches");
    }

    public static function getUrlById($id = null)
    {
        
        if($research = parent::findFirst($id)){
            return WEB_URL.'/'.$research->slug;
        }else{
            return null;
        }
    }

    public static function getTitleById($id = null)
    {
        if($research = ResearchesLang::findFirst(['research_id = :research_id:','bind' => ['research_id' => $id]])){
            return $research->name;
        }else{
            return null;
        }
    }

    public static function getUrl($dept = NULL, $research = NULL)
    {
        if($research && $dept){
            return WEB_URL.($dept->id != 1 ? "/$dept->slug" : '' ).'/research/'.$research->slug;
        }else{
            return '';
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
        return ['image','title','excerpt','createdat','slug','status'];
    }

    public static function arrayOrder () {
        return ['title','status','createdat'];
    }
    
    public static function findFilters () {
        $filters = \Researches::arrayFilter();
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
        return ['image','title','excerpt','createdat','slug'];
    }

    public static function arrayTrashOrder () {
        return ['title','createdat'];
    }
    
    public static function findTrashFilters () {
        $filters = \Researches::arrayTrashFilter();
        return array_merge($filters[0],$filters[1],$filters[2]);
    }
}