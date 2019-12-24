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

/***********************SettingController***********************/
$router->add($config->application->backendUri . '/setting', array(
    'module' => 'backend_setting',
    'controller' => 'setting',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/setting/:action', array(
    'module' => 'backend_setting',
    'controller' => 'setting',
    'action' => 1,
));
$router->add($config->application->backendUri . '/setting/:action/:int', array(
    'module' => 'backend_setting',
    'controller' => 'setting',
    'action'  => 1,
    'id' => 2
));