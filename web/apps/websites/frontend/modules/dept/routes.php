<?php
use Models\Departments;

/***********************PostsController***********************/

$router->add($config->application->frontendUri."/{dept:[a-z\-]+}/news/{post:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'index',
    'dept' => 1,
    'post' => 2,
));

$router->add($config->application->frontendUri."/{dept:[a-z\-]+}/category/{cat:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'category',
    'dept' => 1,
    'cat' => 2,
));

/***********************PagesController***********************/

$router->add($config->application->frontendUri."/{dept:[a-z\-]+}/{page:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'pages',
    'action' => 'index',
    'dept' => 1,
    'page' => 2,
));

$router->add($config->application->frontendUri."/{page:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'pages',
    'action' => 'index',
    'page' => 1,
));

$router->add($config->application->frontendUri."/category/{cat:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'category',
    'cat' => 1,
));

$router->add($config->application->frontendUri."/news/{post:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'single',
    'post' => 1,
));

$depts = Departments::find(['status = 1 AND id != 1']);
foreach ($depts as $key => $dept) {
    $router->add($config->application->frontendUri."/$dept->slug", array(
        'module' => 'frontend_dept',
        'controller' => 'dept',
        'action' => 'index'
    ));
}