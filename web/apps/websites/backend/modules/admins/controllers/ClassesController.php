<?php
namespace Backend\Modules\Admins\Controllers;

class ClassesController  extends \AdminsLangCore {

    public $title = "Danh sách lớp";

    public $cler = "classes";

    public $className = \Classes::class;

    public $classNameLang = \ClassesLang::class;

    public $itemsForm = \Backend\Modules\Admins\Forms\ClassesForm::class;

    public $itemsLangFrom = \Backend\Modules\Admins\Forms\ClassesLangForm::class;

    public $fTables = ['image','code','title','excerpt','createdat','slug','status'];

    public $fFilters = ['title','code','status','createdat'];

    public $searchForm = \Backend\Modules\Admins\Forms\SearchClassesForm::class;

    public $jS = WEB_URI.'/assets/backend/js/modules/admins/classes.js';

    public $itemsid = 'classid';

    public function updateC($items,$itemsLangs){
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pExcerpt = $this->request->getPost('excerpt',['string','trim']);
        $pContent = $this->request->getPost('content',['trim']);
        foreach ($languages as $key => $lang) {
            if(empty($items->id) || !$itemsLang = ($this->classNameLang)::findFirst(["{$this->itemsid} = :id: AND langid = :langid:",'bind' => ['id' => (int)(!empty($items->id) ? $items->id : 0),'langid' => $lang->id]])){
                $itemsLang = new $this->classNameLang;
            }
            if($key == 0){
                $lId = $lang->id;
            }
            $itemsLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $itemsLang->excerpt = !empty($pExcerpt[$lang->id]) ? $pExcerpt[$lang->id] : $pExcerpt[$lId];
            $itemsLang->content = !empty($pContent[$lang->id]) ? $pContent[$lang->id] : $pContent[$lId];
            $itemsLang->langid = $lang->id;
            array_push($itemsLangs,$itemsLang);
        }

        $plug = $this->request->getPost('slug',['string','trim']);
        $items->status = $this->request->getPost('status',['int']);
        $items->code = $this->request->getPost('code',['trim','string']);
        $items->slug = $plug ? $this->helper->slugify($plug) : $this->helper->slugify($pTitle[1]);
        $items->image = $this->request->getPost('image',['trim','string']);
        $items->bgimage = $this->request->getPost('bgimage',['trim','string']);

        if($this->className::findFirst(['slug = :slug: AND id != :id:','bind' => ['slug' => $items->slug,'id' => (!empty($items->id) ? $items->id : 0)]])){
            $items->slug .= strtotime('now');
        }

        return [$items, $itemsLangs];
    }

    public function ajaxgetdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted($this->cler, 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $columns = [
            's.id',
            's.slug',
            's.status',
            's.code',
            's.deptid',
            's.createdat',
            's.image',
            's.bgimage',
            'sl.title',
            'sl.content',
            'sl.excerpt',
            'd.slug dslug',
            '(SELECT dl.title FROM DeptsLang AS dl WHERE dl.deptid = s.deptid AND dl.langid = 1) AS deptname',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['s' => "Classes"])
        ->where("s.deleted = 0")
        ->leftJoin('ClassesLang', 'sl.classid = s.id AND sl.langid = 1','sl')
        ->leftJoin('Depts', 'd.id = s.deptid','d')
        ->orderBy('s.deptid ASC,s.id DESC');

        $data = $this->master::builderPermission($data,$perL,'s');
        $data = \FilterSetting::getDataOrder($this,$data,($this->className)::findFirst(),'s',['sl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,($this->className)::arrayFilter(),['s',['sl'=>['title']]]);

        $arrayRow = [
            'u' => $this->master::checkPermission($this->cler, 'update', 1)
        ];

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $arrayRow));
    }
}