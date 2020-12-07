<?php
namespace Backend\Modules\Admins\Controllers;

class PagesController  extends \AdminsLangCore {
    public $title = "Trang thông tin";

    public $cler = "pages";

    public $className = \Pages::class;

    public $classNameLang = \PagesLang::class;

    public $itemsForm = \Backend\Modules\Admins\Forms\PagesForm::class;

    public $itemsLangFrom = \Backend\Modules\Admins\Forms\PagesLangForm::class;

    public $fTables = ['image','title','excerpt','createdby','createdat','slug','status'];

    public $fFilters = ['title','status','createdat'];

    public $searchForm = \Backend\Modules\Admins\Forms\SearchPagesForm::class;

    public $jS = WEB_URI.'/assets/backend/js/modules/admins/pages.js';

    public $itemsid = 'pageid' ;

    public function updateC($items,$itemsLangs){
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pContent = $this->request->getPost('content',['trim']);
        $pExcerpt = $this->request->getPost('excerpt',['string','trim']);
        foreach ($languages as $key => $lang) {
            if(!$items->id || !$itemsLang = \PagesLang::findFirst(["pageid = :id: AND langid = :langid:",'bind' => ['id' => ($items->id ? $items->id : 0),'langid' => $lang->id]])){
                $itemsLang = new \PagesLang();
            }
            if($key == 0){
                $lId = $lang->id;
            }
            $itemsLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $itemsLang->content = !empty($pContent[$lang->id]) ? $pContent[$lang->id] : $pContent[$lId];
            $itemsLang->excerpt = !empty($pExcerpt[$lang->id]) ? $pExcerpt[$lang->id] : $pExcerpt[$lId];
            $itemsLang->langid = $lang->id;
            array_push($itemsLangs,$itemsLang);
        }

        $plug = $this->request->getPost('slug',['string','trim']);
        $items->attrid = $this->request->getPost('attrid',['int']);
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
            'p.id',
            'p.slug',
            'p.attrid',
            'p.status',
            'p.deptid',
            'p.image',
            'p.bgimage',
            'p.createdat',
            'pl.title',
            'pl.content',
            'pl.excerpt',
            'u.fullname createdby',
            'd.slug dslug',
            '(SELECT dl.title FROM DeptsLang AS dl WHERE dl.deptid = p.deptid AND dl.langid = 1) AS deptname',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['p' => "Pages"])
        ->where("p.deleted = 0")
        ->leftJoin('User', 'u.id = p.createdby','u')
        ->leftJoin('PagesLang', 'pl.pageid = p.id AND pl.langid = 1','pl')
        ->leftJoin('Depts', 'd.id = p.deptid','d')
        ->orderBy('p.deptid ASC, p.id DESC');

        $data = $this->master::builderPermission($data,$perL,'p');
        $data = \FilterSetting::getDataOrder($this,$data,($this->className)::findFirst(),'p',['pl'=>'title']);
        $data = \FilterSetting::getDataFilter($this,$data,($this->className)::arrayFilter(),['p',['pl'=>['title']]]);

        $array_row = [
            'u' => $this->master::checkPermission($this->cler, 'update', 1)
        ];

        $search = '';
        $this->helper->responseJson($this, $this->ssp->dataOutput($this, $data,$search, $array_row));
    }
}