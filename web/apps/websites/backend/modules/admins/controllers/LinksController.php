<?php
namespace Backend\Modules\Admins\Controllers;

class LinksController  extends \AdminsLangCore {
    public $title = "Links";

    public $cler = "links";

    public $className = \Links::class;

    public $classNameLang = \LinksLang::class;

    public $itemsForm = \Backend\Modules\Admins\Forms\LinksForm::class;

    public $itemsLangFrom = \Backend\Modules\Admins\Forms\LinksLangForm::class;

    public $fTables = ['icon','title','createdat','link','status'];

    public $fFilters = ['title','status','createdat'];

    public $searchForm = \Backend\Modules\Admins\Forms\SearchLinksForm::class;

    public $jS = WEB_URI.'/assets/backend/js/modules/admins/links.js';

    public $itemsid = 'linkid' ;

    public function updateC($items,$itemsLangs){
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        foreach ($languages as $key => $lang) {
            if(empty($items->id) || !$itemsLang = ($this->classNameLang)::findFirst(["{$this->itemsid} = :id: AND langid = :langid:",'bind' => ['id' => (int)(!empty($items->id) ? $items->id : 0),'langid' => $lang->id]])){
                $itemsLang = new $this->classNameLang;
            }
            if($key == 0){
                $lId = $lang->id;
            }
            $itemsLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $itemsLang->langid = $lang->id;
            array_push($itemsLangs,$itemsLang);
        }


        $items->status = $this->request->getPost('status',['int']);
        $items->icon = $this->request->getPost('icon',['trim','string']);
        $items->link = $this->request->getPost('link',['trim','string']);
        $items->sort = $this->request->getPost('sort',['int']);

        return [$items, $itemsLangs];
    }

    public function ajaxgetdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted($this->cler, 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $columns = [
            'r.id',
            'r.icon',
            'r.link',
            'r.sort',
            'r.deptid',
            'r.status',
            'r.createdat',
            'rl.title',
            '(SELECT dl.title FROM DeptsLang AS dl WHERE dl.deptid = r.deptid AND dl.langid = 1) AS deptname'
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['r' => "Links"])
        ->where("r.deleted = 0")
        ->leftJoin('LinksLang', 'rl.linkid = r.id AND rl.langid = 1','rl')
        ->orderBy('r.sort ASC,rl.title ASC');

        $data = $this->master::builderPermission($data,$perL,'r');
        $data = \FilterSetting::getDataOrder($this,$data,($this->className)::findFirst(),'r',['rl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,($this->className)::arrayFilter(),['r',['rl'=>['title']]]);

        $arrayRow = [
            'u' => $this->master::checkPermission($this->cler, 'update', 1)
        ];

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $arrayRow));
    }
}