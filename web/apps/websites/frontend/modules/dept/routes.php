<?php
use Models\Departments;

/***********************PostsController***********************/

$router->add($config->application->frontendUri."/{dept:[a-zA-Z0-9_-]+}/news/{post:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'index',
    'dept' => 1,
    'post' => 2,
));

$router->add($config->application->frontendUri."/{dept:[a-zA-Z0-9_-]+}/category/{cat:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'category',
    'dept' => 1,
    'cat' => 2,
));

/***********************PagesController***********************/
$router->add($config->application->frontendUri."/{dept:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'dept',
    'action' => 'index',
    'dept' => 1,
));

$router->add($config->application->frontendUri."/{dept:[a-zA-Z0-9_-]+}/{page:[a-zA-Z0-9_-]+}.html", array(
    'module' => 'frontend_dept',
    'controller' => 'pages',
    'action' => 'index',
    'dept' => 1,
    'page' => 2,
));

$router->add($config->application->frontendUri."/{dept:[a-zA-Z0-9_-]+}/blog", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'single',
    'dept' => 1,
    'dept' => 1,
));

$router->add($config->application->frontendUri."/{dept:[a-zA-Z0-9_-]+}/news/{post:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'single',
    'dept' => 1,
    'post' => 2,
));

$router->add($config->application->frontendUri."/{page:[a-zA-Z0-9_-]+}.html", array(
    'module' => 'frontend_dept',
    'controller' => 'pages',
    'action' => 'index',
    'page' => 1,
));

$router->add($config->application->frontendUri."/category/{cat:[a-zA-Z0-9_-]+}", array(
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

$router->add($config->application->frontendUri."/news/{post:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'single',
    'post' => 1,
));

/***********************IndexController***********************/
$router->add($config->application->frontendUri.'/', array(
    'module' => 'frontend_dept',
    'controller' => 'index',
    'action' => 'index',
));

/***********************LangController***********************/
$router->add($config->application->frontendUri.'/api/changelanguage/:int', array(
    'module' => 'frontend_dept',
    'controller' => 'index',
    'action' => 'changelanguage',
    'id' => 1,
));