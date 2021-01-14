<?php
namespace Backend\Modules\Admins\Controllers;

class StaffsController  extends \AdminsLangCore {
    public $title = "Hướng nghiên cứu";

    public $cler = "staffs";

    public $className = \Staffs::class;

    public $classNameLang = \StaffsLang::class;

    public $itemsForm = \Backend\Modules\Admins\Forms\StaffsForm::class;

    public $itemsLangFrom = \Backend\Modules\Admins\Forms\StaffsLangForm::class;

    public $fTables = ['image','title','email','dean','deptposition','createdat','slug','status'];

    public $fFilters = ['title','email','status','createdat'];

    public $searchForm = \Backend\Modules\Admins\Forms\SearchStaffsForm::class;

    public $jS = WEB_URI.'/assets/backend/js/modules/admins/staffs.js';

    public $itemsid = 'staffid' ;

    public function updateC($items,$itemsLangs){
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pContent = $this->request->getPost('content',['trim']);
        $deptid = $this->session->get('deptid');
        foreach ($languages as $key => $lang) {
            if(empty($items->id) || !$itemsLang = ($this->classNameLang)::findFirst(["{$this->itemsid} = :id: AND langid = :langid:",'bind' => ['id' => (int)(!empty($items->id) ? $items->id : 0),'langid' => $lang->id]])){
                $itemsLang = new $this->classNameLang;
            }
            if($key == 0){
                $lId = $lang->id;
            }
            $itemsLang->title = !empty($pTitle[$lang->id]) ? $pTitle[$lang->id] : $pTitle[$lId];
            $itemsLang->content = !empty($pContent[$lang->id]) ? $pContent[$lang->id] : $pContent[$lId];
            $itemsLang->langid = $lang->id;
            array_push($itemsLangs,$itemsLang);
        }

        if($deptid == 1){
            $items->deptid = $this->request->getPost('deptid',['int']);
            $items->dean = $this->request->getPost('dean',['int']);
        }else{
            $items->deptid = $items->deptid ? $items->deptid : $this->request->getPost('deptid',['int']);
        }
        $dsort = $this->request->getPost('sort',['int']);
        $sort = $this->request->getPost('sort',['int']);
        $plug = $this->request->getPost('slug',['string','trim']);
        $items->status = $this->request->getPost('status',['int']);
        $items->sort = $sort ? $sort : 1;
        $items->dsort = $dsort ? $dsort : 1;
        $items->deptposition = $this->request->getPost('deptposition',['int']);
        $items->email = $this->request->getPost('email',['trim','string']);
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
            's.id',
            's.slug',
            's.image',
            's.email',
            's.dean',
            's.deptposition',
            's.createdat',
            's.deptid',
            's.status',
            's.sort',
            'sl.title',
            'sl.content',
            'd.slug dslug',
            '(SELECT dl.title FROM DeptsLang AS dl WHERE dl.deptid = s.deptid AND dl.langid = 1) AS deptname',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['s' => "Staffs"])
        ->where("s.deleted = 0")
        ->leftJoin('StaffsLang', 'sl.staffid = s.id AND sl.langid = 1','sl')
        ->leftJoin('Depts', 'd.id = s.deptid','d');
        if($this->session->get('deptid') == 1){
            $data = $data->orderBy('s.sort ASC,(s.dean = 0),s.dean ASC,(s.deptposition = 0),s.deptposition ASC,s.deptid ASC');
        }else{
            $data = $data->orderBy('s.dsort ASC');
        }


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