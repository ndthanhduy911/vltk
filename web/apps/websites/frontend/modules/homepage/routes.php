<?php
/***********************IndexController***********************/
$router->add($config->application->frontendUri.'/', array(
    'module' => 'frontend_homepage',
    'controller' => 'index',
    'action' => 'index',
));