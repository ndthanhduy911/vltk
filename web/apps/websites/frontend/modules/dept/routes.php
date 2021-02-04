<?php
// ======================================
// DEPT
// ======================================
/***********************PostsController***********************/
$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}/tin-tuc/{post:[a-zA-Z0-9_-]+}", array(
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
    'action' => 'temp',
    'dept' => 1,
    'page' => 2,
));

/***********************StaffsController***********************/
$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}/nhan-su/{staff:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'staffs',
    'action' => 'single',
    'dept' => 1,
    'staff' => 2,
));

$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}/nhan-su", array(
    'module' => 'frontend_dept',
    'controller' => 'staffs',
    'action' => 'index',
    'dept' => 1,
));

/***********************MajorsController***********************/
$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}/nganh-hoc/{major:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'majors',
    'action' => 'single',
    'dept' => 1,
    'major' => 2,
));

/***********************ClassesController***********************/
$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}/lop-hoc/{class:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'classes',
    'action' => 'single',
    'dept' => 1,
    'class' => 2,
));

$router->add(WEB_URI."/{dept:[a-zA-Z0-9_-]+}/lop-hoc", array(
    'module' => 'frontend_dept',
    'controller' => 'classes',
    'action' => 'index',
    'dept' => 1,
));

// ======================================
// HOMEPAGE
// ======================================
/***********************PagesController***********************/
$router->add(WEB_URI."/{page:[a-zA-Z0-9_-]+}.html", array(
    'module' => 'frontend_dept',
    'controller' => 'pages',
    'action' => 'temp',
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

$router->add(WEB_URI."/tin-tuc/{post:[a-zA-Z0-9_-]+}", array(
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
$router->add(WEB_URI."/nhan-su/{staff:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'staffs',
    'action' => 'single',
    'staff' => 1,
));

$router->add(WEB_URI."/nhan-su", array(
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
$router->add(WEB_URI."/mon-hoc/{subject:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'subjects',
    'action' => 'single',
    'subject' => 1,
));

/***********************MajorsController***********************/
$router->add(WEB_URI."/nganh-hoc/{major:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'majors',
    'action' => 'single',
    'major' => 1,
));

/***********************ClassesController***********************/
$router->add(WEB_URI."/lop-hoc/{class:[a-zA-Z0-9_-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'classes',
    'action' => 'single',
    'class' => 1,
));

$router->add(WEB_URI."/lop-hoc", array(
    'module' => 'frontend_dept',
    'controller' => 'classes',
    'action' => 'index',
));
