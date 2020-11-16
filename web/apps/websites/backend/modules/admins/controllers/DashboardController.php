<?php
namespace Backend\Modules\Admins\Controllers;

class DashboardController  extends \BackendController {

    public function indexAction(){
        $deptid = $this->session->get('deptid');
        if($deptid !== 1){
            $count_staff = \Staff::count(["deptid = $deptid AND status = 1 AND deleted = 0"]);
            $count_partner = \Partner::count(["deptid = $deptid AND status = 1 AND deleted = 0"]);
            $count_page = \Pages::count(["deptid = $deptid AND status = 1 AND deleted = 0"]);
            $count_post = \Posts::count(["deptid = $deptid AND status = 1 AND deleted = 0"]);
        }else{
            $count_staff = \Staff::count(["status = 1 AND deleted = 0"]);
            $count_partner = \Partner::count(["status = 1 AND deleted = 0"]);
            $count_page = \Pages::count(["status = 1 AND deleted = 0"]);
            $count_post = \Posts::count(["status = 1 AND deleted = 0"]);
        }


        $count_conection_web = \ConectionSystem::countType(1,$deptid);
        $count_conection_post = \ConectionSystem::countType(2,$deptid);
        $count_conection_calendar = \ConectionSystem::countType(3,$deptid);
        $count_conection_other = \ConectionSystem::countType(4,$deptid);
        $newest_post = [];
        $newest_post = $this->modelsManager->createBuilder()
        ->columns(array(
            'p.id',
            'pl.title',
            'p.slug',
            'p.status',
            'pl.excerpt',
            'p.deptid',
            'p.calendar',
            'p.featured_image',
        ))
        ->from(['p' => 'Posts'])
        ->where("p.deleted = 0 AND p.deptid = {$deptid}")
        ->leftJoin('PostsLang', 'pl.postid = p.id AND pl.langid = 1','pl')
        ->orderBy('p.calendar DESC')
        ->limit(5)
        ->getQuery()
        ->execute();

        $this->view->count_post = $count_post;
        $this->view->count_staff = $count_staff;
        $this->view->count_partner = $count_partner;
        $this->view->count_page = $count_page;
        $this->view->newest_post = $newest_post;
        $this->view->count_conection_web = $count_conection_web;
        $this->view->count_conection_post = $count_conection_post;
        $this->view->count_conection_calendar = $count_conection_calendar;
        $this->view->count_conection_other = $count_conection_other;


    }
}