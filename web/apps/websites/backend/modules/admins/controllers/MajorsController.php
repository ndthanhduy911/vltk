<?php
namespace Backend\Modules\Admins\Controllers;

class MajorsController  extends \AdminsLangCore {
    public $title = "Ngành học";

    public $cler = "majors";

    public $className = \Majors::class;

    public $classNameLang = \MajorsLang::class;

    public $itemsForm = \Backend\Modules\Admins\Forms\MajorsForm::class;

    public $itemsLangFrom = \Backend\Modules\Admins\Forms\MajorsLangForm::class;

    public $fTables = ['image','title','excerpt','createdby','createdat','slug','status'];

    public $fFilters = ['title','status','createdat'];

    public $searchForm = \Backend\Modules\Admins\Forms\SearchMajorsForm::class;

    public $jS = WEB_URI.'/assets/backend/js/modules/admins/majors.js';

    public $itemsid = 'majorid' ;

    public function updateC($items,$itemsLangs){
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pContent = $this->request->getPost('content',['trim']);
        $pExcerpt = $this->request->getPost('excerpt',['string','trim']);
        foreach ($languages as $key => $lang) {
            if(empty($items->id) || !$itemsLang = \MajorsLang::findFirst(["majorid = :id: AND langid = :langid:",'bind' => ['id' => (!empty($items->id) ? $items->id : 0),'langid' => $lang->id]])){
                $itemsLang = new \MajorsLang();
            }
            if($key == 0){
                $lId = $lang->id;
            }
            $itemsLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $itemsLang->excerpt = !empty($pExcerpt[$lang->id]) ? $pExcerpt[$lang->id] : $pExcerpt[$lId];
            $itemsLang->langid = $lang->id;
            array_push($itemsLangs,$itemsLang);
        }

        $plug = $this->request->getPost('slug',['string','trim']);
        $items->status = $this->request->getPost('status',['int']);
        $items->slug = $plug ? $this->helper->slugify($plug) : $this->helper->slugify($pTitle[1]);
        $items->image = $this->request->getPost('image',['trim','string']);
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
            'p.id',
            'p.slug',
            'p.status',
            'p.deptid',
            'p.image',
            'p.createdat',
            'pl.title',
            'pl.excerpt',
            'u.fullname createdby',
            'd.slug dslug',
            '(SELECT dl.title FROM DeptsLang AS dl WHERE dl.deptid = p.deptid AND dl.langid = 1) AS deptname',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['p' => "Majors"])
        ->where("p.deleted = 0")
        ->leftJoin('User', 'u.id = p.createdby','u')
        ->leftJoin('MajorsLang', 'pl.majorid = p.id AND pl.langid = 1','pl')
        ->leftJoin('Depts', 'd.id = p.deptid','d')
        ->orderBy('p.deptid ASC, p.id DESC');

        $data = $this->master::builderPermission($data,$perL,'p');
        $data = \FilterSetting::getDataOrder($this,$data,($this->className)::findFirst(),'p',['pl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,($this->className)::arrayFilter(),['p',['pl'=>['title']]]);

        $arrayRow = [
            'u' => $this->master::checkPermission($this->cler, 'update', 1)
        ];

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $arrayRow));
    }
}