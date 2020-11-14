<?php
use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\ExclusionIn;

class Depts extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("depts");
    }

    public function getSource()
    {
        return 'depts';
    }

    public function vdUpdate($try=false){
        $validator = new Validation();

        $validator->add(
            'name',
            new StringLength([
                "max"            => 100,
                "messageMaximum" => "Tên đơn vị/ bộ phận không được quá 100 ký tự",
            ])
        );
        //name
        $validator->add(
            'name',
            new PresenceOf([
                'message'   => 'Tên đơn vị/bộ phận không được để trống'
            ])
        );
        //dcode
        $validator->add(
            'dcode',
            new StringLength([
                "max"            => 13,
                "messageMaximum" => "Mã đơn vị/bộ phận không được quá 13 ký tự",
            ])
        );
        //dcode
        $validator->add(
            'dcode',
            new PresenceOf([
                'message'   => 'Mã đơn vị/bộ phận không được để trống'
            ])
        );
        //qhns
        $validator->add(
            'qhns',
            new StringLength([
                "max"            => 13,
                "messageMaximum" => "Mã QHNS không được quá 13 ký tự",
            ])
        );

        if($try){
            if(!$this->validate($validator)){
                foreach ($this->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
        }


        return $this->validate($validator);
    }

    public static function getChild($id , $data = [], $levelTag = '', $level = 0){
        $deptChild = Depts::find(["parentid = :id: AND deleted = 0", 'columns' => "id, name, dcode,qhns,address, description", 'bind' => ['id' => $id]]);
        if($deptChild->count()){
            $levelTag .= '&#151;' ;
            $level ++;
            foreach ($deptChild as $value) {
                $value->levelTag = $levelTag;
                $value->level = $level;
                array_push($data, $value);
                $data = Depts::getChild($value->id, $data, $levelTag, $level);
            }
        }
        return $data;
    }

    public static function getArrayChild($id , $data = []){
        $deptChild = Depts::find(["parentid = :id: AND deleted = 0", 'columns' => "id", 'bind' => ['id' => $id]]);
        if($deptChild->count()){
            foreach ($deptChild as $value) {
                array_push($data, $value->id);
                $data = Depts::getArrayChild($value->id, $data);
            }
        }
        return $data;
    }

    public static function getArrayChildPermission($perL){
        $deptid = isset($_SESSION['deptid']) ? $_SESSION['deptid'] : 0;
        $roleid = isset($_SESSION['roleid']) ? $_SESSION['roleid'] : 0;
        if($roleid == 1){
            $data = \Depts::getArrayChild(0);
        }else{
            if($perL->depted == 1 || $perL->depted == 2){
                $data = \Depts::getArrayChild($deptid,[$deptid]);
            } elseif ($perL->depted == 3) {
                $data = [$deptid];
            }
        }
        return $data;
    }

    public static function deleteChild($id , $data = [], $level = ''){
        $typeChild = Depts::find(["parentid = :id: AND deleted = 0", 'bind' => ['id' => $id]]);
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
                $data = Depts::deleteChild($value->id, $data, $level);
            }
        }
        return $data;
    }

    public static function getTreeName($id, $data = [], $level = '',$symbol = '&#151;'){
        $deptChild = Depts::find(["parentid = :id: AND deleted = 0", 'columns' => "id, name", 'bind' => ['id' => $id]]);
        if($deptChild->count()){
            $level .=  $id != 0 ? $symbol: '' ;
            foreach ($deptChild as $value) {
                $value->level = $level;
                $value->name = $value->level.' '.$value->name;
                $data[$value->id] = trim($value->name);
                $data = Depts::getTreeName($value->id, $data, $level,$symbol);
            }
        }
        return $data;
    }

    public static function getTreeNamePermission($perL,$data = [], $level = '',$symbol = '&#151;'){
        $deptType = [];
        $deptid = isset($_SESSION['deptid']) ? $_SESSION['deptid'] : 0;
        if($depts = \Depts::findFirstIdNoDelete($deptid, 'id, name')){
            if($perL->depted == 0){
                $deptType = \Depts::getTreeName(0,$data,$level,$symbol);
            }elseif($perL->depted == 1 || $perL->depted == 2 ){
                $deptType = \Depts::getTreeName($deptid, ["$depts->id" => $depts->name],$level,$symbol);
            }elseif($perL->depted == 3){
                $deptType = [$depts->id => $depts->name];
            }
        }
        return $deptType;
    }

    public static function findFirstPermission($perL,$columns = "*", $andWhere = "",$order = ""){
        if(!isset($perL->depted)){
            throw new \Exception("Lỗi truy cập phân quyền");
        }
        $deptid = isset($_SESSION['deptid']) ? $_SESSION['deptid'] : 0 ;
        if($perL->depted == 1){
            $deptArray = \Depts::getArrayChild($deptid,[$deptid]);
            $params = [
                "conditions" => "deleted = 0 AND id IN (".implode(',',$deptArray).")",
                'columns' => $columns
            ];
        }elseif($perL->depted == 2){
            $userid = isset($_SESSION['userid']) ? $_SESSION['userid'] : 0 ;
            $deptArray = \Depts::getArrayChild($deptid,[$deptid]);
            $params = [
                "conditions" => "deleted = 0 AND createdby = $userid AND id IN (".implode(',',$deptArray).")",
                'columns' => $columns
            ];
        }elseif($perL->depted == 3){
            $params = [
                "conditions" => "deleted = 0 AND id = $deptid",
                'columns' => $columns
            ];
        }else{
            $params = [
                "conditions" => "deleted = 0",
                "columns" => $columns
            ];
        }
        if(isset($andWhere[0])){
            $params['conditions'] .= " AND ".$andWhere[0];
        }
        if(isset($andWhere[1])){
            $params['bind'] = $andWhere[1];
        }

        if($order){
            $params['order'] = $order;
        }

        return parent::findFirst($params);
    }

    public static function findPermission($perL,$columns = "*", $andWhere = "", $order = ""){
        if(!isset($perL->depted)){
            throw new \Exception("Lỗi truy cập phân quyền");
        }
        $deptid = isset($_SESSION['deptid']) ? $_SESSION['deptid'] : 0 ;
        if($perL->depted == 1){
            $deptArray = \Depts::getArrayChild($deptid,[$deptid]);
            $params = [
                "conditions" => "deleted = 0 AND id IN (".implode(',',$deptArray).")",
                'columns' => $columns
            ];
        }elseif($perL->depted == 2){
            $userid = isset($_SESSION['userid']) ? $_SESSION['userid'] : 0 ;
            $deptArray = \Depts::getArrayChild($deptid,[$deptid]);
            $params = [
                "conditions" => "deleted = 0 AND createdby = $userid AND id IN (".implode(',',$deptArray).")",
                'columns' => $columns
            ];
        }elseif($perL->depted == 3){
            $params = [
                "conditions" => "deleted = 0 AND id = $deptid",
                'columns' => $columns
            ];
        }elseif($perL->depted == 0){
            $params = [
                "conditions" => "deleted = 0",
                "columns" => $columns
            ];
        }else{
            throw new \Exception("Lỗi truy cập phân quyền");
        }
        if(isset($andWhere[0])){
            $params['conditions'] .= " AND ".$andWhere[0];
        }
        if(isset($andWhere[1])){
            $params['bind'] = $andWhere[1];
        }

        if($order){
            $params['order'] = $order;
        }

        return parent::find($params);
    }

    public static function findFirstIdPermission($id,$perL,$columns = "*", $andWhere = "",$order=""){
        $params = [
            "id = :id:",
            ['id' => $id]
        ];
        if(isset($andWhere[0])){
            $params[0] .= " AND ".$andWhere[0];
        }
        if(isset($andWhere[1])){
            $params[1] = $andWhere[1];
        }

        if($order){
            $params['order'] = $order;
        }

        return \Depts::findFirstPermission($perL,$columns,$params);
    }

    public static function getUrlById($id = null)
    {
        if($dept = parent::findFirst($id)){
            return WEB_URL.'/'.$dept->slug;
        }else{
            return null;
        }
    }

    public static function getBySlug($slug = null)
    {
        if($dept = parent::findFirst(['slug = :slug: AND status = 1','bind' => ['slug' => $slug]])){
            return $dept;
        }else{
            return false;
        }
    }

    public static function getTitleById($id = null, $lang_id = 1)
    {
        if($dept = parent::findFirst($id)){
            $dept_lang = DepartmentsLang::findFirst(["lang_id = $lang_id AND dept_id = $dept->id"]);
            return $dept_lang->name;
        }else{
            return null;
        }
    }
}
