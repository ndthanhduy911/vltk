<?php
/***********************PagesController***********************/
$router->add($config->application->frontendUri."/:params/", array(
    'module' => 'frontend_pages',
    'controller' => 'pages',
    'action' => 'index',
    'params' => 1
));
$router->add($config->application->frontendUri."/:params.html", array(
    'module' => 'frontend_pages',
    'controller' => 'pages',
    'action' => 'index',
    'params' => 1
));


/***********************PageController***********************/
$router->add($config->application->frontendUri . '/posts/:params', array(
    'module' => 'frontend_pages',
    'controller' => 'posts',
    'action' => 'single',
    'params' => 1,
));

$router->add($config->application->frontendUri . '/posts', array(
    'module' => 'frontend_pages',
    'controller' => 'posts',
    'action' => 'index',
));

$router->add($config->application->frontendUri . '/posts/', array(
    'module' => 'frontend_pages',
    'controller' => 'posts',
    'action' => 'index',
));

$router->add($config->application->frontendUri . '/category/:params', array(
    'module' => 'frontend_pages',
    'controller' => 'posts',
    'action' => 'category',
    'params' => 1,
));

/***********************API*********************************/