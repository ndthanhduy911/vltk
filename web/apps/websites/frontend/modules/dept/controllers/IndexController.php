<?php

namespace Frontend\Modules\Dept\Controllers;

use Models\Categories;
use Models\Departments;
use Models\Home;
use Models\Staff;
use Models\Partner;
use Models\Banner;
use Models\DepartmentsLang;
use Models\Link;
use Models\Social;

class IndexController extends \FrontendController
{
    public function indexAction(){
        $lang_id = $this->session->get('lang_id');
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
            'HL.staff_des staff_des',
            'HL.partner_title partner_title',
            'HL.partner_des partner_des',
            'HL.contact_title contact_title',
            'HL.contact_des contact_des'
        ))
        ->from($npHome)
        ->where("$npHome.dept_id = 1")
        ->leftJoin('Models\HomeLang', "HL.home_id = $npHome.id AND HL.lang_id = $lang_id",'HL')
        ->limit(1)
        ->getQuery()
        ->execute();

        $this->view->slug = '';
        $this->view->dept_id = 1;
        $this->view->dept = Departments::findFirstId(1);
        $this->view->dept_lang = DepartmentsLang::findFirst(['dept_id = :dept_id: AND lang_id = :lang_id:','bind' => ['dept_id' => 1, 'lang_id' => $lang_id]]);
        if(!$homeSetting->count()){
            $this->view->title = '404';
            return $this->view->pick('templates/404');
        }

        $home = $homeSetting->toArray()[0];
        $npBanner = Banner::getNamepace();
        $banners = $this->modelsManager->createBuilder()
        ->columns(array(
            $npBanner.'.id',
            $npBanner.'.image',
            $npBanner.'.button_link',
            $npBanner.'.sort',
            'BL.name name',
            'BL.description description',
            'BL.button_text button_text'
        ))
        ->from($npBanner)
        ->where("$npBanner.deleted = 0 AND $npBanner.status = 1 AND $npBanner.dept_id = 1")
        ->leftJoin('Models\BannerLang', "BL.banner_id = $npBanner.id AND BL.lang_id = $lang_id",'BL')
        ->orderBy("$npBanner.sort = 0 ASC")
        ->getQuery()
        ->execute();

        
        $cats = [];
        if($listCats = json_decode($home['cat_list'])){
            $npCat = Categories::getNamepace();
            $cats = $this->modelsManager->createBuilder()
            ->columns(array(
                $npCat.'.id',
                $npCat.'.slug',
                'CL.name cat_name',
            ))
            ->from($npCat)
            ->leftJoin('Models\CategoriesLang', 'CL.cat_id = '.$npCat.'.id','CL')
            ->where('CL.lang_id = :lang_id: AND status = 1 AND dept_id = 1',['lang_id' => $lang_id])
            ->inWhere($npCat.".id", $listCats)
            ->getQuery()
            ->execute();
        }

        $npDept = Departments::getNamepace();
        $depts = $this->modelsManager->createBuilder()
        ->columns(array(
            $npDept.'.id',
            $npDept.'.slug',
            $npDept.'.image',
            'DL.name dept_name',
        ))
        ->from($npDept)
        ->leftJoin('Models\DepartmentsLang', 'DL.dept_id = '.$npDept.'.id','DL')
        ->where('DL.lang_id = :lang_id: AND status = 1 AND '.$npDept.'.id != 1',['lang_id' => $lang_id])
        ->getQuery()
        ->execute();

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
        ->where("$npStaff.status = 1 AND $npStaff.deleted = 0 AND ($npStaff.dean = 1 OR $npStaff.dean = 2)")
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
        ->where("$npPartner.status = 1 AND $npPartner.deleted = 0 AND $npPartner.dept_id = 1")
        ->leftJoin('Models\PartnerLang', "PL.partner_id = $npPartner.id AND PL.lang_id = {$lang_id}",'PL')
        ->orderBy("$npPartner.sort ASC")
        ->getQuery()
        ->execute();
        
        $this->view->home = $home;
        $this->view->socials = Social::find(["status = 1 AND dept_id = 1", "order" => "sort ASC"]);
        $this->view->banners = $banners->count() ? $banners : [] ;
        $this->view->cats = $cats;
        $this->view->depts = $depts->count() ? $depts : [];
        $this->view->staffs = $staffs->count() ? $staffs : [];
        $this->view->partners = $partners->count() ? $partners : [];
        $this->get_js_css();
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
        $this->assets->addJs(FRONTEND_URL.'/assets/frontend/js/modules/dept/index.js');
    }
}