<?php
/***********************MenuController***********************/
$router->add($config->application->backendUri . '/menu', array(
    'module' => 'backend_setting',
    'controller' => 'menus',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/menu/:action', array(
    'module' => 'backend_setting',
    'controller' => 'menus',
    'action' => 1,
));
$router->add($config->application->backendUri . '/menu/:action/:int', array(
    'module' => 'backend_setting',
    'controller' => 'menus',
    'action'  => 1,
    'id' => 2
));