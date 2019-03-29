<?php

namespace Frontend\Modules\Pages\Controllers;
use Phalcon\Mvc\View;
use Models\Categories;
class PostsController extends \FrontendController
{
    public function indexAction($params = null){
        $params = $this->helper->slugify($params);
        $category = Categories::findFirst([
            "conditions" => "slug = :slug: AND status !=4",
            "bind" => array('slug' => $params),
            "columns" => 'id'
        ]);
        // var_dump($category);
        // die;
    }
}