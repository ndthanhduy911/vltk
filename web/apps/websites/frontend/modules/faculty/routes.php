<?php
/***********************IndexController***********************/
$router->add($config->application->frontendUri.'/', array(
    'module' => 'frontend_faculty',
    'controller' => 'index',
    'action' => 'index',
));


$router->add($config->application->frontendUri.'/faculty-api/changelanguage/:int', array(
    'module' => 'frontend_faculty',
    'controller' => 'index',
    'action' => 'changelanguage',
    'id' => 2,
));
