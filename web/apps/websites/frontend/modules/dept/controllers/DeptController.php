<?php
namespace Frontend\Modules\Dept\Controllers;

class DeptController extends \FrontendController
{
    public function indexAction($slug = null){
        $slug = $this->helper->slugify($slug);
        $dept = $this->dispatcher->getReturnedValue();
        $langid = $this->session->get('langid');

        $homeSetting = $this->modelsManager->createBuilder()
        ->columns(array(
            'h.id',
            'h.deptid',
            'h.catlist',
            'h.postnumber',
            'h.szedbg',
            'h.partnerbg',
            'hl.szedtitle szedtitle',
            'hl.stafftitle stafftitle',
            'hl.staffdes staffdes',
            'hl.partnertitle partnertitle',
            'hl.partnerdes partnerdes',
            'hl.contacttitle contacttitle',
            'hl.contactdes contactdes'
        ))
        ->from(['h'=>'Homes'])
        ->where("h.deptid = $dept->id")
        ->leftJoin('HomesLang', "hl.homeid = h.id AND hl.langid = $langid",'hl')
        ->limit(1)
        ->getQuery()
        ->execute();

        if(!$homeSetting->count()){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        $home = $homeSetting->toArray()[0];

        $banners = [];
        $banners = $this->modelsManager->createBuilder()
        ->columns(array(
            'b.id',
            'b.image',
            'b.link',
            'bl.title',
            'bl.excerpt'
        ))
        ->from(['b'=>'Slideshows'])
        ->where("b.status = 1 AND b.deleted = 0 AND b.deptid = $dept->id")
        ->leftJoin('SlideshowsLang', "bl.slideshowid = b.id AND bl.langid = $langid",'bl')
        ->getQuery()
        ->execute();
        
        $cats = [];
        $listCats = json_decode($home['catlist']);
        if($listCats){
            $cats = $this->modelsManager->createBuilder()
            ->columns(array(
                'c.id',
                'c.slug',
                'cl.title cat_name',
            ))
            ->from(['c'=>'Categories'])
            ->where("c.status = 1")
            ->inWhere("c.id", $listCats);
            if(!(int)$dept->postconnect) {
                $cats = $cats->andWhere("c.deptid = $dept->id");
            }
            $cats = $cats->leftJoin('CategoriesLang', "cl.catid = c.id AND cl.langid = $langid",'cl')
            ->getQuery()
            ->execute();
        }

        $researches = $this->modelsManager->createBuilder()
        ->columns(array(
            'r.id',
            'r.slug',
            'r.image',
            'rl.title',
        ))
        ->from(['r'=>'Researches'])
        ->where("r.deptid = $dept->id AND r.status = 1 AND r.deleted = 0")
        ->leftJoin('ResearchesLang', "rl.researchid = r.id AND rl.langid = $langid",'rl')
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
            'sl.title',
            'sl.content'
        ))
        ->from(['s'=>'Staffs'])
        ->where("s.deptid = {$dept->id} AND s.status = 1 AND s.deleted = 0 AND (s.deptposition = 1 OR s.deptposition = 2)")
        ->leftJoin("StaffsLang", "sl.staffid = s.id AND sl.langid = {$langid}",'sl')
        ->orderBy("s.dean ASC")
        ->limit(3)
        ->getQuery()
        ->execute();

        $partners = $this->modelsManager->createBuilder()
        ->columns(array(
            'p.id',
            'p.link',
            'p.image',
            'pl.title',
        ))
        ->from(['p' => 'Partners'])
        ->where("p.status = 1 AND p.deleted = 0 AND p.deptid = {$dept->id}")
        ->leftJoin('PartnersLang', "pl.partnerid = p.id AND pl.langid = {$langid}",'pl')
        ->getQuery()
        ->execute();

        $this->view->home = $home;
        $this->view->socials = \Socials::find(["status = 1 AND deptid = $dept->id", "order" => "sort ASC"]);
        $this->view->banners = $banners;
        $this->view->cats = $cats;
        $this->view->researches = $researches;
        $this->view->staffs = $staffs;
        $this->view->partners = $partners;
        $this->get_js_css();
    }

    // =================================
    // FUNCTION
    // =================================
    private function get_js_css (){
        $this->assets->addJs(WEB_URL.'/assets/frontend/js/modules/dept/index.js');
    }
}