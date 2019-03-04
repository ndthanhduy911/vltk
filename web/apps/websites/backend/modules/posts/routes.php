<?php
/***********************DashboardController***********************/
$router->add($config->application->backendUri, array(
    'module' => 'backend_account',
    'controller' => 'dashboard',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/dashboard', array(
    'module' => 'backend_account',
    'controller' => 'dashboard',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/dashboard/:action', array(
    'module' => 'backend_account',
    'controller' => 'dashboard',
    'action' => 1,
));
$router->add($config->application->backendUri . '/dashboard/:action/:int', array(
    'module' => 'backend_account',
    'controller' => 'dashboard',
    'action'  => 1,
    'id' => 2
));

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


/***********************LanguageController***********************/
$router->add($config->application->backendUri . '/language', array(
    'module' => 'backend_account',
    'controller' => 'language',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/language/:action', array(
    'module' => 'backend_account',
    'controller' => 'language',
    'action' => 1,
));
$router->add($config->application->backendUri . '/language/:action/:int', array(
    'module' => 'backend_account',
    'controller' => 'language',
    'action' => 1,
    'id' => 2,
));

/***********************HelpController***********************/
$router->add($config->application->backendUri . '/help', array(
    'module' => 'backend_account',
    'controller' => 'help',
    'action' => 'index',
));

/***********************AboutController***********************/
$router->add($config->application->backendUri . '/about', array(
    'module' => 'backend_account',
    'controller' => 'about',
    'action' => 'index',
));

/***********************PolicyController***********************/
$router->add($config->application->backendUri . '/policy', array(
    'module' => 'backend_account',
    'controller' => 'policy',
    'action' => 'index',
));

/***********************FaqController***********************/
$router->add($config->application->backendUri . '/faq', array(
    'module' => 'backend_account',
    'controller' => 'faq',
    'action' => 'index',
));