<?php
/***********************VlthController***********************/
$router->add($config->application->frontendUri . '/vat-ly-tin-hoc', array(
    'module' => 'frontend_dept',
    'controller' => 'vlth',
    'action' => 'index',
));

$router->add($config->application->frontendUri . '/vat-ly-tin-hoc/:action', array(
    'module' => 'frontend_dept',
    'controller' => 'vlth',
    'action' => 1,
));
$router->add($config->application->frontendUri . '/vat-ly-tin-hoc/:action/:int', array(
    'module' => 'frontend_dept',
    'controller' => 'vlth',
    'action'  => 1,
    'id' => 2
));

/***********************VlltController***********************/
$router->add($config->application->frontendUri . '/vat-ly-ly-thuyet', array(
    'module' => 'frontend_dept',
    'controller' => 'vllt',
    'action' => 'index',
));

$router->add($config->application->frontendUri . '/vat-ly-ly-thuyet/:action', array(
    'module' => 'frontend_dept',
    'controller' => 'vllt',
    'action' => 1,
));
$router->add($config->application->frontendUri . '/vat-ly-ly-thuyet/:action/:int', array(
    'module' => 'frontend_dept',
    'controller' => 'vllt',
    'action'  => 1,
    'id' => 2
));

/***********************VlhnController***********************/
$router->add($config->application->frontendUri . '/vat-ly-hat-nhan', array(
    'module' => 'frontend_dept',
    'controller' => 'vlhn',
    'action' => 'index',
));

$router->add($config->application->frontendUri . '/vat-ly-hat-nhan/:action', array(
    'module' => 'frontend_dept',
    'controller' => 'vlhn',
    'action' => 1,
));
$router->add($config->application->frontendUri . '/vat-ly-hat-nhan/:action/:int', array(
    'module' => 'frontend_dept',
    'controller' => 'vlhn',
    'action'  => 1,
    'id' => 2
));

/***********************VlcrController***********************/
$router->add($config->application->frontendUri . '/vat-ly-chat-ran', array(
    'module' => 'frontend_dept',
    'controller' => 'vlcr',
    'action' => 'index',
));

$router->add($config->application->frontendUri . '/vat-ly-chat-ran/:action', array(
    'module' => 'frontend_dept',
    'controller' => 'vlcr',
    'action' => 1,
));
$router->add($config->application->frontendUri . '/vat-ly-chat-ran/:action/:int', array(
    'module' => 'frontend_dept',
    'controller' => 'vlcr',
    'action'  => 1,
    'id' => 2
));

/***********************VludController***********************/
$router->add($config->application->frontendUri . '/vat-ly-ung-dung', array(
    'module' => 'frontend_dept',
    'controller' => 'vlud',
    'action' => 'index',
));

$router->add($config->application->frontendUri . '/vat-ly-ung-dung/:action', array(
    'module' => 'frontend_dept',
    'controller' => 'vlud',
    'action' => 1,
));
$router->add($config->application->frontendUri . '/vat-ly-ung-dung/:action/:int', array(
    'module' => 'frontend_dept',
    'controller' => 'vlud',
    'action'  => 1,
    'id' => 2
));

/***********************VldtController***********************/
$router->add($config->application->frontendUri . '/vat-ly-dien-tu', array(
    'module' => 'frontend_dept',
    'controller' => 'vldt',
    'action' => 'index',
));

$router->add($config->application->frontendUri . '/vat-ly-dien-tu/:action', array(
    'module' => 'frontend_dept',
    'controller' => 'vldt',
    'action' => 1,
));
$router->add($config->application->frontendUri . '/vat-ly-dien-tu/:action/:int', array(
    'module' => 'frontend_dept',
    'controller' => 'vldt',
    'action'  => 1,
    'id' => 2
));

/***********************VldcController***********************/
$router->add($config->application->frontendUri . '/vat-ly-dia-cau', array(
    'module' => 'frontend_dept',
    'controller' => 'vldc',
    'action' => 'index',
));

$router->add($config->application->frontendUri . '/vat-ly-dia-cau/:action', array(
    'module' => 'frontend_dept',
    'controller' => 'vldc',
    'action' => 1,
));
$router->add($config->application->frontendUri . '/vat-ly-dia-cau/:action/:int', array(
    'module' => 'frontend_dept',
    'controller' => 'vldc',
    'action'  => 1,
    'id' => 2
));

/***********************VlhdController***********************/
$router->add($config->application->frontendUri . '/vat-ly-hai-duong', array(
    'module' => 'frontend_dept',
    'controller' => 'vlhd',
    'action' => 'index',
));

$router->add($config->application->frontendUri . '/vat-ly-hai-duong/:action', array(
    'module' => 'frontend_dept',
    'controller' => 'vlhd',
    'action' => 1,
));
$router->add($config->application->frontendUri . '/vat-ly-hai-duong/:action/:int', array(
    'module' => 'frontend_dept',
    'controller' => 'vlhd',
    'action'  => 1,
    'id' => 2
));