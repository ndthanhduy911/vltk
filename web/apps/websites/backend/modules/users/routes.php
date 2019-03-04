<?php
/***********************DashboardController***********************/
$router->add($config->application->backendUri . '/users', array(
    'module' => 'backend_users',
    'controller' => 'users',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/users/:action', array(
    'module' => 'backend_users',
    'controller' => 'users',
    'action' => 1,
));
$router->add($config->application->backendUri . '/users/:action/:int', array(
    'module' => 'backend_users',
    'controller' => 'users',
    'action'  => 1,
    'id' => 2
));