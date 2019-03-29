<?php
/***********************IndexController***********************/
$router->add($config->application->frontendUri."/:params/", array(
    'module' => 'frontend_pages',
    'controller' => 'pages',
    'action' => 'index',
    'params' => 1
));

$router->add($config->application->frontendUri."/tin-tuc/:params", array(
    'module' => 'frontend_pages',
    'controller' => 'posts',
    'action' => 'index',
    'params' => 1
));