<?php
/***********************DeptController***********************/
$router->add($config->application->frontendUri . '/dept', array(
    'module' => 'frontend_dept',
    'controller' => 'dept',
    'action' => 'index',
));

// $router->add($config->application->frontendUri . '/dept/:action', array(
//     'module' => 'frontend_dept',
//     'controller' => 'dept',
//     'action' => 1,
// ));
// $router->add($config->application->frontendUri . '/dept/:action/:int', array(
//     'module' => 'frontend_dept',
//     'controller' => 'dept',
//     'action'  => 1,
//     'id' => 2
// ));