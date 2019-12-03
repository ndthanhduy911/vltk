<?php

namespace Frontend\Modules\Dept\Controllers;
use Models\Categories;
use Models\Posts;

class CategoriesController extends \DeptfrontendController
{
    public function indexAction($params = null){
        $lang_id = $this->session->get('lang_id');
        $slug = $this->helper->slugify($params);
        $category = Categories::findFirst(['slug = :slug: AND status = 1', 'bind' => ['slug' => $slug]]);

        if($category){
            $current_page = (int)$this->request->get('page');

            $npPosts = Posts::getNamepace();
            $posts = $this->modelsManager->createBuilder()
            ->columns(array(
                $npPosts.'.id',
                'PL.title',
                $npPosts.'.slug',
                $npPosts.'.cat_id',
                'PL.content',
                $npPosts.'.status',
                'PL.excerpt',
                $npPosts.'.dept_id',
                $npPosts.'.created_at',
                $npPosts.'.calendar',
                $npPosts.'.featured_image',
                'DL.name dept_name',
                'D.slug dept_slug',
                'U.name author_name',
                'C.name cat_name',
            ))
            ->from($npPosts)
            ->join('Models\Departments', 'D.id = '.$npPosts.'.dept_id','D')
            ->join('Models\DepartmentsLang', "DL.dept_id = $npPosts.dept_id AND DL.lang_id = $lang_id",'DL')
            ->join('Models\Users', 'U.id = '.$npPosts.'.author','U')
            ->join('Models\CategoriesLang', "C.cat_id = $npPosts.cat_id AND C.lang_id = $lang_id",'C')
            ->join('Models\PostsLang', "PL.post_id = $npPosts.id AND PL.lang_id = $lang_id",'PL')
            ->orderBy("$npPosts.calendar DESC")
            ->where("$npPosts.deleted = 0 AND $npPosts.status = 1 AND $npPosts.cat_id = ".$category->id);
            
            $post_count = $posts->getQuery()
            ->execute()
            ->count();

            $posts = $posts->limit(10)
            ->offset(10 * ($current_page > 0 ? ($current_page - 1) : 0))
            ->getQuery()
            ->execute();

            $paging = $this->helper->getPaging($post_count, $current_page);
            $this->view->title = Categories::getTitleById($category->id);
            $this->view->posts = $posts;
            $this->view->paging = $paging;
            $this->view->pick('templates/blog');           
        }else{
            $this->view->title = '404';
            $this->view->pick('templates/404');
        }
    }
}