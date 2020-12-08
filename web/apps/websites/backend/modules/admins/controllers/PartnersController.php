<?php
namespace Backend\Modules\Admins\Controllers;

use PartnersLang;

class PartnersController  extends \AdminsLangCore {
    public $title = "Liên kết/ đối tác";

    public $cler = "partners";

    public $className = \Partners::class;

    public $classNameLang = PartnersLang::class;

    public $itemsForm = \Backend\Modules\Admins\Forms\PartnersForm::class;

    public $itemsLangFrom = \Backend\Modules\Admins\Forms\PartnersLangForm::class;

    public $fTables = ['image','title','excerpt','createdat','link','status'];

    public $fFilters = ['title','status','createdat'];

    public $searchForm = \Backend\Modules\Admins\Forms\SearchPartnersForm::class;

    public $jS = WEB_URI.'/assets/backend/js/modules/admins/partners.js';

    public $itemsid = 'partnerid' ;

    public function updateC($items,$itemsLangs){
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pExcerpt = $this->request->getPost('excerpt',['string','trim']);
        foreach ($languages as $key => $lang) {
            if(empty($items->id) || !$itemsLang = ($this->classNameLang)::findFirst(["{$this->itemsid} = :id: AND langid = :langid:",'bind' => ['id' => (int)(!empty($items->id) ? $items->id : 0),'langid' => $lang->id]])){
                $itemsLang = new $this->classNameLang;
            }
            if($key == 0){
                $lId = $lang->id;
            }
            $itemsLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $itemsLang->excerpt = !empty($pExcerpt[$lang->id]) ? $pExcerpt[$lang->id] : $pExcerpt[$lId];
            $itemsLang->langid = $lang->id;
            array_push($itemsLangs,$itemsLang);
        }

        $items->status = $this->request->getPost('status',['int']);
        $items->image = $this->request->getPost('image',['trim','string']);
        $items->link = $this->request->getPost('link',['trim','string']);
        $items->sort = $this->request->getPost('sort',['int']);
        $items->image = $this->request->getPost('image',['trim','string']);
        return [$items, $itemsLangs];
    }

    public function ajaxgetdataAction(){
        if (!$this->request->isAjax() || !$perL = $this->master::checkPermissionDepted($this->cler, 'index')) {
            $this->helper->responseJson($this, ["error" => "Truy cập không được phép"]);
        }
        $columns = [
            's.id',
            's.link',
            's.image',
            's.sort',
            's.deptid',
            's.createdat',
            's.status',
            'sl.title',
            'sl.excerpt',
            'd.slug dslug',
            '(SELECT dl.title FROM DeptsLang AS dl WHERE dl.deptid = s.deptid AND dl.langid = 1) AS deptname',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['s' => "Partners"])
        ->where("s.deleted = 0")
        ->leftJoin('PartnersLang', 'sl.partnerid = s.id AND sl.langid = 1','sl')
        ->leftJoin('Depts', 'd.id = s.deptid','d')
        ->orderBy('s.deptid ASC,s.id DESC');

        $data = $this->master::builderPermission($data,$perL,'s');
        $data = \FilterSetting::getDataOrder($this,$data,($this->className)::findFirst(),'s',['sl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,($this->className)::arrayFilter(),['s',['sl'=>['title']]]);

        $array_row = [
            'u' => $this->master::checkPermission($this->cler, 'update', 1)
        ];

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $array_row));
    }
}