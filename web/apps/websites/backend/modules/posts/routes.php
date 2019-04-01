<?php
/***********************PostsController***********************/

$router->add($config->application->backendUri . '/posts', array(
    'module' => 'backend_posts',
    'controller' => 'posts',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/posts/:action', array(
    'module' => 'backend_posts',
    'controller' => 'posts',
    'action' => 1,
));
$router->add($config->application->backendUri . '/posts/:action/:int', array(
    'module' => 'backend_posts',
    'controller' => 'posts',
    'action'  => 1,
    'id' => 2
));

$router->add($config->application->backendUri . '/media', array(
    'module' => 'backend_posts',
    'controller' => 'media',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/media/:action', array(
    'module' => 'backend_posts',
    'controller' => 'media',
    'action' => 1,
));
$router->add($config->application->backendUri . '/media/:action/:int', array(
    'module' => 'backend_posts',
    'controller' => 'media',
    'action'  => 1,
    'id' => 2
));




