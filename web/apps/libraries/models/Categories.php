<?php
use Library\Helper\HelperValidation;

class Categories extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("categories");
    }
    
    public static function getChild($id , $data = [], $levelTag = '', $level = 0){
        $deptChild = Categories::find(["parentid = :id: AND deleted = 0", 'columns' => "id", 'bind' => ['id' => $id]]);
        if($deptChild->count()){
            $levelTag .= '&#151;' ;
            $level ++;
            foreach ($deptChild as $value) {
                $value->levelTag = $levelTag;
                $value->level = $level;
                array_push($data, $value);
                $data = \Categories::getChild($value->id, $data, $levelTag, $level);
            }
        }
        return $data;
    }

    public static function getArrayChild($id , $data = []){
        $deptChild = Categories::find(["parentid = :pid: AND deleted = 0", 'columns' => "id", 'bind' => ['pid' => $id]]);
        if($deptChild->count()){
            foreach ($deptChild as $value) {
                array_push($data, $value->id);
                $data = \Categories::getArrayChild($value->id, $data);
            }
        }
        return $data;
    }

    public static function getArrayChildPermission($perL){
        $deptid = isset($_SESSION['deptid']) ? $_SESSION['deptid'] : 0;
        $roleid = isset($_SESSION['roleid']) ? $_SESSION['roleid'] : 0;
        if($roleid == 1){
            $data = \Categories::getArrayChild(0);
        }else{
            if($perL->depted == 1 || $perL->depted == 2){
                $data = \Categories::getArrayChild($deptid,[$deptid]);
            } elseif ($perL->depted == 3) {
                $data = [$deptid];
            }
        }
        return $data;
    }

    public static function deleteChild($id , $data = [], $level = ''){
        $typeChild = Categories::find(["parentid = :id: AND deleted = 0", 'bind' => ['id' => $id]]);
        if($typeChild->count()){
            foreach ($typeChild as $value) {
                $value->deleted = 1;
                $value->updatedat = date('Y-m-d H:i:s');
                $value->updatedby = $_SESSION['userid'];
                if (!$value->vdUpdate()) {
                    foreach ($value->getMessages() as $message) {
                        throw new \Exception($message->getMessage());
                    }
                }
                if($value->save()){
                    array_push($data, $value->toArray());
                }else{
                    foreach ($value->getMessages() as $message) {
                        throw new \Exception($message->getMessage());
                    }
                }
                $data = \Categories::deleteChild($value->id, $data, $level);
            }
        }
        return $data;
    }

    public static function getUrlById($id = null){
        if($cat = parent::findFirst($id)){
            return WEB_URL.'/category/'.$cat->slug;
        }else{
            return null;
        }
    }

    public static function getUrl($dept = NULL, $cat = NULL){
        if($cat && $dept){
            return WEB_URL.($dept->id != 1 ? "/$dept->slug" : '' ).'/category/'.$cat->slug;
        }else{
            return '';
        }
    }

    public static function getLang($catid =  null){
        if($cat = \CategoriesLang::findFirst(['catid = :catid: AND langid = :langid:','bind' => ['catid' => $catid, 'langid' => $_SESSION['langid']]])){
            return $cat;
        }else{
            return false;
        }
    }
    
    public static function getTitleById($catid = null){
        if($cat = \CategoriesLang::findFirst(['catid = :catid: AND langid = :langid:','bind' => ['catid' => $catid, 'langid' => $_SESSION['langid']]])){
            return $cat->title;
        }else{
            return false;
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


    public static function arrayFilter(){
        return [
            ['title'],
            ['status'],
            ['createdat']
        ];
    }

    public static function findTables () {
        return ['image','title','description','createdat','slug','status'];
    }

    public static function arrayOrder () {
        return ['title','status','createdat'];
    }
    
    public static function findFilters () {
        $filters = \Categories::arrayFilter();
        return array_merge($filters[0],$filters[1],$filters[2]);
    }
}
