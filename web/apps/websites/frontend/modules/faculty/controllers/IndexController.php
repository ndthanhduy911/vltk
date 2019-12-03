<?php

namespace Frontend\Modules\Faculty\Controllers;

use Models\Categories;
use Models\Departments;
use Models\HomeLang;
use Models\HomeSetting;
use Models\Staff;
use Models\Partner;
use Models\Banner;

class IndexController extends \FrontendController
{
    public function indexAction(){
        $banners = [];
        $banner_info = [
            'name' => '',
            'des' => '',
            'background' => ''
        ];
        if($bannerSetting = HomeSetting::findFirst(['dept_id = 1 AND type = 1'])){
            $bannerSettingLang = HomeLang::findFirst([
                'home_id = :home_id: AND lang_id = :lang_id:',
                'bind' => [
                    'home_id' => $bannerSetting->id,
                    'lang_id' => $this->session->get('lang_id')
                ] 
            ]);
            if($bannerSettingLang){
                $banner_info['name'] = $bannerSettingLang->name;
                $banner_info['des'] = $bannerSettingLang->description;
                $banner_info['background'] = $bannerSetting->background;
            }

            $listBanner = json_decode($bannerSetting->setting);
            if($listBanner){
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
                ->leftJoin('Models\BannerLang', 'BL.banner_id = '.$npBanner.'.id','BL')
                ->where('BL.lang_id = :lang_id: AND status = 1',['lang_id' => $this->session->get('lang_id')])
                ->inWhere($npBanner.".id", $listBanner)
                ->getQuery()
                ->execute();
            }
        }
        
        $cats = [];
        if($catSetting = HomeSetting::findFirst(['dept_id = 1 AND type = 2'])){
            $listCats = json_decode($catSetting->setting);
            $npCat = Categories::getNamepace();
            $cats = $this->modelsManager->createBuilder()
            ->columns(array(
                $npCat.'.id',
                $npCat.'.slug',
                'CL.name cat_name',
            ))
            ->from($npCat)
            ->leftJoin('Models\CategoriesLang', 'CL.cat_id = '.$npCat.'.id','CL')
            ->where('CL.lang_id = :lang_id: AND status = 1 AND dept_id = 1',['lang_id' => $this->session->get('lang_id')])
            ->inWhere($npCat.".id", $listCats)
            ->getQuery()
            ->execute();

        }

        $depts = [];
        $dept_info = [
            'name' => '',
            'des' => '',
            'background' => ''
        ];
        if($deptSetting = HomeSetting::findFirst(['dept_id = 1 AND type = 3'])){
            $npDept = Departments::getNamepace();
            $deptSettingLang = HomeLang::findFirst([
                'home_id = :home_id: AND lang_id = :lang_id:',
                'bind' => [
                    'home_id' => $deptSetting->id,
                    'lang_id' => $this->session->get('lang_id')
                ] 
            ]);
            if($deptSettingLang){
                $dept_info['name'] = $deptSettingLang->name;
                $dept_info['des'] = $deptSettingLang->description;
                $dept_info['background'] = $deptSetting->background;

            }

            $depts = $this->modelsManager->createBuilder()
            ->columns(array(
                $npDept.'.id',
                $npDept.'.slug',
                $npDept.'.image',
                'DL.name dept_name',
            ))
            ->from($npDept)
            ->leftJoin('Models\DepartmentsLang', 'DL.dept_id = '.$npDept.'.id','DL')
            ->where('DL.lang_id = :lang_id: AND status = 1 AND '.$npDept.'.id != 1',['lang_id' => $this->session->get('lang_id')])
            ->getQuery()
            ->execute();
        }

        $staffs = [];
        $staff_info = [
            'name' => '',
            'des' => '',
            'background' => ''
        ];
        if($staffSetting = HomeSetting::findFirst(['dept_id = 1 AND type = 4'])){
            $staffSettingLang = HomeLang::findFirst([
                'home_id = :home_id: AND lang_id = :lang_id:',
                'bind' => [
                    'home_id' => $staffSetting->id,
                    'lang_id' => $this->session->get('lang_id')
                ] 
            ]);
            if($staffSettingLang){
                $staff_info['name'] = $staffSettingLang->name;
                $staff_info['des'] = $staffSettingLang->description;
                $staff_info['background'] = $staffSetting->background;
            }

            $listStaff = json_decode($staffSetting->setting);
            if($listStaff){
                $npStaff = Staff::getNamepace();
                $staffs = $this->modelsManager->createBuilder()
                ->columns(array(
                    $npStaff.'.id',
                    $npStaff.'.slug',
                    $npStaff.'.featured_image',
                    'SL.title title',
                    'SL.regency regency',
                    'SL.content content'
                ))
                ->from($npStaff)
                ->leftJoin('Models\StaffLang', 'SL.staff_id = '.$npStaff.'.id','SL')
                ->where('SL.lang_id = :lang_id: AND status = 1',['lang_id' => $this->session->get('lang_id')])
                ->inWhere($npStaff.".id", $listStaff)
                ->getQuery()
                ->execute();
            }
        }

        $partners = [];
        $partner_info = [
            'name' => '',
            'des' => '',
            'background' => ''
        ];
        if($partnerSetting = HomeSetting::findFirst(['dept_id = 1 AND type = 5'])){
            $partnerSettingLang = HomeLang::findFirst([
                'home_id = :home_id: AND lang_id = :lang_id:',
                'bind' => [
                    'home_id' => $partnerSetting->id,
                    'lang_id' => $this->session->get('lang_id')
                ] 
            ]);
            if($partnerSettingLang){
                $partner_info['name'] = $partnerSettingLang->name;
                $partner_info['des'] = $partnerSettingLang->description;
                $partner_info['background'] = $partnerSetting->background;
            }

            $listPartner = json_decode($partnerSetting->setting);
            if($listPartner){
                $npPartner = Partner::getNamepace();
                $partners = $this->modelsManager->createBuilder()
                ->columns(array(
                    $npPartner.'.id',
                    $npPartner.'.link',
                    $npPartner.'.featured_image',
                    'PL.title title',
                ))
                ->from($npPartner)
                ->leftJoin('Models\PartnerLang', 'PL.partner_id = '.$npPartner.'.id','PL')
                ->where('PL.lang_id = :lang_id: AND status = 1',['lang_id' => $this->session->get('lang_id')])
                ->inWhere($npPartner.".id", $listPartner)
                ->getQuery()
                ->execute();
            }
        }


        $contact_info = [
            'name' => '',
            'des' => '',
            'background' => ''
        ];
        if($contactSetting = HomeSetting::findFirst(['dept_id = 1 AND type = 6'])){
            $contactSettingLang = HomeLang::findFirst([
                'home_id = :home_id: AND lang_id = :lang_id:',
                'bind' => [
                    'home_id' => $contactSetting->id,
                    'lang_id' => $this->session->get('lang_id')
                ] 
            ]);
            if($contactSettingLang){
                $contact_info['name'] = $contactSettingLang->name;
                $contact_info['des'] = $contactSettingLang->description;
                $contact_info['background'] = $contactSetting->background;
            }
        }

        $this->view->banner_info = $banner_info;
        $this->view->banners = $banners;
        $this->view->cats = $cats;
        $this->view->dept_info = $dept_info;
        $this->view->depts = $depts;
        $this->view->staff_info = $staff_info;
        $this->view->staffs = $staffs;
        $this->view->partner_info = $partner_info;
        $this->view->partners = $partners;
        $this->view->contact_info = $contact_info;
        $this->get_js_css();
    }

    public function changelanguage($lang_id = 1){
        $this->session->set("lang_new", $lang_id);
        $this->response->setStatusCode(200, 'OK');
        $this->response->setJsonContent(['lang_id' => $lang_id]);
        return $this->response->send();
    }

    // =================================
    // FUNCTION
    // =================================
    private function get_js_css (){
        $this->assets->addJs(FRONTEND_URL.'/assets/frontend/js/modules/faculty/index.js');
    }
}