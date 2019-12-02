<?php
use Models\Departments;
$depts = Departments::find(['status = 1 AND id != 1']);
foreach ($depts as $key => $dept) {
    $router->add($config->application->frontendUri."/$dept->slug", array(
        'module' => 'frontend_dept',
        'controller' => 'dept',
        'action' => 'index'
    ));

    $router->add($config->application->frontendUri."/$dept->slug/{page:[a-z\-]+}", array(
        'module' => 'frontend_dept',
        'controller' => 'page',
        'action' => 'index',
        'page' => 1,
    ));

    $router->add($config->application->frontendUri."/$dept->slug/news/{post:[a-z\-]+}", array(
        'module' => 'frontend_dept',
        'controller' => 'post',
        'action' => 'index',
        'post' => 1,
    ));

    $router->add($config->application->frontendUri."/$dept->slug/category/{cat:[a-z\-]+}", array(
        'module' => 'frontend_dept',
        'controller' => 'categories',
        'action' => 'index',
        'cat' => 1,
    ));
}

/***********************PostController***********************/

$router->add($config->application->frontendUri."/{page:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'pages',
    'action' => 'index',
    'page' => 1,
));

$router->add($config->application->frontendUri."/news/{post:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'single',
    'post' => 1,
));

$router->add($config->application->frontendUri."/category/{cat:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'categories',
    'action' => 'index',
    'cat' => 1,
));