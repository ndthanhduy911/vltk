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


/***********************PagesController***********************/
$router->add($config->application->frontendUri . '/bang-tin', array(
    'module' => 'frontend_pages',
    'controller' => 'posts',
    'action' => 'index',
));

$router->add($config->application->frontendUri . '/nd-tin-tuc/:params', array(
    'module' => 'frontend_pages',
    'controller' => 'posts',
    'action' => 'single',
    'params' => 1,
));

$router->add($config->application->frontendUri . '/tin-tuc/:params', array(
    'module' => 'frontend_pages',
    'controller' => 'posts',
    'action' => 'category',
    'params' => 1,
));