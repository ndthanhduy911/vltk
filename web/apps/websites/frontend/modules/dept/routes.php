<?php
/***********************DeptController***********************/
$router->add($config->application->frontendUri."/dept/{dept:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'dept',
    'action' => 'index',
    'dept' => 1,
));

$router->add($config->application->frontendUri."/dept/{dept:[a-z\-]+}/", array(
    'module' => 'frontend_dept',
    'controller' => 'dept',
    'action' => 'index',
    'dept' => 1,
));

$router->add($config->application->frontendUri."/dept/{dept:[a-z\-]+}/{pages:[a-z\-]+}", array(
    'module' => 'frontend_dept',
    'controller' => 'dept',
    'action' => 'index',
    'dept' => 1,
    'pages' => 2
));

$router->add($config->application->frontendUri."/dept/{dept:[a-z\-]+}/{pages:[a-z\-]+}/", array(
    'module' => 'frontend_dept',
    'controller' => 'dept',
    'action' => 'index',
    'dept' => 1,
    'pages' => 2
));
