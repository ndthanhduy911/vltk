<?php
namespace Backend\Modules\Dashboard\Controllers;

class IndexController extends \BackendController
{
    public function indexAction()
    {
        $title = "Bảng điều khiển";
        $deptid = $this->session->get('deptid');
        if($deptid !== 1){
            $countStaff = \Staffs::count(["deptid = {$deptid} AND status = 1 AND deleted = 0"]);
            $countPartner = \Partners::count(["deptid = {$deptid} AND status = 1 AND deleted = 0"]);
            $countPage = \Pages::count(["deptid = {$deptid} AND status = 1 AND deleted = 0"]);
            $countPost = \Posts::count(["deptid = {$deptid} AND status = 1 AND deleted = 0"]);
        }else{
            $countStaff = \Staffs::count(["status = 1 AND deleted = 0"]);
            $countPartner = \Partners::count(["status = 1 AND deleted = 0"]);
            $countPage = \Pages::count(["status = 1 AND deleted = 0"]);
            $countPost = \Posts::count(["status = 1 AND deleted = 0"]);
        }

        $countCWeb = \ConectionSystem::countType(1,$deptid);
        $countCPost = \ConectionSystem::countType(2,$deptid);
        $newestPost = [];
        $newestPost = $this->modelsManager->createBuilder()
        ->columns(array(
            'p.id',
            'pl.title',
            'p.slug',
            'p.status',
            'pl.excerpt',
            'p.deptid',
            'p.calendar',
            'p.image',
        ))
        ->from(['p' => 'Posts'])
        ->where("p.deleted = 0 AND p.deptid = {$deptid}")
        ->leftJoin('PostsLang', 'pl.postid = p.id AND pl.langid = 1','pl')
        ->orderBy('p.calendar DESC')
        ->limit(5)
        ->getQuery()
        ->execute();

        $this->view->title = $title;
        $this->view->countPost = $countPost;
        $this->view->countStaff = $countStaff;
        $this->view->countPartner = $countPartner;
        $this->view->countPage = $countPage;
        $this->view->newestPost = $newestPost;
        $this->view->countCWeb = $countCWeb;
        $this->view->countCPost = $countCPost;
        $this->view->depts = \Depts::findFirstId($deptid);
        $this->getJsCss();
    }

    // ===============================
    // API
    // ===============================

    // ===============================
    // FUNCTION
    // ===============================
    private function getJsCss (){
        // Add some local CSS resources

        // And some local JavaScript resources
        $this->assets->addJs(WEB_URL.'/assets/backend/js/modules/dashboard/index.js?v='.VS_SCRIPT);
    }
}

