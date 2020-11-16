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
        ->where("h.deptid = 1")
        ->leftJoin('HomeLang', "hl.home_id = h.id AND hl.langid = $langid",'hl')
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
            'b.button_link',
            'b.sort',
            'bl.name name',
            'bl.description description',
            'bl.button_text button_text'
        ))
        ->from(['b'=>'Banner'])
        ->where("b.deleted = 0 AND b.status = 1 AND b.deptid = 1")
        ->leftJoin('BannerLang', "bl.banner_id = b.id AND bl.langid = $langid",'bl')
        ->orderBy("b.sort = 0 ASC")
        ->getQuery()
        ->execute();

        
        $cats = [];
        if($listCats = json_decode($home['cat_list'])){
            $cats = $this->modelsManager->createBuilder()
            ->columns(array(
                'c.id',
                'c.slug',
                'cl.name cat_name',
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
            'dl.name dept_name',
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
            's.featured_image',
            's.dean',
            's.dept_position',
            's.email',
            's.deptid',
            'sl.title title',
            'sl.content content'
        ))
        ->from(['s'=>'Staff'])
        ->where("s.status = 1 AND s.deleted = 0 AND (s.dean = 1 OR s.dean = 2)")
        ->leftJoin("StaffLang", "sl.staff_id = s.id AND sl.langid = $langid",'sl')
        ->orderBy("s.sort ASC, s.dean ASC")
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
        ->from(['p'=>'Partner'])
        ->where("p.status = 1 AND p.deleted = 0 AND p.deptid = 1")
        ->leftJoin('PartnerLang', "pl.partner_id = p.id AND pl.langid = {$langid}",'pl')
        ->orderBy("p.sort ASC")
        ->getQuery()
        ->execute();
        $this->view->home = $home;
        $this->view->socials = \Social::find(["status = 1 AND deptid = 1", "order" => "sort ASC"]);
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