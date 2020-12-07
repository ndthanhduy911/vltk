<?php
namespace Backend\Modules\Admins\Controllers;

class SlideshowsController  extends \AdminsCore {
    public $title = "Banners";

    public $cler = "slideshows";

    public $className = \Slideshows::class;

    public $classNameLang = \SlideshowsLang::class;

    public $itemsForm = \Backend\Modules\Admins\Forms\SlideshowsForm::class;

    public $itemsLangFrom = \Backend\Modules\Admins\Forms\SlideshowsLangForm::class;

    public $fTables = ['image','title','excerpt','createdat','status'];

    public $fFilters = ['title','status','createdat'];

    public $searchForm = \Backend\Modules\Admins\Forms\SearchSlideshowsForm::class;

    public $jS = WEB_URI.'/assets/backend/js/modules/admins/slideshows.js';

    public $itemsid = 'slideshowid' ;

    public function updateC($items,$itemsLangs){
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pExcerpt = $this->request->getPost('excerpt',['string','trim']);
        foreach ($languages as $key => $lang) {
            if(!$items->id || !$itemsLang = ($this->classNameLang)::findFirst(["{$this->itemsid} = :id: AND langid = :langid:",'bind' => ['id' => (int)($items->id ? $items->id : 0),'langid' => $lang->id]])){
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
            'b.id',
            'b.deptid',
            'b.image',
            'b.link',
            'b.status',
            'b.sort',
            'b.createdat',
            'bl.title',
            'bl.excerpt',
            'd.slug dslug',
            '(SELECT dl.title FROM DeptsLang AS dl WHERE dl.deptid = b.deptid AND dl.langid = 1) AS deptname',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['b' => "Slideshows"])
        ->where("b.deleted = 0")
        ->leftJoin('SlideshowsLang', 'bl.slideshowid = b.id AND bl.langid = 1','bl')
        ->leftJoin('Depts', 'd.id = b.deptid','d')
        ->orderBy('b.deptid ASC, b.sort ASC, b.id ASC');

        $data = $this->master::builderPermission($data,$perL,'b');
        $data = \FilterSetting::getDataOrder($this,$data,($this->className)::findFirst(),'b',['bl'=>'name']);
        $data = \FilterSetting::getDataFilter($this,$data,($this->className)::arrayFilter(),['b',['bl'=>['name']]]);

        $array_row = [
            'u' => $this->master::checkPermission($this->cler, 'update', 1)
        ];

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $array_row));
    }
}