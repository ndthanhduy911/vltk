<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$router->add($config->application->backendUri . '/user', array(
    'module' => 'backend_user',
    'controller' => 'user',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/user/:action', array(
    'module' => 'backend_user',
    'controller' => 'user',
    'action'  => 1,
));
$router->add($config->application->backendUri . '/user/create', array(
    'module' => 'backend_user',
    'controller' => 'user',
    'action'  => 'edit',
));
$router->add($config->application->backendUri . '/user/:action/:int', array(
    'module' => 'backend_user',
    'controller' => 'user',
    'action'  => 1,
    'id' => 2
));
/*----------------Routes_PERMISSION_ACTION---------------*/

/*----------------Routes_PROFILE---------------*/
$router->add($config->application->backendUri . '/user', array(
    'module' => 'backend_user',
    'controller' => 'user',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/profile', array(
    'module' => 'backend_user',
    'controller' => 'user',
    'action' => 'profile',
));

/*----------------Routes_PROFILE---------------*/

/*----------------Routes_LOGIN---------------*/

$router->add($config->application->backendUri . '/login', array(
    'module' => 'backend_user',
    'controller' => 'login',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/login:action', array(
    'module' => 'backend_user',
    'controller' => 'login',
    'action' => 1,
));

/*----------------Routes_LOGIN---------------*/

$router->add($config->application->backendUri . '/logout', array(
    'module' => 'backend_user',
    'controller' => 'user',
    'action' => 'logout',
));
