<?php
/***********************PagesController***********************/

$router->add($config->application->backendUri . '/pages', array(
    'module' => 'backend_pages',
    'controller' => 'pages',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/pages/:action', array(
    'module' => 'backend_pages',
    'controller' => 'pages',
    'action' => 1,
));
$router->add($config->application->backendUri . '/pages/:action/:int', array(
    'module' => 'backend_pages',
    'controller' => 'pages',
    'action'  => 1,
    'id' => 2
));




