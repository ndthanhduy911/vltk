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

/***********************ProfileController***********************/
$router->add($config->application->backendUri . '/profile', array(
    'module' => 'backend_users',
    'controller' => 'profile',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/profile/:action', array(
    'module' => 'backend_users',
    'controller' => 'profile',
    'action' => 1,
));
$router->add($config->application->backendUri . '/profile/:action/:int', array(
    'module' => 'backend_users',
    'controller' => 'profile',
    'action'  => 1,
    'id' => 2
));