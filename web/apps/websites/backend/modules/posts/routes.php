<?php
/***********************PostsController***********************/

$router->add($config->application->backendUri . '/dashboard', array(
    'module' => 'backend_posts',
    'controller' => 'dashboard',
    'action' => 'index',
));

/***********************PostsController***********************/

$router->add($config->application->backendUri . '/posts', array(
    'module' => 'backend_posts',
    'controller' => 'posts',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/posts/:action', array(
    'module' => 'backend_posts',
    'controller' => 'posts',
    'action' => 1,
));
$router->add($config->application->backendUri . '/posts/:action/:int', array(
    'module' => 'backend_posts',
    'controller' => 'posts',
    'action'  => 1,
    'id' => 2
));

/***********************PagesController***********************/

$router->add($config->application->backendUri . '/pages', array(
    'module' => 'backend_posts',
    'controller' => 'pages',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/pages/:action', array(
    'module' => 'backend_posts',
    'controller' => 'pages',
    'action' => 1,
));
$router->add($config->application->backendUri . '/pages/:action/:int', array(
    'module' => 'backend_posts',
    'controller' => 'pages',
    'action'  => 1,
    'id' => 2
));

/***********************BannerController***********************/
$router->add($config->application->backendUri . '/banner', array(
    'module' => 'backend_posts',
    'controller' => 'banner',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/banner/:action', array(
    'module' => 'backend_posts',
    'controller' => 'banner',
    'action' => 1,
));
$router->add($config->application->backendUri . '/banner/:action/:int', array(
    'module' => 'backend_posts',
    'controller' => 'banner',
    'action'  => 1,
    'id' => 2
));

/***********************StaffController***********************/
$router->add($config->application->backendUri . '/staff', array(
    'module' => 'backend_posts',
    'controller' => 'staff',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/staff/:action', array(
    'module' => 'backend_posts',
    'controller' => 'staff',
    'action' => 1,
));
$router->add($config->application->backendUri . '/staff/:action/:int', array(
    'module' => 'backend_posts',
    'controller' => 'staff',
    'action'  => 1,
    'id' => 2
));

/***********************PartnerController***********************/
$router->add($config->application->backendUri . '/partner', array(
    'module' => 'backend_posts',
    'controller' => 'partner',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/partner/:action', array(
    'module' => 'backend_posts',
    'controller' => 'partner',
    'action' => 1,
));
$router->add($config->application->backendUri . '/partner/:action/:int', array(
    'module' => 'backend_posts',
    'controller' => 'partner',
    'action'  => 1,
    'id' => 2
));

/***********************HomeController***********************/
$router->add($config->application->backendUri . '/home', array(
    'module' => 'backend_posts',
    'controller' => 'home',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/home/:action', array(
    'module' => 'backend_posts',
    'controller' => 'home',
    'action' => 1,
));
$router->add($config->application->backendUri . '/home/:action/:int', array(
    'module' => 'backend_posts',
    'controller' => 'home',
    'action'  => 1,
    'id' => 2
));

/***********************DepartmentsController***********************/
$router->add($config->application->backendUri . '/departments/:action', array(
    'module' => 'backend_posts',
    'controller' => 'departments',
    'action' => 1,
));
$router->add($config->application->backendUri . '/departments/:action/:int', array(
    'module' => 'backend_posts',
    'controller' => 'departments',
    'action'  => 1,
    'id' => 2
));


/***********************CategoriesController***********************/

$router->add($config->application->backendUri . '/categories', array(
    'module' => 'backend_posts',
    'controller' => 'categories',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/categories/:action', array(
    'module' => 'backend_posts',
    'controller' => 'categories',
    'action' => 1,
));
$router->add($config->application->backendUri . '/categories/:action/:int', array(
    'module' => 'backend_posts',
    'controller' => 'categories',
    'action'  => 1,
    'id' => 2
));

/***********************MediaController***********************/

$router->add($config->application->backendUri . '/media', array(
    'module' => 'backend_posts',
    'controller' => 'media',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/media/:action', array(
    'module' => 'backend_posts',
    'controller' => 'media',
    'action' => 1,
));
$router->add($config->application->backendUri . '/media/:action/:int', array(
    'module' => 'backend_posts',
    'controller' => 'media',
    'action'  => 1,
    'id' => 2
));




