<?php
namespace Backend\Modules\Admins\Controllers;

use Models\Posts;

class DashboardController  extends \BackendController {

    public function indexAction(){
        $dept_id = $this->session->get('dept_id');
        $count_post = 0;
        $count_staff = 0;
        $count_partner = 0;
        $count_page = 0;
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


    }
}