<?php

class FilterSetting extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("filtersetting");
    }

    public function vdUpdate($try=false){
        $validator = new \Phalcon\Validation();
        if($try){
            if(!$this->validate($validator)){
                foreach ($this->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
        }
        return $this->validate($validator);
    }

    public static function getFilterKeys($fkey = false){
        $fkeys = [
            'posts' => \Posts::findFilters(),
            'pages' => \Pages::findFilters(),
            'subjects' => \Subjects::findFilters(),
            'researches' => \Researches::findFilters(),
            'slideshows' => \Slideshows::findFilters(),
            'staffs' => \Staffs::findFilters()
        ];
        if($fkey && isset($fkeys[$fkey])){
            $groupField = \FieldGroup::findDataArrayKey($fkey);
            $perGroup = \FieldGroup::filedGroup($fkey);
            $filters = $fkeys[$fkey];
            switch ($fkey) {
                case 'asset': {
                    if($groupField !== true && !in_array('isde',$groupField)){
                        if (($key = array_search('dedate',$filters)) !== false) unset($filters[$key]);
                        if (($key = array_search('deenddate',$filters)) !== false) unset($filters[$key]);
                    }
                    break;
                }                
                default:{
                    break;
                }
            }

            foreach ($filters as $key => $filter) {
                if(in_array($filter, $perGroup)){
                    if($groupField !== true && !in_array($filter,$groupField)){
                        unset($filters[$key]);
                    }
                }
            }
            return $filters;
        }else{
            return false;
        }
        return $fkeys;
    }

    public static function getTableKeys($fkey = false){
        $fkeys = [
            'posts' => \Posts::findTables(),
            'pages' => \Pages::findTables(),
            'subjects' => \Subjects::findTables(),
            'researches' => \Researches::findTables(),
            'slideshows' => \Slideshows::findTables(),
            'staffs' => \Staffs::findTables()
        ];

        if($fkey && isset($fkeys[$fkey])){
            $groupField = \FieldGroup::findDataArrayKey($fkey);
            $perGroup = \FieldGroup::filedGroup($fkey);
            $tables = $fkeys[$fkey];
            foreach ($tables as $key => $table) {
                if(in_array($table, $perGroup)){
                    if($groupField !== true && !in_array($table,$groupField)){
                        unset($tables[$key]);
                    }
                }
            }
            return $tables;
        }else{
            return false;
        }
        return $fkeys;
    }

    public static function getOrderKeys($fkey = false){
        $fkeys = [
            'posts' => \Posts::arrayOrder(),
            'pages' => \Pages::arrayOrder(),
            'subjects' => \Subjects::arrayOrder(),
            'researches' => \Researches::arrayOrder(),
            'slideshows' => \Slideshows::arrayOrder(),
            'staffs' => \Staffs::arrayOrder()
        ];
        if($fkey && isset($fkeys[$fkey])){
            return $fkeys[$fkey];
        }else{
            return false;
        }
        return $fkeys;
    }

    public static function findFirstKey($fkey = 0){
        $userid = isset($_SESSION['userid']) ? $_SESSION['userid'] : 0;
        return parent::findFirst([
            'userid = :userid: AND deleted = 0 AND fkey = :fkey:',
            'bind' => [
                'userid' => $userid,
                'fkey' => $fkey
            ]
        ]);
    }

    public static function findNameKey($fkey){
        $data = [
            'posts' => 'Bài viết',
            'pages' => 'Trang thông tin',
            'subjects' => 'Môn học',
            'researches' => 'Hướng nghiên cứu',
            'slideshows' => 'Banners',
            'staffs' => 'Tổ chức nhân sự'
        ];
        return isset($data[$fkey]) ? $data[$fkey] : '';
    }

    public static function getBeautyRow($count){
        if($count % 3 == 0){
            return 3;
        }elseif($count % 4 == 0){
            return 4;
        }else{
            return $count % 3 == 1 ? 4 : 3;
        }
    }

    public static function checkField($fkey, $tables, $fields = false){
        if($fields){
            return ($fields === true || in_array('isde',$fields) !== false) && in_array('decosts',$tables) !== false;
        }
        return (in_array('decosts',$tables) !== false);
    }

    public static function getDataFilter($_this,$data, $filters, $a="", $except = []){
        foreach ($filters as $key => $filter) {
            foreach ($filter as $ft) {
                if(in_array($ft, $except)){
                    continue;
                }
                if(is_array($a)){
                    $w = "";
                    foreach ($a as $k => $v) {
                        if($k > 0 && is_array($v)){
                            foreach ($v as $k1 => $v1) {
                                if(array_search($ft,$v1) !== false){
                                    $w = "{$k1}.{$ft}";
                                }   
                            }
                        }
                    }
                    $w = $w ? $w : "{$a[0]}.{$ft}";
                }else{
                    $w = $a ? "{$a}.{$ft}" : $ft;
                }
                switch ($key) {
                    case 1: {
                        $sId = $_this->request->get("{$ft}Search", 'int');
                        if($sId && $sId != '0'){
                            $data = $data->andWhere("{$w} = :{$ft}:",[$ft => $sId]);
                        }
                        break;
                    }
                    case 2: {
                        $dt = $_this->helper->dateMysql($_this->request->get("{$ft}Search", ['striptags', 'trim']));
                        if($dt){
                            $data = $data->andWhere("{$w} LIKE :{$ft}:",[$ft => '%'.$dt.'%']);
                        }
                        break;
                    }
                    default: {
                        $tx = $_this->request->get("{$ft}Search", ['striptags', 'trim']);
                        if($tx){
                            $data = $data->andWhere("{$w} LIKE :{$ft}:",[$ft => '%'.$tx.'%']);
                        }
                        break;
                    }   
                }
            }
        }
        return $data;
    }

    public static function getDataOrder($_this,$data,$model,$a="",$arrays = []){
        $orders = $_this->request->get('order',['string', 'trim']);
        $orders = explode(",",$orders);
        $dirs = $_this->request->get('dir',['string', 'trim']);
        $dirs = explode(",",$dirs);
        $orderArray = [];
        foreach ($orders as $key => $value) {
            $dir = isset($dirs[$key]) ? (int)$dirs[$key] : '';
            $dir = $dir==1 ? 'asc' :( $dir==2 ? 'desc' : 0 );
            if($model && property_exists($model, $value) && $dir){
                array_push($orderArray,"{$a}.{$value} {$dir}");
            }
            foreach ($arrays as $alias => $av) {
                if($av == $value && $dir){
                    array_push($orderArray,"{$alias}.{$value} {$dir}");
                }
            }
        }
        if(count($orderArray)){
            $data = $data->orderBy(implode(",",$orderArray));
        }
        return $data;
    }

    public static function mapFilter($array1, $array2){
        $arrayRm =  array_diff($array1,$array2);
        $array3 = array_unique(array_merge($array1,$array2));
        return array_diff($array3,$arrayRm);
    }
}
