<?php

class Menus extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("menus");
    }

    public static function getLink($menu , $slug = ''){
        switch ((int)$menu->type) {
            case 1: {
                return ($post = \Posts::findFirstId($menu->postid)) ? WEB_URL.($slug != '/' ? '/'.$slug : '')."/news/".$post->slug : '#';
                break;
            }    
            case 2: {
                return ($page = \Pages::findFirstId($menu->pageid)) ? WEB_URL.($slug != '/' ? '/'.$slug : '').'/'.$page->slug.'.html' : '#';
                break;
            } 
            case 3: {
                return ($cat = \Categories::findFirstId($menu->catid)) ? WEB_URL.($slug != '/' ? '/'.$slug : '').'/category/'.$cat->slug : '#';
                break;
            }   
            case 4: {
                return ($dept = \Menus::findFirstId($menu->dept)) ? WEB_URL.($slug != '/' ? '/'.$slug : '').'/'.$dept->slug : '#';
                break;
            } 
            case 5: {
                return $menu->links;
                break;
            }        
            default: {
                return '#';
                break;
            }
        }
    }

    public static function getItem($menu , $slug = '', $slugNow = false){
        $item = [
            'actived' => false,
            'link' => ''
        ];

        switch ((int)$menu->type) {
            case 1: {
                $item['link'] = ($post = \Posts::findFirstId($menu->postid)) ? WEB_URL.($slug != '/' ? '/'.$slug : '')."/news/".$post->slug : '#';
                $item['actived'] = (isset($post->slug) ? $post->slug : '#4')  == $slugNow ? true : false;
                break;
            }    
            case 2: {
                $item['link'] = ($page = \Pages::findFirstId($menu->pageid)) ? WEB_URL.($slug != '/' ? '/'.$slug : '').'/'.$page->slug.'.html' : '#';
                $item['actived'] = (isset($page->slug) ? $page->slug : '#4') == $slugNow ? true : false;
                break;
            } 
            case 3: {
                $item['link'] = ($cat = \Categories::findFirstId($menu->catid)) ? WEB_URL.($slug != '/' ? '/'.$slug : '').'/category/'.$cat->slug : '#';
                $item['actived'] = (isset($cat->slug) ? $cat->slug : '#4') == $slugNow ? true : false;
                break;
            }   
            case 4: {
                $item['link'] = ($dept = \Depts::findFirstId($menu->dept)) ? ($dept->links?$dept->links:WEB_URL.($slug != '/' ? '/'.$slug : '').'/'.$dept->slug) : '#';
                $item['actived'] = (isset($dept->slug) ? $dept->slug : '#4') == $slugNow ? true : false;
                break;
            } 
            case 5: {
                $item['link'] = $menu->links;
                break;
            }        
            default: {
                $item['link'] = '#';
                break;
            }
        }

        return $item;
    }

    public static function getName($menuid, $langid = 1){
        $menulang = \MenusLang::findFirst(['langid =:langid: AND menuid = :menuid:', 'bind'=>['langid' => $langid, 'menuid' => $menuid]]);
        return $menulang ? $menulang->title : '';
    }


    public static function getArrayChild($id , $data = []){
        $deptChild = Menus::find(["parentid = :id: AND deleted = 0", 'columns' => "id", 'bind' => ['id' => $id]]);
        if($deptChild->count()){
            foreach ($deptChild as $value) {
                array_push($data, $value->id);
                $data = Menus::getArrayChild($value->id, $data);
            }
        }
        return $data;
    }

    public static function deleteChild($id , $data = [], $level = ''){
        $typeChild = Menus::find(["parentid = :id: AND deleted = 0", 'bind' => ['id' => $id]]);
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
                $data = Menus::deleteChild($value->id, $data, $level);
            }
        }
        return $data;
    }

    public static function getTreeName($id, $data = [], $level = '',$symbol = '&#151;'){
        $deptChild = Menus::find(["parentid = :id: AND deleted = 0", 'columns' => "id", 'bind' => ['id' => $id]]);
        if($deptChild->count()){
            $level .=  $id != 0 ? $symbol: '' ;
            foreach ($deptChild as $value) {
                $value->level = $level;
                $value->title = $value->level.' '.\Menus::getName($value->id);
                $data[$value->id] = trim($value->title);
                $data = Menus::getTreeName($value->id, $data, $level,$symbol);
            }
        }
        return $data;
    }

    public static function getTreeDataTable($lid, $id, $data = [], $level = '',$symbol = '&#151;'){
        $deptChild = Menus::find(["parentid = :id: AND deleted = 0 AND locationid = :lid:", 'columns' => "id,status,parentid", 'bind' => ['id' => $id,'lid' => $lid],'order' => 'sort ASC']);
        if($deptChild->count()){
            $level .=  $id != 0 ? $symbol: '' ;
            foreach ($deptChild as $value) {
                $value->level = $level;
                $value->title = $value->level.' '.\Menus::getName($value->id);
                array_push($data,['id' => $value->id,'title' => trim($value->title),'status' => $value->status,'parentid' => $value->parentid]);
                // $data[$value->id] = trim($value->title);
                $data = Menus::getTreeDataTable($lid,$value->id, $data, $level,$symbol);
            }
        }
        return $data;
    }

    public static function findParents($deptid){
        return parent::find([
            "deptid = :did: AND deleted = 0 AND parentid = 0",
            "columns" => "Menus.*, (SELECT ml.title FROM MenusLang AS ml WHERE ml.menuid = Menus.id AND ml.langid = 1) AS title",
            'bind' => [
                'did' => $deptid
            ]
        ]);
    }
}