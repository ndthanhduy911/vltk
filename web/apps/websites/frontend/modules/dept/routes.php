<?php
// ======================================
// DEPT
// ======================================
/***********************PostsController***********************/
$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}/news/{post:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'single',
    'dept' => 1,
    'post' => 2,
));

$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}/category/{cat:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'category',
    'dept' => 1,
    'cat' => 2,
));

$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}/blog", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'blog',
    'dept' => 1,
));

/***********************DeptController***********************/
$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'dept',
    'action' => 'index',
    'dept' => 1,
));

/***********************PagesController***********************/
$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}/{page:[a-zA-Z0-9_-]+}.html", array(
    'module' => 'frontend_dept',
    'controller' => 'pages',
    'action' => 'index',
    'dept' => 1,
    'page' => 2,
));

/***********************StaffsController***********************/
$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}/staffs/{staff:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'staffs',
    'action' => 'single',
    'dept' => 1,
    'staff' => 2,
));

$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}/staffs", array(
    'module' => 'frontend_dept',
    'controller' => 'staffs',
    'action' => 'index',
    'dept' => 1,
));

/***********************GmajorsController***********************/
$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}/nhom-nganh-hoc", array(
    'module' => 'frontend_dept',
    'controller' => 'gmajors',
    'action' => 'index',
    'dept' => 1,
));
$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}/nhom-nganh-hoc/{gmajor:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'gmajors',
    'action' => 'single',
    'dept' => 1,
    'gmajor' => 2,
));

/***********************MajorsController***********************/
$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}/nganh-hoc/{major:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'majors',
    'action' => 'single',
    'dept' => 1,
    'major' => 2,
));

// ======================================
// HOMEPAGE
// ======================================
/***********************PagesController***********************/
$router->add(WEB_URI."/{page:[a-zA-Z0-9_-]+}.html", array(
    'module' => 'frontend_dept',
    'controller' => 'pages',
    'action' => 'index',
    'page' => 1,
));

/***********************PostsController***********************/
$router->add(WEB_URI."/category/{cat:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'category',
    'cat' => 1,
));

$router->add(WEB_URI."/blog", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'blog'
));

$router->add(WEB_URI."/news/{post:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'posts',
    'action' => 'single',
    'post' => 1,
));

/***********************IndexController***********************/
$router->add(WEB_URI.'/', array(
    'module' => 'frontend_dept',
    'controller' => 'index',
    'action' => 'index',
));

/***********************LangController***********************/
$router->add(WEB_URI.'/api/changelanguage/:int', array(
    'module' => 'frontend_dept',
    'controller' => 'index',
    'action' => 'changelanguage',
    'id' => 1,
));

/***********************StaffController***********************/
$router->add(WEB_URI."/staffs/{staff:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'staffs',
    'action' => 'single',
    'staff' => 1,
));

$router->add(WEB_URI."/staffs", array(
    'module' => 'frontend_dept',
    'controller' => 'staffs',
    'action' => 'index'
));

/***********************ResearchesController***********************/
$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}/research/{research:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'researches',
    'action' => 'index',
    'dept' => 1,
    'research' => 2,
));

/***********************SubjectsController***********************/
$router->add(WEB_URI."/subjects/{subject:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'subjects',
    'action' => 'single',
    'subject' => 1,
));

/***********************GmajorsController***********************/
$router->add(WEB_URI."/nhom-nganh-hoc", array(
    'module' => 'frontend_dept',
    'controller' => 'gmajors',
    'action' => 'index',
));
$router->add(WEB_URI."/nhom-nganh-hoc/{gmajor:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'gmajors',
    'action' => 'single',
    'gmajor' => 1,
));

/***********************MajorsController***********************/
$router->add(WEB_URI."/nganh-hoc/{major:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'majors',
    'action' => 'single',
    'major' => 1,
));
