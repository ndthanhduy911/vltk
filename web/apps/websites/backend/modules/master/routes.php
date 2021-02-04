<?php
/***********************UserController***********************/
$router->add(WEB_ADMIN_URI . '/user', array(
    'module' => 'backend_master',
    'controller' => 'user',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/user/:action', array(
    'module' => 'backend_master',
    'controller' => 'user',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/user/:action/:int', array(
    'module' => 'backend_master',
    'controller' => 'user',
    'action'  => 1,
    'id' => 2
));

/***********************RoleController***********************/
$router->add(WEB_ADMIN_URI . '/role', array(
    'module' => 'backend_master',
    'controller' => 'role',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/role/:action', array(
    'module' => 'backend_master',
    'controller' => 'role',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/role/:action/:int', array(
    'module' => 'backend_master',
    'controller' => 'role',
    'action'  => 1,
    'id' => 2
));

/***********************LogsController***********************/
$router->add(WEB_ADMIN_URI . '/logs', array(
    'module' => 'backend_master',
    'controller' => 'logs',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/logs/:action', array(
    'module' => 'backend_master',
    'controller' => 'logs',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/logs/:action/:int', array(
    'module' => 'backend_master',
    'controller' => 'logs',
    'action'  => 1,
    'id' => 2
));

/***********************MediaController***********************/
$router->add(WEB_ADMIN_URI . '/media', array(
    'module' => 'backend_master',
    'controller' => 'media',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/media/:action', array(
    'module' => 'backend_master',
    'controller' => 'media',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/media/:action/:int', array(
    'module' => 'backend_master',
    'controller' => 'media',
    'action'  => 1,
    'id' => 2
));

/***********************HelpController***********************/
$router->add(WEB_ADMIN_URI . '/help', array(
    'module' => 'backend_master',
    'controller' => 'help',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/help/:action', array(
    'module' => 'backend_master',
    'controller' => 'help',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/help/:action/:int', array(
    'module' => 'backend_master',
    'controller' => 'help',
    'action'  => 1,
    'id' => 2
));

/***********************SettingController***********************/
$router->add(WEB_ADMIN_URI . '/setting', array(
    'module' => 'backend_master',
    'controller' => 'setting',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/setting/:action', array(
    'module' => 'backend_master',
    'controller' => 'setting',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/setting/:action/:int', array(
    'module' => 'backend_master',
    'controller' => 'setting',
    'action'  => 1,
    'id' => 2
));

/***********************TrashsController***********************/
$router->add(WEB_ADMIN_URI . '/trashs', array(
    'module' => 'backend_master',
    'controller' => 'trashs',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/trashs/:action', array(
    'module' => 'backend_master',
    'controller' => 'trashs',
    'action' => 1,
));
$router->add(WEB_ADMIN_URI . '/trashs/:action/:int', array(
    'module' => 'backend_master',
    'controller' => 'trashs',
    'action'  => 1,
    'id' => 2
));