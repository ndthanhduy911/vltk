<?php
/***********************IndexController***********************/
$router->add($config->application->frontendUri."/:params", array(
    'module' => 'frontend_pages',
    'controller' => 'pages',
    'action' => 'index',
    'params' => 1
));