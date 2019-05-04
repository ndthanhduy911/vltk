<?php
/***********************PagesController***********************/
$router->add($config->application->frontendUri."/:params/", array(
    'module' => 'frontend_pages',
    'controller' => 'pages',
    'action' => 'index',
    'params' => 1
));
$router->add($config->application->frontendUri."/:params", array(
    'module' => 'frontend_pages',
    'controller' => 'pages',
    'action' => 'index',
    'params' => 1
));


/***********************PostsController***********************/
$router->add($config->application->frontendUri . '/api-posts/:action', array(
    'module' => 'frontend_pages',
    'controller' => 'posts',
    'action' => 1,
));

$router->add($config->application->frontendUri . '/api-posts/:action/:int', array(
    'module' => 'frontend_pages',
    'controller' => 'posts',
    'action'  => 1,
    'id' => 2
));

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