<?php
namespace Backend\Modules\Admins\Controllers;

class PostsController  extends \AdminsLangCore {
    public $title = "Bài viết";

    public $cler = "posts";

    public $className = \Posts::class;

    public $classNameLang = \PostsLang::class;

    public $itemsForm = \Backend\Modules\Admins\Forms\PostsForm::class;

    public $itemsLangFrom = \Backend\Modules\Admins\Forms\PostsLangForm::class;

    public $fTables = ['image','title','excerpt','catid','createdby','calendar','slug','status'];

    public $fFilters = ['title','catid','status','calendar'];

    public $searchForm = \Backend\Modules\Admins\Forms\SearchPostsForm::class;

    public $jS = WEB_URI.'/assets/backend/js/modules/admins/posts.js';

    public $itemsid = 'postid' ;

    public function viewC($items){
        if(!empty($items->id)){
            $items->calendar = $this->helper->dateVn($items->calendar,'d/m/Y H:i');
        }else{
            $items->calendar = date('d/m/Y H:i');
        }
        return $items;
    }

    public function updateC($items,$itemsLangs){
        $languages = \Language::find(['status = 1']);
        $pTitle = $this->request->getPost('title',['string','trim']);
        $pContent = $this->request->getPost('content',['trim']);
        $pExcerpt = $this->request->getPost('excerpt',['string','trim']);
        foreach ($languages as $key => $lang) {
            if(empty($items->id) || !$itemsLang = ($this->classNameLang)::findFirst(["postid = :id: AND langid = :langid:",'bind' => ['id' => (!empty($items->id) ? $items->id : 0),'langid' => $lang->id]])){
                $itemsLang = new \PostsLang();
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
        $items->catid = $this->request->getPost('catid',['int']);
        $items->status = $this->request->getPost('status',['int']);
        $items->slug = $plug ? $plug : $this->helper->slugify($pTitle[1]);
        $items->calendar = $this->helper->dateMysql($this->request->getPost('calendar', ['string', 'trim']),'Y-m-d H:i:s');
        $items->image = $this->request->getPost('image',['trim','string']);

        if($this->className::findFirst(['slug = :slug: AND id != :id:','bind' => ['slug' => $items->slug,'id' => (!empty($items->id) ? $items->id : 0)]])){
            $items->slug .= strtotime('now');
        }

        if(!\Categories::findFirstId($items->catid)){
            $data['error'] = ["Chuyên mục không tồn tại"];
            $this->helper->responseJson($this, $data);
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
            'p.catid',
            'p.status',
            'p.image',
            'p.createdby',
            'p.deptid',
            'p.calendar',
            'p.createdat',
            'pl.title',
            'pl.content',
            'pl.excerpt',
            'u.fullname createdby',
            'c.title catname',
            'd.slug dslug',
            '(SELECT dl.title FROM DeptsLang AS dl WHERE dl.deptid = p.deptid AND dl.langid = 1) AS deptname',
        ];

        $data = $this->modelsManager->createBuilder()
        ->columns($columns)
        ->from(['p' => "Posts"])
        ->where("p.deleted = 0")
        ->leftJoin('User', 'u.id = p.createdby','u')
        ->leftJoin('CategoriesLang', 'c.catid = p.catid AND c.langid = 1','c')
        ->leftJoin('PostsLang', 'pl.postid = p.id AND pl.langid = 1','pl')
        ->leftJoin('Depts', 'd.id = p.deptid','d')
        ->orderBy('p.deptid ASC, p.calendar DESC');

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