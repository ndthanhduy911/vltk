<?php
namespace Models;

class Departments extends \Phalcon\Mvc\Model
{

    public $id;

    public $code;

    public $name;

    public $slug;

    public $image;

    public $parent_id;

    public $level;

    public $status;

    public $created_at;

    public $updated_at;

    public function getSource()
    {
        return 'departments';
    }

    public static function findFirstId($id, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "id = :id: AND status = 1",
            "bind" => array('id' => $id),
            "columns" => $columns
        ]);
    }

    public static function getChilds($parent_id = null){
        $result = [];
        $data = Departments::find([
            'parent_id = :parent_id: AND status = 1',
            'columns' => 'id, code, name, parent_id, level, status, slug',
            'order' => 'name ASC',
            'bind' => [
                'parent_id' => $parent_id
            ]
        ]);
        if($data->count()){
            $result = $data;
        }else{
            $result = false;
        }
        return $result;
    }

    public static function getDepartments($datas = []){
        $data = [];
        foreach ($datas as $key => $department) {
            $data[$key] = (array)$department;
            if($data_temp = Departments::getChilds(is_array($department) ? $department['id'] : $department->id)){
                $data[$key]['child'] = Departments::getDepartments($data_temp->toArray());    
            }
        }
        return $data;
    }

    public static function getListDeptId($dept_id = null){
        $data = [(int)$dept_id];
        if($temp = Departments::getChilds($dept_id)){
            foreach ($temp as $key => $value) {
                if($temp_two = Departments::getListDeptId($value->id)){
                    $data = array_merge($data,$temp_two);
                }else{
                    array_push($data,$value->id);
                }
            }
        }
        return $data;
    }

    public static function getListDept($dept_id = null){
        $data = Departments::findFirst([
            'id = :id: AND status = 1',
            'columns'           =>  ['id','code','name','parent_id','level','slug','status'],
            'bind'              =>  ['id'    =>  $dept_id]
        ]);
        
        $data = $data ? [$data->toArray()] : [];

        if($temp = Departments::getChilds($dept_id)){
            foreach ($temp as $key => $value) {
                if($temp_two = Departments::getListDept($value->id)){
                    $data = array_merge($data,$temp_two);
                }else{
                    array_push($data,(array)$value);
                }
            }
        }

        return $data;
    }

    public static function getAllListDept(){
        $data = [];
        if($_SESSION['role'] === 1){
            $temp = Departments::find([
                "status = 1 AND level = 0"
            ]);
            foreach ($temp as $key => $value) {
                if($temp_two = Departments::getListDept($value->id)){
                    $data = array_merge($data,$temp_two);
                }else{
                    array_push($data,(array)$value);
                }
            }
            return $data;
        }

        $temp = Departments::find([
            "status = 1 AND id IN (".implode(',',$_SESSION['dept_mg']).")",
            'columns'           =>  ['id','code','name','parent_id','level','status'],
            'order'             =>  'level ASC',
        ]);
        $data = $temp->toArray();
        return $data;
        
    }

    public static function getUrlById($id = null)
    {
        if($dept = parent::findFirst($id)){
            return FRONTEND_URL.'/'.$dept->slug;
        }else{
            return null;
        }
    }

    public static function getTitleById($id = null)
    {
        if($dept = parent::findFirst($id)){
            return $dept->name;
        }else{
            return null;
        }
    }
}
