<?php
/***********************DashboardController***********************/
$router->add($config->application->frontendUri, array(
    'module' => 'frontend_physics',
    'controller' => 'index',
    'action' => 'index',
));

$router->add($config->application->frontendUri.'/account', array(
    'module' => 'frontend_physics',
    'controller' => 'account',
    'action' => 'index',
));

/***********************SupportController***********************/
$router->add($config->application->backendUri . '/support/:action', array(
    'module' => 'backend_dashboard',
    'controller' => 'support',
    'action' => 1,
));

$router->add($config->application->backendUri . '/support/:action/:int', array(
    'module' => 'backend_dashboard',
    'controller' => 'support',
    'action' => 1,
    'id' => 2,
));

// Single Page
$router->add($config->application->frontendUri.'/document', array(
    'module' => 'frontend_physics',
    'controller' => 'document',
    'action' => 'index',
));

$router->add($config->application->frontendUri.'/faq', array(
    'module' => 'frontend_physics',
    'controller' => 'faq',
    'action' => 'index',
));

$router->add($config->application->frontendUri.'/captcha', array(
    'module' => 'frontend_physics',
    'controller' => 'captcha',
    'action' => 'index',
));





/***********************DashboardController***********************/
$router->add($config->application->frontendUri.'/', array(
    'module' => 'frontend_physics',
    'controller' => 'index',
    'action' => 'index',
));

$router->add($config->application->frontendUri.'/account/', array(
    'module' => 'frontend_physics',
    'controller' => 'account',
    'action' => 'index',
));

/***********************SupportController***********************/
$router->add($config->application->backendUri . '/support/:action/', array(
    'module' => 'backend_dashboard',
    'controller' => 'support',
    'action' => 1,
));

$router->add($config->application->backendUri . '/support/:action/:int/', array(
    'module' => 'backend_dashboard',
    'controller' => 'support',
    'action' => 1,
    'id' => 2,
));

// Single Page
$router->add($config->application->frontendUri.'/document/', array(
    'module' => 'frontend_physics',
    'controller' => 'document',
    'action' => 'index',
));

$router->add($config->application->frontendUri.'/faq/', array(
    'module' => 'frontend_physics',
    'controller' => 'faq',
    'action' => 'index',
));

$router->add($config->application->frontendUri.'/captcha/', array(
    'module' => 'frontend_physics',
    'controller' => 'captcha',
    'action' => 'index',
));