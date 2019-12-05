<?php
use Models\Departments;

/***********************PostsController***********************/

$router->add($config->application->frontendUri."/{dept:[a-z\-]+}/news/{post:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'index',
    'dept' => 1,
    'post' => 2,
));

$router->add($config->application->frontendUri."/{dept:[a-z\-]+}/category/{cat:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'category',
    'dept' => 1,
    'cat' => 2,
));

/***********************PagesController***********************/
$router->add($config->application->frontendUri."/{dept:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'dept',
    'action' => 'index',
    'dept' => 1,
));

$router->add($config->application->frontendUri."/{dept:[a-z\-]+}/{page:[a-z\-]+}.html", array(
    'module' => 'frontend_dept',
    'controller' => 'pages',
    'action' => 'index',
    'dept' => 1,
    'page' => 2,
));

$router->add($config->application->frontendUri."/{dept:[a-z\-]+}/blog", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'blog',
    'dept' => 1,
));

$router->add($config->application->frontendUri."/{page:[a-z\-]+}.html", array(
    'module' => 'frontend_dept',
    'controller' => 'pages',
    'action' => 'index',
    'page' => 1,
));

$router->add($config->application->frontendUri."/category/{cat:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'category',
    'cat' => 1,
));

$router->add($config->application->frontendUri."/blog", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'blog'
));

$router->add($config->application->frontendUri."/news/{post:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'single',
    'post' => 1,
));