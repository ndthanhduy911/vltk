<?php
class Categories extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("categories");
    }

    public function getSource()
    {
        return 'categories';
    }

    public static function getChild($id , $data = [], $levelTag = '', $level = 0){
        $deptChild = Categories::find(["parentid = :id: AND deleted = 0", 'columns' => "id, id", 'bind' => ['id' => $id]]);
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
        $deptChild = Categories::find(["parentid = :id: AND deleted = 0", 'columns' => "id", 'bind' => ['id' => $id]]);
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

    public static function getTreeName($id, $data = [], $level = '',$symbol = '&#151;'){
        $deptChild = \Categories::find(["parentid = :id: AND deleted = 0", 'columns' => "id, name", 'bind' => ['id' => $id]]);
        if($deptChild->count()){
            $level .=  $id != 0 ? $symbol: '' ;
            foreach ($deptChild as $value) {
                $value->level = $level;
                $value->name = $value->level.' '.$value->name;
                $data[$value->id] = trim($value->name);
                $data = \Categories::getTreeName($value->id, $data, $level,$symbol);
            }
        }
        return $data;
    }

    public static function getTreeNamePermission($perL,$data = [], $level = '',$symbol = '&#151;'){
        $deptType = [];
        $deptid = isset($_SESSION['deptid']) ? $_SESSION['deptid'] : 0;
        if($depts = \Categories::findFirstIdNoDelete($deptid, 'id, name')){
            if($perL->depted == 0){
                $deptType = \Categories::getTreeName(0,$data,$level,$symbol);
            }elseif($perL->depted == 1 || $perL->depted == 2 ){
                $deptType = \Categories::getTreeName($deptid, ["$depts->id" => $depts->name],$level,$symbol);
            }elseif($perL->depted == 3){
                $deptType = [$depts->id => $depts->name];
            }
        }
        return $deptType;
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
            return $cat->name;
        }else{
            return false;
        }
    }
}
