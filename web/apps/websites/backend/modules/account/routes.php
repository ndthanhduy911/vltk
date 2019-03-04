<?php
/***********************AccountController***********************/
$router->add($config->application->backendUri . '/login', array(
    'module' => 'backend_account',
    'controller' => 'account',
    'action' => 'login',
));

$router->add($config->application->backendUri . '/account/:action', array(
    'module' => 'backend_account',
    'controller' => 'account',
    'action' => 1,
));
$router->add($config->application->backendUri . '/account/:action/:int', array(
    'module' => 'backend_account',
    'controller' => 'account',
    'action'  => 1,
    'id' => 2
));