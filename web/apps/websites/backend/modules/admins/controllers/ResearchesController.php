<?php
namespace Backend\Modules\Admins\Controllers;

class ResearchesController  extends \AdminsCore {
    public $title = "Hướng nghiên cứu";

    public $cler = "researches";

    public $className = \Researches::class;

    public $classNameLang = \ResearchesLang::class;

    public $itemsForm = \Backend\Modules\Admins\Forms\ResearchesForm::class;

    public $itemsLangFrom = \Backend\Modules\Admins\Forms\ResearchesLangForm::class;

    public $fTables = ['image','title','excerpt','createdat','slug','status'];

    public $fFilters = ['title','status','createdat'];

    public $searchForm = \Backend\Modules\Admins\Forms\SearchResearchesForm::class;

    public $jS = WEB_URI.'/assets/backend/js/modules/admins/researches.js';

    public $itemsid = 'researchid' ;

    public function updateC($items,$itemsLangs){
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pExcerpt = $this->request->getPost('excerpt',['string','trim']);
        $pContent = $this->request->getPost('content',['string','trim']);
        foreach ($languages as $key => $lang) {
            if(!$items->id || !$itemsLang = ($this->classNameLang)::findFirst(["{$this->itemsid} = :id: AND langid = :langid:",'bind' => ['id' => (int)($items->id ? $items->id : 0),'langid' => $lang->id]])){
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
        $items->slug = $plug ? $plug : $this->helper->slugify($pTitle[1]);
        $items->image = $this->request->getPost('image',['trim','string']);
        $items->bgimage = $this->request->getPost('bgimage',['trim','string']);

        if($this->className::findFirst(['slug = :slug:','bind' => ['slug' => $items->slug]])){
            $items->slug .= strtotime('now');
        }

        return [$items, $itemsLangs];
    }

    public function ajaxgetdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted($this->cler, 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $columns = [
            'r.id',
            'r.slug',
            'r.status',
            'r.deptid',
            'r.createdat',
            'r.image',
            'r.bgimage',
            'rl.title',
            'rl.content',
            'rl.excerpt',
            'd.slug dslug',
            '(SELECT dl.title FROM DeptsLang AS dl WHERE dl.deptid = r.deptid AND dl.langid = 1) AS deptname'
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['r' => "Researches"])
        ->where("r.deleted = 0")
        ->leftJoin('ResearchesLang', 'rl.researchid = r.id AND rl.langid = 1','rl')
        ->leftJoin('Depts', 'd.id = r.deptid','d')
        ->orderBy('r.deptid ASC,r.id DESC');

        $data = $this->master::builderPermission($data,$perL,'r');
        $data = \FilterSetting::getDataOrder($this,$data,($this->className)::findFirst(),'r',['rl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,($this->className)::arrayFilter(),['r',['rl'=>['title']]]);

        $array_row = [
            'u' => $this->master::checkPermission($this->cler, 'update', 1)
        ];

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $array_row));
    }
}