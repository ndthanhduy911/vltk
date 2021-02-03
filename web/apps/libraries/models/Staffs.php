<?php
use Library\Helper\HelperValidation;
use Library\ML\ML as MLML;

class Staffs extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("staffs");
    }

    public static function getUrl($dept, $staff = NULL)
    {
        if($dept->id == 1){
            return WEB_URL.'/nhan-su/'.$staff->slug;
        }else{
            return WEB_URL."/$dept->slug".'/nhan-su/'.$staff->slug;
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

    public static function getDean($regency = ""){
        switch ((int)$regency) {
            case 1: 
                return MLML::_ml('dean',"Trưởng khoa");
            case 2: 
                return MLML::_ml('vice_dean',"Phó trưởng khoa");            
            default:
                return "";
                break;
        }
    }

    public static function getPosition($pos = ""){
        switch ((int)$pos) {
            case 1: 
                return  MLML::_ml('dean_dept',"Trưởng bộ môn") ;
            case 2: 
                return MLML::_ml('vice_dean_dept',"Phó bộ môn");       
            case 3: 
                return MLML::_ml('managing_lecturer',"Giáo vụ");      
            case 4: 
                return MLML::_ml('lecturer',"Giảng viên");  
            case 5: 
                return MLML::_ml('visiting_lecturer',"Cán bộ thỉnh giảng");  
            case 6: 
                return MLML::_ml('staff',"Nhân viên");  
            default:
                return "";
                break;
        }
    }

    public static function filedName($key){
        $feilds = [
            'slug' => 'Xem',
            'status' => 'Trạng thái',
            'image' => 'Hình đại diện',
            'regency' => 'Chức vụ Khoa',
            'deptposition' => 'Chức vụ Bộ môn',
            'email' => 'E-mail',
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
            ['title','email'],
            ['status'],
            ['createdat']
        ];
    }

    public static function findTables () {
        return ['image','title','email','dean','deptposition','createdat','slug','status'];
    }

    public static function arrayOrder () {
        return ['title','email','status','createdat'];
    }
    
    public static function findFilters () {
        $filters = \Staffs::arrayFilter();
        return array_merge($filters[0],$filters[1],$filters[2]);
    }
}