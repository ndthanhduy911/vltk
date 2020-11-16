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
            'h.cat_list',
            'h.post_number',
            'h.specialized_bg',
            'h.partner_bg',
            'hl.specialized_title specialized_title',
            'hl.staff_title staff_title',
            'hl.staff_des staff_des',
            'hl.partner_title partner_title',
            'hl.partner_des partner_des',
            'hl.contact_title contact_title',
            'hl.contact_des contact_des'
        ))
        ->from(['h'=>'Home'])
        ->where("h.deptid = $dept->id")
        ->leftJoin('HomeLang', "hl.home_id = h.id AND hl.langid = $langid",'hl')
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
            'b.button_link',
            'bl.name name',
            'bl.description description',
            'bl.button_text button_text'
        ))
        ->from(['b'=>'Banner'])
        ->where("b.status = 1 AND b.deleted = 0 AND b.deptid = $dept->id")
        ->leftJoin('BannerLang', "bl.banner_id = b.id AND bl.langid = $langid",'bl')
        ->getQuery()
        ->execute();
        
        $cats = [];
        $listCats = json_decode($home['cat_list']);
        if($listCats){
            $cats = $this->modelsManager->createBuilder()
            ->columns(array(
                'c.id',
                'c.slug',
                'cl.name cat_name',
            ))
            ->from(['c'=>'Categories'])
            ->where("c.status = 1")
            ->inWhere("c.id", $listCats);
            if(!(int)$dept->post_connect) {
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
            'r.featured_image',
            'rl.title research_name',
        ))
        ->from(['r'=>'Researches'])
        ->where("r.deptid = $dept->id AND r.status = 1 AND r.deleted = 0")
        ->leftJoin('ResearchesLang', "rl.research_id = r.id AND rl.langid = $langid",'rl')
        ->getQuery()
        ->execute();


        $staffs = $this->modelsManager->createBuilder()
        ->columns(array(
            's.id',
            's.slug',
            's.featured_image',
            's.dean',
            's.dept_position',
            's.email',
            's.deptid',
            'sl.title title',
            'sl.content content'
        ))
        ->from(['s'=>'Staff'])
        ->where("s.deptid = $dept->id AND s.status = 1 AND s.deleted = 0 AND (s.dept_position = 1 OR s.dept_position = 2)")
        ->leftJoin("StaffLang", "sl.staff_id = s.id AND sl.langid = $langid",'sl')
        ->orderBy("s.dean ASC")
        ->limit(3)
        ->getQuery()
        ->execute();
        

        $partners = $this->modelsManager->createBuilder()
        ->columns(array(
            'p.id',
            'p.link',
            'p.featured_image',
            'pl.title title',
        ))
        ->from(['p' => 'Partner'])
        ->where("p.status = 1 AND p.deleted = 0 AND p.deptid = $dept->id")
        ->leftJoin('PartnerLang', "pl.partner_id = p.id AND pl.langid = $langid",'pl')
        ->getQuery()
        ->execute();
        
        
        $this->view->home = $home;
        $this->view->socials = \Social::find(["status = 1 AND deptid = $dept->id", "order" => "sort ASC"]);
        $this->view->banners = $banners;
        $this->view->cats = $cats;
        $this->view->researches = $researches;
        $this->view->staffs = $staffs;
        $this->view->partners = $partners;
        $this->view->researchModel = new \Researches();
        $this->get_js_css();
    }

    // =================================
    // FUNCTION
    // =================================
    private function get_js_css (){
        $this->assets->addJs(WEB_URL.'/assets/frontend/js/modules/dept/index.js');
    }
}