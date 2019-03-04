<?php
/***********************DashboardController***********************/
$router->add($config->application->backendUri, array(
    'module' => 'backend_dashboard',
    'controller' => 'dashboard',
    'action' => 'index',
));