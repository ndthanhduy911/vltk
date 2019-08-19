<?php
/***********************IndexController***********************/
$router->add($config->application->frontendUri.'/', array(
    'module' => 'frontend_faculty',
    'controller' => 'index',
    'action' => 'index',
));