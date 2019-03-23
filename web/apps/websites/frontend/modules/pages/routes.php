<?php
/***********************PagesController***********************/
$router->add($config->application->frontendUri . '/pages', array(
    'module' => 'frontend_pages',
    'controller' => 'pages',
    'action' => 'login',
));

$router->add($config->application->frontendUri . '/pages/:action', array(
    'module' => 'frontend_pages',
    'controller' => 'pages',
    'action' => 1,
));
$router->add($config->application->frontendUri . '/pages/:action/:int', array(
    'module' => 'frontend_pages',
    'controller' => 'pages',
    'action'  => 1,
    'id' => 2
));