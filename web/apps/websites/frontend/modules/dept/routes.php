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
