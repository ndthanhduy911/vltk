<?php
/***********************DeptsController***********************/
$router->add(WEB_ADMIN_URI . '/depts', array(
    'module' => 'backend_shared',
    'controller' => 'depts',
    'action' => 'index',
));

$router->add(WEB_ADMIN_URI . '/depts/:action', array(
    'module' => 'backend_shared',
    'controller' => 'depts',
    'action' => 1,
));

$router->add(WEB_ADMIN_URI . '/depts/:action/:int', array(
    'module' => 'backend_shared',
    'controller' => 'depts',
    'action'  => 1,
    'id' => 2
));