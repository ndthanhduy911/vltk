<?php

namespace Frontend\Modules\Dept\Controllers;

class IndexController extends \FrontendController
{
    public function indexAction(){
        $lang_id = $this->session->get('lang_id');
        $homeSetting = $this->modelsManager->createBuilder()
        ->columns(array(
            'h.id',
            'h.dept_id',
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
        ->where("h.dept_id = 1")
        ->leftJoin('HomeLang', "hl.home_id = h.id AND hl.lang_id = $lang_id",'hl')
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
        ->where("b.deleted = 0 AND b.status = 1 AND b.dept_id = 1")
        ->leftJoin('BannerLang', "bl.banner_id = b.id AND bl.lang_id = $lang_id",'bl')
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
            ->leftJoin('CategoriesLang', 'cl.cat_id = c.id','cl')
            ->where('cl.lang_id = :lang_id: AND status = 1 AND dept_id = 1',['lang_id' => $lang_id])
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
        ->leftJoin('DeptsLang', 'dl.dept_id = d.id','dl')
        ->where('dl.lang_id = :lang_id: AND status = 1 AND d.id != 1',['lang_id' => $lang_id])
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
            's.dept_id',
            'sl.title title',
            'sl.content content'
        ))
        ->from(['s'=>'Staff'])
        ->where("s.status = 1 AND s.deleted = 0 AND (s.dean = 1 OR s.dean = 2)")
        ->leftJoin("StaffLang", "sl.staff_id = s.id AND sl.lang_id = $lang_id",'sl')
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
        ->where("p.status = 1 AND p.deleted = 0 AND p.dept_id = 1")
        ->leftJoin('PartnerLang', "pl.partner_id = p.id AND pl.lang_id = {$lang_id}",'pl')
        ->orderBy("p.sort ASC")
        ->getQuery()
        ->execute();
        $this->view->home = $home;
        $this->view->socials = \Social::find(["status = 1 AND dept_id = 1", "order" => "sort ASC"]);
        $this->view->banners = $banners->count() ? $banners : [] ;
        $this->view->cats = $cats;
        $this->view->depts = $depts->count() ? $depts : [];
        $this->view->staffs = $staffs->count() ? $staffs : [];
        $this->view->partners = $partners->count() ? $partners : [];
        $this->get_js_css();
        return true;
    }

    public function changelanguageAction($lang_id = 1){
        $this->session->set("lang_new", $lang_id);
        $this->response->setStatusCode(200, 'OK');
        $this->response->setJsonContent(['lang_id' => $lang_id]);
        return $this->response->send();
    }

    // =================================
    // FUNCTION
    // =================================
    private function get_js_css (){
        $this->assets->addJs(WEB_URL.'/assets/frontend/js/modules/dept/index.js');
    }
}