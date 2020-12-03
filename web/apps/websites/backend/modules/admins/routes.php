<?php
/***********************PostsController***********************/
$router->add(WEB_ADMIN_URI . '/posts', array(
    'module' => 'backend_admins',
    'controller' => 'posts',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/posts/:action', array(
    'module' => 'backend_admins',
    'controller' => 'posts',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/posts/:action/:int', array(
    'module' => 'backend_admins',
    'controller' => 'posts',
    'action'  => 1,
    'id' => 2
));

/***********************PagesController***********************/
$router->add(WEB_ADMIN_URI . '/pages', array(
    'module' => 'backend_admins',
    'controller' => 'pages',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/pages/:action', array(
    'module' => 'backend_admins',
    'controller' => 'pages',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/pages/:action/:int', array(
    'module' => 'backend_admins',
    'controller' => 'pages',
    'action'  => 1,
    'id' => 2
));

/***********************SlideshowsController***********************/
$router->add(WEB_ADMIN_URI . '/slideshows', array(
    'module' => 'backend_admins',
    'controller' => 'slideshows',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/slideshows/:action', array(
    'module' => 'backend_admins',
    'controller' => 'slideshows',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/slideshows/:action/:int', array(
    'module' => 'backend_admins',
    'controller' => 'slideshows',
    'action'  => 1,
    'id' => 2
));

/***********************StaffsController***********************/
$router->add(WEB_ADMIN_URI . '/staffs', array(
    'module' => 'backend_admins',
    'controller' => 'staffs',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/staffs/:action', array(
    'module' => 'backend_admins',
    'controller' => 'staffs',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/staffs/:action/:int', array(
    'module' => 'backend_admins',
    'controller' => 'staffs',
    'action'  => 1,
    'id' => 2
));

/***********************PartnersController***********************/
$router->add(WEB_ADMIN_URI . '/partners', array(
    'module' => 'backend_admins',
    'controller' => 'partners',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/partners/:action', array(
    'module' => 'backend_admins',
    'controller' => 'partners',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/partners/:action/:int', array(
    'module' => 'backend_admins',
    'controller' => 'partners',
    'action'  => 1,
    'id' => 2
));

/***********************HomeController***********************/
$router->add(WEB_ADMIN_URI . '/home', array(
    'module' => 'backend_admins',
    'controller' => 'home',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/home/:action', array(
    'module' => 'backend_admins',
    'controller' => 'home',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/home/:action/:int', array(
    'module' => 'backend_admins',
    'controller' => 'home',
    'action'  => 1,
    'id' => 2
));

/***********************DeptsController***********************/
$router->add(WEB_ADMIN_URI . '/departments/:action', array(
    'module' => 'backend_admins',
    'controller' => 'departments',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/departments/:action/:int', array(
    'module' => 'backend_admins',
    'controller' => 'departments',
    'action'  => 1,
    'id' => 2
));


/***********************CategoriesController***********************/

$router->add(WEB_ADMIN_URI . '/categories', array(
    'module' => 'backend_admins',
    'controller' => 'categories',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/categories/:action', array(
    'module' => 'backend_admins',
    'controller' => 'categories',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/categories/:action/:int', array(
    'module' => 'backend_admins',
    'controller' => 'categories',
    'action'  => 1,
    'id' => 2
));


/***********************SubjectsController***********************/
$router->add(WEB_ADMIN_URI . '/subjects', array(
    'module' => 'backend_admins',
    'controller' => 'subjects',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/subjects/:action', array(
    'module' => 'backend_admins',
    'controller' => 'subjects',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/subjects/:action/:int', array(
    'module' => 'backend_admins',
    'controller' => 'subjects',
    'action'  => 1,
    'id' => 2
));

/***********************CalendarsController***********************/
$router->add(WEB_ADMIN_URI . '/calendars', array(
    'module' => 'backend_admins',
    'controller' => 'calendars',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/calendars/:action', array(
    'module' => 'backend_admins',
    'controller' => 'calendars',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/calendars/:action/:int', array(
    'module' => 'backend_admins',
    'controller' => 'calendars',
    'action'  => 1,
    'id' => 2
));

/***********************ResearchesController***********************/
$router->add(WEB_ADMIN_URI . '/researches', array(
    'module' => 'backend_admins',
    'controller' => 'researches',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/researches/:action', array(
    'module' => 'backend_admins',
    'controller' => 'researches',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/researches/:action/:int', array(
    'module' => 'backend_admins',
    'controller' => 'researches',
    'action'  => 1,
    'id' => 2
));

/***********************ClassesController***********************/
$router->add(WEB_ADMIN_URI . '/classes', array(
    'module' => 'backend_admins',
    'controller' => 'classes',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/classes/:action', array(
    'module' => 'backend_admins',
    'controller' => 'classes',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/classes/:action/:int', array(
    'module' => 'backend_admins',
    'controller' => 'classes',
    'action'  => 1,
    'id' => 2
));


