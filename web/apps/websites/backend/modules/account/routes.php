<?php
/***********************AccountController***********************/
$router->add(WEB_ADMIN_URI . '/login', array(
    'module' => 'backend_account',
    'controller' => 'account',
    'action' => 'login'
));

$router->add(WEB_ADMIN_URI . '/login/captcha', array(
    'module' => 'backend_account',
    'controller' => 'account',
    'action' => 'captcha'
));
$router->add(WEB_ADMIN_URI . '/logout', array(
    'module' => 'backend_account',
    'controller' => 'account',
    'action'  => 'logout',
));