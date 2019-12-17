<?php

namespace Frontend\Modules\Dept\Controllers;
use Models\Categories;
use Models\Departments;
use Models\DepartmentsLang;
use Models\HomeLang;
use Models\HomeSetting;
use Models\Staff;
use Models\Partner;
use Models\Banner;

class DeptController extends \FrontendController
{
    public function indexAction($slug = null){

        $slug = $this->helper->slugify($slug);
        $dept_id = ($dept = Departments::getBySlug($slug)) ? $dept->id : 0;
        $lang_id = $this->session->get('lang_id');

        if(!$dept_id){
            $this->view->title = '404';
            $this->view->slug = "";
            $this->view->dept_id = 1;
            $this->view->dept = Departments::findFrist(1);
            $this->view->dept_lang = DepartmentsLang::findFirst(['dept_id = :dept_id: AND lang_id = :lang_id:','bind' => ['dept_id' => 1, 'lang_id' => $lang_id]]);
            return $this->view->pick('templates/404');
        }

        $this->view->slug = $slug;
        $this->view->dept_id = $dept_id;
        $this->view->dept = $dept;
        $this->view->dept_lang = DepartmentsLang::findFirst(['dept_id = :dept_id: AND lang_id = :lang_id:','bind' => ['dept_id' => $dept_id, 'lang_id' => $lang_id]]);


        $npHome = Home::getNamepace();
        $homeSetting = $this->modelsManager->createBuilder()
        ->columns(array(
            $npHome.'.id',
            $npHome.'.dept_id',
            $npHome.'.cat_list',
            $npHome.'.post_number',
            $npHome.'.specialized_bg',
            $npHome.'.partner_bg',
            'HL.specialized_title specialized_title',
            'HL.staff_title staff_title',
            'HL.staff_des partner_title',
            'HL.partner_des partner_des',
            'HL.contact_title contact_title',
            'HL.contact_des contact_des'
        ))
        ->from($npHome)
        ->where("$npHome.dept_id = $dept_id")
        ->leftJoin('Models\HomeLang', "HL.home_id = $npHome.id AND HL.lang_id = $lang_id",'HL')
        ->limit(1)
        ->getQuery()
        ->execute();

        if(!$homeSetting->count()){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }
        $home = $homeSetting->toArray()[0];

        $banners = [];
        $npBanner = Banner::getNamepace();
        $banners = $this->modelsManager->createBuilder()
        ->columns(array(
            $npBanner.'.id',
            $npBanner.'.image',
            $npBanner.'.button_link',
            'BL.name name',
            'BL.description description',
            'BL.button_text button_text'
        ))
        ->from($npBanner)
        ->where("$npBanner.status = 1 AND $npBanner.deleted = 0 AND $npBanner.dept_id = $dept_id")
        ->leftJoin('Models\BannerLang', "BL.banner_id = $npBanner.id AND BL.lang_id = $lang_id",'BL')
        ->getQuery()
        ->execute();
        
        $cats = [];
        $listCats = json_decode($home['cat_list']);
        if($listCats){
            $npCat = Categories::getNamepace();
            $cats = $this->modelsManager->createBuilder()
            ->columns(array(
                $npCat.'.id',
                $npCat.'.slug',
                'CL.name cat_name',
            ))
            ->from($npCat)
            ->leftJoin('Models\CategoriesLang', "CL.cat_id = $npCat.id AND CL.lang_id = $lang_id",'CL')
            ->where("$npCat.status = 1 AND $npCat.dept_id = $dept_id")
            ->inWhere($npCat.".id", $listCats)
            ->getQuery()
            ->execute();
        }


        $npStaff = Staff::getNamepace();
        $staffs = $this->modelsManager->createBuilder()
        ->columns(array(
            $npStaff.'.id',
            $npStaff.'.slug',
            $npStaff.'.featured_image',
            $npStaff.'.dean',
            $npStaff.'.dept_position',
            $npStaff.'.email',
            $npStaff.'.dept_id',
            'SL.title title',
            'SL.content content'
        ))
        ->from($npStaff)
        ->where("$npStaff.dept_id = $dept_id AND $npStaff.status = 1 AND $npStaff.deleted = 0 AND ($npStaff.dept_position = 1 OR $npStaff.dept_position = 2)")
        ->leftJoin("Models\StaffLang", "SL.staff_id = $npStaff.id AND SL.lang_id = $lang_id",'SL')
        ->orderBy("$npStaff.dean ASC")
        ->limit(3)
        ->getQuery()
        ->execute();
        

        $npPartner = Partner::getNamepace();
        $partners = $this->modelsManager->createBuilder()
        ->columns(array(
            $npPartner.'.id',
            $npPartner.'.link',
            $npPartner.'.featured_image',
            'PL.title title',
        ))
        ->from($npPartner)
        ->where("$npPartner.status = 1 AND $npPartner.deleted = 0 AND $npPartner.dept_id = $dept_id")
        ->leftJoin('Models\PartnerLang', "PL.partner_id = $npPartner.id AND PL.lang_id = $lang_id",'PL')
        ->getQuery()
        ->execute();
        
        
        $this->view->home = $home;
        $this->view->banners = $banners;
        $this->view->cats = $cats;
        $this->view->staffs = $staffs;
        $this->view->partners = $partners;
        $this->get_js_css();
    }

    // =================================
    // FUNCTION
    // =================================
    private function get_js_css (){
        $this->assets->addJs(FRONTEND_URL.'/assets/frontend/js/modules/dept/index.js');
    }
}