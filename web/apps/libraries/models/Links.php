<?php 
use Library\Helper\HelperValidation;

class Links extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("links");
    }

    public static function getLName($linkid, $langid = 1){
        $menulang = \LinksLang::findFirst(['langid =:langid: AND linkid = :linkid:', 'bind'=>['langid' => $langid, 'linkid' => $linkid]]);
        return $menulang ? $menulang->title : '';
    }

    public function vdUpdate($try = false){
        $helper = new HelperValidation();
        $helper->setValidation('required', [
            'name' => 'deptid',
            'msg' => 'Bộ môn không được để trống'
        ]);
        //link
        $helper->setValidation('max', [
            'name' => 'link',
            'len' => 255,
            'msg' => 'Link không được dài quá 255 ký tự'
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
            'link' => 'Link',
            'status' => 'Trạng thái',
            'icon' => 'Biểu tượng',
            'createdby' => 'Tác giả',
            'deptid' => 'Bộ môn',
            'deptname' => 'Bộ môn',
            'createdat' => 'Ngày tạo',
            'title' => 'Tiêu đề'
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
        return ['icon','title','createdby','createdat','link','status'];
    }

    public static function arrayOrder () {
        return ['title','status','createdat'];
    }
    
    public static function findFilters () {
        $filters = \Links::arrayFilter();
        return array_merge($filters[0],$filters[1],$filters[2]);
    }
}