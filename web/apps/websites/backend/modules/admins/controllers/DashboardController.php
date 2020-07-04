<?php
namespace Backend\Modules\Admins\Controllers;

use Models\ConectionSystem;
use Models\Pages;
use Models\Partner;
use Models\Posts;
use Models\Staff;

class DashboardController  extends \BackendController {

    public function indexAction(){
        $dept_id = $this->session->get('dept_id');
        if($dept_id !== 1){
            $count_staff = Staff::count(["dept_id = $dept_id AND status = 1 AND deleted = 0"]);
            $count_partner = Partner::count(["dept_id = $dept_id AND status = 1 AND deleted = 0"]);
            $count_page = Pages::count(["dept_id = $dept_id AND status = 1 AND deleted = 0"]);
            $count_post = Posts::count(["dept_id = $dept_id AND status = 1 AND deleted = 0"]);
        }else{
            $count_staff = Staff::count(["status = 1 AND deleted = 0"]);
            $count_partner = Partner::count(["status = 1 AND deleted = 0"]);
            $count_page = Pages::count(["status = 1 AND deleted = 0"]);
            $count_post = Posts::count(["status = 1 AND deleted = 0"]);
        }


        $count_conection_web = ConectionSystem::countType(1,$dept_id);
        $count_conection_post = ConectionSystem::countType(2,$dept_id);
        $count_conection_calendar = ConectionSystem::countType(3,$dept_id);
        $count_conection_other = ConectionSystem::countType(4,$dept_id);
        $newest_post = [];
        $npPosts = Posts::getNamepace();
        $newest_post = $this->modelsManager->createBuilder()
        ->columns(array(
            $npPosts.'.id',
            'PL.title',
            $npPosts.'.slug',
            $npPosts.'.status',
            'PL.excerpt',
            $npPosts.'.dept_id',
            $npPosts.'.calendar',
            $npPosts.'.featured_image',
        ))
        ->from($npPosts)
        ->where("$npPosts.deleted = 0 AND $npPosts.dept_id = $dept_id")
        ->join('Models\PostsLang', 'PL.post_id = '.$npPosts.'.id AND PL.lang_id = 1','PL')
        ->orderBy($npPosts.'.calendar DESC')
        ->limit(5)
        ->getQuery()
        ->execute();

        $this->view->count_post = $count_post;
        $this->view->postModel = new Posts();
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