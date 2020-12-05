<?php

namespace Frontend\Modules\Dept\Controllers;

class IndexController extends \FrontendController
{
    public function indexAction(){
        $langid = $this->session->get('langid');
        $homeSetting = $this->modelsManager->createBuilder()
        ->columns(array(
            'h.id',
            'h.deptid',
            'h.catlist',
            'h.postnumber',
            'h.szedbg',
            'h.partnerbg',
            'hl.szedtitle',
            'hl.stafftitle',
            'hl.staffdes',
            'hl.partnertitle',
            'hl.partnerdes',
            'hl.contacttitle',
            'hl.contactdes'
        ))
        ->from(['h'=>'Homes'])
        ->where("h.deptid = 1")
        ->leftJoin('HomesLang', "hl.homeid = h.id AND hl.langid = $langid",'hl')
        ->limit(1)
        ->getQuery()
        ->execute();
        if(!$homeSetting->count()){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        $home = $homeSetting->toArray()[0];
        $banners = $this->modelsManager->createBuilder()
        ->columns(array(
            'b.id',
            'b.image',
            'b.link',
            'b.sort',
            'bl.name name',
            'bl.except description',
            'bl.btntext button_text'
        ))
        ->from(['b'=>'Slideshows'])
        ->where("b.deleted = 0 AND b.status = 1 AND b.deptid = 1")
        ->leftJoin('SlideshowsLang', "bl.slideshowid = b.id AND bl.langid = $langid",'bl')
        ->orderBy("b.sort = 0 ASC")
        ->getQuery()
        ->execute();

        
        $cats = [];
        if($listCats = json_decode($home['catlist'])){
            $cats = $this->modelsManager->createBuilder()
            ->columns(array(
                'c.id',
                'c.slug',
                'cl.title cat_name',
            ))
            ->from(['c'=>'Categories'])
            ->leftJoin('CategoriesLang', 'cl.catid = c.id','cl')
            ->where('cl.langid = :langid: AND status = 1 AND deptid = 1',['langid' => $langid])
            ->inWhere("c.id", $listCats)
            ->getQuery()
            ->execute();
        }

        $depts = $this->modelsManager->createBuilder()
        ->columns(array(
            'd.id',
            'd.slug',
            'd.links',
            'd.image',
            'dl.title dept_name',
        ))
        ->from(['d'=>'Depts'])
        ->leftJoin('DeptsLang', 'dl.deptid = d.id','dl')
        ->where('dl.langid = :langid: AND status = 1 AND d.id != 1',['langid' => $langid])
        ->getQuery()
        ->execute();

        $staffs = $this->modelsManager->createBuilder()
        ->columns(array(
            's.id',
            's.slug',
            's.image',
            's.dean',
            's.deptposition',
            's.email',
            's.deptid',
            'sl.title title',
            'sl.content content'
        ))
        ->from(['s'=>'Staffs'])
        ->where("s.status = 1 AND s.deleted = 0 AND (s.dean = 1 OR s.dean = 2)")
        ->leftJoin("StaffsLang", "sl.staffid = s.id AND sl.langid = $langid",'sl')
        ->orderBy("s.sort ASC, s.dean ASC")
        ->limit(3)
        ->getQuery()
        ->execute();
        

        $partners = $this->modelsManager->createBuilder()
        ->columns(array(
            'p.id',
            'p.link',
            'p.image',
            'pl.title title',
        ))
        ->from(['p'=>'Partners'])
        ->where("p.status = 1 AND p.deleted = 0 AND p.deptid = 1")
        ->leftJoin('PartnersLang', "pl.partnerid = p.id AND pl.langid = {$langid}",'pl')
        ->orderBy("p.sort ASC")
        ->getQuery()
        ->execute();
        $this->view->home = $home;
        $this->view->socials = \Socials::find(["status = 1 AND deptid = 1", "order" => "sort ASC"]);
        $this->view->banners = $banners->count() ? $banners : [] ;
        $this->view->cats = $cats;
        $this->view->depts = $depts->count() ? $depts : [];
        $this->view->staffs = $staffs->count() ? $staffs : [];
        $this->view->partners = $partners->count() ? $partners : [];
        $this->get_js_css();
        return true;
    }

    public function changelanguageAction($langid = 1){
        $this->session->set("lang_new", $langid);
        $this->response->setStatusCode(200, 'OK');
        $this->response->setJsonContent(['langid' => $langid]);
        return $this->response->send();
    }

    // =================================
    // FUNCTION
    // =================================
    private function get_js_css (){
        $this->assets->addJs(WEB_URL.'/assets/frontend/js/modules/dept/index.js');
    }
}