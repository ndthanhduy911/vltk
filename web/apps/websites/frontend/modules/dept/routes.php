<?php
/***********************DeptController***********************/
$router->add($config->application->frontendUri."/dept/:params/", array(
    'module' => 'frontend_dept',
    'controller' => 'dept',
    'action' => 'index',
    'params' => 1
));

$router->add($config->application->frontendUri."/dept/:params", array(
    'module' => 'frontend_dept',
    'controller' => 'dept',
    'action' => 'index',
    'params' => 1
));

$router->add($config->application->frontendUri."/dept/:params/{pages:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'deptpages',
    'action' => 'index',
    'params' => 1,
    'pages' => 2
));

$router->add($config->application->frontendUri."/dept/:params/{pages:[a-z\-]+}/", array(
    'module' => 'frontend_dept',
    'controller' => 'deptpages',
    'action' => 'index',
    'params' => 1,
    'pages' => 2
));
