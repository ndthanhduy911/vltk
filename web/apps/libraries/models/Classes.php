<?php
use Library\Helper\HelperValidation;
class Classes extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("classes");
    }


    public static function getTitleById($id = null)
    {
        if($class = ClassesLang::findFirst(['classid = :classid:','bind' => ['classid' => $id]])){
            return $class->name;
        }else{
            return null;
        }
    }

    public static function getUrl($dept = NULL, $class = NULL)
    {
        if($class && $dept){
            return WEB_URL.($dept->id != 1 ? "/$dept->slug" : '' ).'/lop-hoc/'.$class->slug;
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
        //code
        $helper->setValidation('max', [
            'name' => 'code',
            'len' => 20,
            'msg' => 'Mã lớp không được dài quá 20 ký tự'
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
            'code' => 'Mã lớp',
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
            ['title','code'],
            ['status'],
            ['createdat']
        ];
    }

    public static function findTables () {
        return ['image','code','title','excerpt','createdat','slug','status'];
    }

    public static function arrayOrder () {
        return ['title','code','status','createdat'];
    }
    
    public static function findFilters () {
        $filters = \Classes::arrayFilter();
        return array_merge($filters[0],$filters[1],$filters[2]);
    }
}