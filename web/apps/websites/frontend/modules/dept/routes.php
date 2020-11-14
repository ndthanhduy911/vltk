<?php
// ======================================
// DEPT
// ======================================
/***********************PostsController***********************/
$router->add($config->application->frontendUri."/{dept:[a-zA-Z0-9_-]+}/news/{post:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'single',
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

$router->add($config->application->frontendUri."/{dept:[a-zA-Z0-9_-]+}/blog", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'blog',
    'dept' => 1,
));

/***********************DeptController***********************/
$router->add($config->application->frontendUri."/{dept:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'dept',
    'action' => 'index',
    'dept' => 1,
));

/***********************PagesController***********************/
$router->add($config->application->frontendUri."/{dept:[a-zA-Z0-9_-]+}/{page:[a-zA-Z0-9_-]+}.html", array(
    'module' => 'frontend_dept',
    'controller' => 'pages',
    'action' => 'index',
    'dept' => 1,
    'page' => 2,
));

/***********************StaffController***********************/

$router->add($config->application->frontendUri."/{dept:[a-zA-Z0-9_-]+}/staff/{staff:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'staff',
    'action' => 'single',
    'dept' => 1,
    'staff' => 2,
));

$router->add($config->application->frontendUri."/{dept:[a-zA-Z0-9_-]+}/staff", array(
    'module' => 'frontend_dept',
    'controller' => 'staff',
    'action' => 'index',
    'dept' => 1,
));


// ======================================
// HOMEPAGE
// ======================================
/***********************PagesController***********************/
$router->add($config->application->frontendUri."/{page:[a-zA-Z0-9_-]+}.html", array(
    'module' => 'frontend_dept',
    'controller' => 'pages',
    'action' => 'index',
    'page' => 1,
));

/***********************PostsController***********************/
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

/***********************StaffController***********************/
$router->add($config->application->frontendUri."/staff/{staff:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'staff',
    'action' => 'single',
    'staff' => 1,
));

$router->add($config->application->frontendUri."/staff", array(
    'module' => 'frontend_dept',
    'controller' => 'staff',
    'action' => 'index'
));

/***********************ResearchesController***********************/
$router->add($config->application->frontendUri."/{dept:[a-zA-Z0-9_-]+}/research/{research:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'researches',
    'action' => 'index',
    'dept' => 1,
    'research' => 2,
));

/***********************SubjectsController***********************/
$router->add($config->application->frontendUri."/subjects/{subject:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'subjects',
    'action' => 'single',
    'subject' => 1,
));
