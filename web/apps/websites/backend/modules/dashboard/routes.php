<?php
$router->add(WEB_ADMIN_URI, array(
    'module' => 'backend_dashboard',
    'controller' => 'index',
    'action' => 'index',
));

/***********************DashboardController***********************/

$router->add(WEB_ADMIN_URI . '/dashboard', array(
    'module' => 'backend_dashboard',
    'controller' => 'dashboard',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/dashboard/:action', array(
    'module' => 'backend_dashboard',
    'controller' => 'dashboard',
    'action' => 1,
));

$router->add(WEB_ADMIN_URI . '/dashboard/:action/:int', array(
    'module' => 'backend_dashboard',
    'controller' => 'dashboard',
    'action'  => 1,
    'id' => 2
));

/***********************ReportsController***********************/

$router->add(WEB_ADMIN_URI . '/reports', array(
    'module' => 'backend_dashboard',
    'controller' => 'reports',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/reports/:action', array(
    'module' => 'backend_dashboard',
    'controller' => 'reports',
    'action' => 1,
));

$router->add(WEB_ADMIN_URI . '/reports/:action/:int', array(
    'module' => 'backend_dashboard',
    'controller' => 'reports',
    'action'  => 1,
    'id' => 2
));
