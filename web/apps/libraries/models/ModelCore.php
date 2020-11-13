<?php
class ModelCore extends \Phalcon\Mvc\Model
{
    public static function findFirstId($id, $columns = "*", $where = ""){
        return parent::findFirst([
            "id = :id: $where",
            "bind" => ['id' => $id],
            "columns" => $columns
        ]);
    }

    public static function findFirstIdNoDelete($id, $columns = "*", $andWhere = "",$order = ""){
        $params = [
            "id = :id: AND deleted = 0",
            "columns" => $columns,
            "bind" => ['id' => $id]
        ];
        if(isset($andWhere[0])){
            $params[0] .= " AND ".$andWhere[0];
        }
        if(isset($andWhere[1])){
            $params['bind'] = array_merge($params['bind'],$andWhere[1]);
        }

        if($order){
            $params['order'] = $order;
        }

        return parent::findFirst($params);
    }

    public static function findNoDelete($columns = "*", $andWhere = "",$order = ""){
        $params = [
            "deleted = 0",
            "columns" => $columns
        ];
        if(isset($andWhere[0])){
            $params[0] .= " AND ".$andWhere[0];
        }
        if(isset($andWhere[1])){
            $params['bind'] = $andWhere[1];
        }

        if($order){
            $params['order'] = $order;
        }

        return parent::find($params);
    }

    public static function isExistData($model, $column, $value, $idCol = null, $idVal = null){
        if (!$idVal) {
            $data = $model::findFirst([
                'conditions' => "{$column} = :col:",
                'bind' => ['col' => $value]
            ]);
        }else{
            $data = $model::findFirst([
                'conditions' => "{$column} = :col: AND {$idCol} != :id:",
                'bind' => ['col' => $value, 'id' => $idVal]
            ]);
        }
        if ($data) {
            return $data;
        }else{
            return false;
        }
    }

    public function deleteSafety($userid){
        $this->deleted = 1;
        $this->updatedat = date('Y-m-d H:i:s');
        $this->updatedby = $userid;
        if (!$this->save()) {
            foreach ($this->getMessages() as $message) {
                return $message;
            }
        }
        return true;
    }

    public static function findFirstPermission($perL,$columns = "*", $andWhere = "",$order = ""){
        if(!isset($perL->depted)){
            throw new \Exception("Lỗi truy cập phân quyền");
        }
        $deptid = isset($_SESSION['deptid']) ? $_SESSION['deptid'] : 0 ;
        if($perL->depted == 1){
            $deptArray = \Depts::getArrayChild($deptid,[$deptid]);
            $params = [
                "deleted = 0 AND deptid IN (".implode(',',$deptArray).")",
                'columns' => $columns
            ];
        }elseif($perL->depted == 2){
            $userid = isset($_SESSION['userid']) ? $_SESSION['userid'] : 0 ;
            $deptArray = \Depts::getArrayChild($deptid,[$deptid]);
            $params = [
                "deleted = 0 AND createdby = $userid AND deptid IN (".implode(',',$deptArray).")",
                'columns' => $columns
            ];
        }elseif($perL->depted == 3){
            $params = [
                "deleted = 0 AND deptid = $deptid",
                'columns' => $columns
            ];
        }else{
            $params = [
                "deleted = 0",
                "columns" => $columns
            ];
        }
        if(isset($andWhere[0])){
            $params[0] .= " AND ".$andWhere[0];
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
                "deleted = 0 AND deptid IN (".implode(',',$deptArray).")",
                'columns' => $columns
            ];
        }elseif($perL->depted == 2){
            $userid = isset($_SESSION['userid']) ? $_SESSION['userid'] : 0 ;
            $deptArray = \Depts::getArrayChild($deptid,[$deptid]);
            $params = [
                "deleted = 0 AND createdby = $userid AND deptid IN (".implode(',',$deptArray).")",
                'columns' => $columns
            ];
        }elseif($perL->depted == 3){
            $params = [
                "deleted = 0 AND deptid = $deptid",
                'columns' => $columns
            ];
        }elseif($perL->depted == 0){
            $params = [
                "deleted = 0",
                "columns" => $columns
            ];
        }else{
            throw new \Exception("Lỗi truy cập phân quyền");
        }
        if(isset($andWhere[0])){
            $params[0] .= " AND ".$andWhere[0];
        }
        if(isset($andWhere[1])){
            $params['bind'] = $andWhere[1];
        }

        if($order){
            $params['order'] = $order;
        }

        return parent::find($params);
    }

    public static function findFirstIdPermission($id,$perL,$columns = "*", $andWhere = "",$order = ""){
        if(!isset($perL->depted)){
            throw new \Exception("Lỗi truy cập phân quyền");
        }
        $deptid = isset($_SESSION['deptid']) ? $_SESSION['deptid'] : 0 ;
        if($perL->depted == 1){
            $deptArray = \Depts::getArrayChild($deptid,[$deptid]);
            $params = [
                "id = :id: AND deleted = 0 AND deptid IN (".implode(',',$deptArray).")",
                'bind' => ['id' => $id],
                'columns' => $columns
            ];
        }elseif($perL->depted == 2){
            $userid = isset($_SESSION['userid']) ? $_SESSION['userid'] : 0 ;
            $deptArray = \Depts::getArrayChild($deptid,[$deptid]);
            $params = [
                "id = :id: AND deleted = 0 AND createdby = $userid AND deptid IN (".implode(',',$deptArray).")",
                'bind' => ['id' => $id],
                'columns' => $columns
            ];
        }elseif($perL->depted == 3){
            $params = [
                "id = :id: AND deleted = 0 AND deptid = $deptid",
                'bind' => ['id' => $id],
                'columns' => $columns
            ];
        }else{
            $params = [
                "id = :id: AND deleted = 0",
                'bind' => ['id' => $id],
                "columns" => $columns
            ];
        }
        if(isset($andWhere[0])){
            $params[0] .= " AND ".$andWhere[0];
        }
        if(isset($andWhere[1])){
            $params['bind'] = array_merge($params['bind'],$andWhere[1]);
        }

        if($order){
            $params['order'] = $order;
        }

        return parent::findFirst($params);
    }

    public static function truncate($class){
        $table = $class->getSource();
        $query = "TRUNCATE TABLE `{$table}`";
        $result = $class->getDi()->getShared('db')->query($query);
        if(!$result){
            throw new \Exception("TRUNCATE TABLE `{$table}` thất bại");
           return false ;
        }
        return true;
    }
}