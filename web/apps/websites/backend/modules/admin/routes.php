<?php
/***********************DashboardController***********************/
$router->add($config->application->backendUri, array(
    'module' => 'backend_admin',
    'controller' => 'dashboard',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/dashboard', array(
    'module' => 'backend_admin',
    'controller' => 'dashboard',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/dashboard/:action', array(
    'module' => 'backend_admin',
    'controller' => 'dashboard',
    'action' => 1,
));
$router->add($config->application->backendUri . '/dashboard/:action/:int', array(
    'module' => 'backend_admin',
    'controller' => 'dashboard',
    'action'  => 1,
    'id' => 2
));

/***********************ClientController***********************/
$router->add($config->application->backendUri . '/client', array(
    'module' => 'backend_admin',
    'controller' => 'client',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/client/:action', array(
    'module' => 'backend_admin',
    'controller' => 'client',
    'action' => 1,
));
$router->add($config->application->backendUri . '/client/:action/:int', array(
    'module' => 'backend_admin',
    'controller' => 'client',
    'action'  => 1,
    'id' => 2
));

/***********************PackageController***********************/
$router->add($config->application->backendUri . '/package', array(
    'module' => 'backend_admin',
    'controller' => 'package',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/package/:action', array(
    'module' => 'backend_admin',
    'controller' => 'package',
    'action' => 1,
));
$router->add($config->application->backendUri . '/package/:action/:int', array(
    'module' => 'backend_admin',
    'controller' => 'package',
    'action'  => 1,
    'id' => 2
));

/***********************MailRemindController***********************/
$router->add($config->application->backendUri . '/mail', array(
    'module' => 'backend_admin',
    'controller' => 'mailremind',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/mail/:action', array(
    'module' => 'backend_admin',
    'controller' => 'mailremind',
    'action' => 1,
));
$router->add($config->application->backendUri . '/mail/:action/:int', array(
    'module' => 'backend_admin',
    'controller' => 'mailremind',
    'action' => 1,
    'id' => 2,
));

/***********************SupportController***********************/
$router->add($config->application->backendUri . '/support', array(
    'module' => 'backend_admin',
    'controller' => 'support',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/support/:action', array(
    'module' => 'backend_admin',
    'controller' => 'support',
    'action' => 1,
));
$router->add($config->application->backendUri . '/support/:action/:int', array(
    'module' => 'backend_admin',
    'controller' => 'support',
    'action' => 1,
    'id' => 2,
));

/***********************DepartmentController***********************/
$router->add($config->application->backendUri . '/department', array(
    'module' => 'backend_admin',
    'controller' => 'department',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/department/:action', array(
    'module' => 'backend_admin',
    'controller' => 'department',
    'action' => 1,
));
$router->add($config->application->backendUri . '/department/:action/:int', array(
    'module' => 'backend_admin',
    'controller' => 'department',
    'action' => 1,
    'id' => 2,
));

/***********************DepartmentController***********************/
$router->add($config->application->backendUri . '/method', array(
    'module' => 'backend_admin',
    'controller' => 'method',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/method/:action', array(
    'module' => 'backend_admin',
    'controller' => 'method',
    'action' => 1,
));
$router->add($config->application->backendUri . '/method/:action/:int', array(
    'module' => 'backend_admin',
    'controller' => 'method',
    'action' => 1,
    'id' => 2,
));

/***********************DepartmentController***********************/
$router->add($config->application->backendUri . '/permission', array(
    'module' => 'backend_admin',
    'controller' => 'permission',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/permission/:action', array(
    'module' => 'backend_admin',
    'controller' => 'permission',
    'action' => 1,
));
$router->add($config->application->backendUri . '/permission/:action/:int', array(
    'module' => 'backend_admin',
    'controller' => 'permission',
    'action' => 1,
    'id' => 2,
));

/***********************SupportController***********************/
$router->add($config->application->backendUri . '/setting', array(
    'module' => 'backend_admin',
    'controller' => 'setting',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/setting/:action', array(
    'module' => 'backend_admin',
    'controller' => 'setting',
    'action' => 1,
));
$router->add($config->application->backendUri . '/setting/:action/:int', array(
    'module' => 'backend_admin',
    'controller' => 'setting',
    'action' => 1,
    'id' => 2,
));


/***********************LanguageController***********************/
$router->add($config->application->backendUri . '/language', array(
    'module' => 'backend_admin',
    'controller' => 'language',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/language/:action', array(
    'module' => 'backend_admin',
    'controller' => 'language',
    'action' => 1,
));
$router->add($config->application->backendUri . '/language/:action/:int', array(
    'module' => 'backend_admin',
    'controller' => 'language',
    'action' => 1,
    'id' => 2,
));

/***********************LanguageController***********************/
$router->add($config->application->backendUri . '/language/', array(
    'module' => 'backend_admin',
    'controller' => 'setting',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/language/:action/', array(
    'module' => 'backend_admin',
    'controller' => 'language',
    'action' => 1,
));
$router->add($config->application->backendUri . '/language/:action/:int/', array(
    'module' => 'backend_admin',
    'controller' => 'language',
    'action' => 1,
    'id' => 2,
));

/***********************HelpController***********************/
$router->add($config->application->backendUri . '/help', array(
    'module' => 'backend_admin',
    'controller' => 'help',
    'action' => 'index',
));

/***********************AboutController***********************/
$router->add($config->application->backendUri . '/about', array(
    'module' => 'backend_admin',
    'controller' => 'about',
    'action' => 'index',
));

/***********************PolicyController***********************/
$router->add($config->application->backendUri . '/policy', array(
    'module' => 'backend_admin',
    'controller' => 'policy',
    'action' => 'index',
));

/***********************FaqController***********************/
$router->add($config->application->backendUri . '/faq', array(
    'module' => 'backend_admin',
    'controller' => 'faq',
    'action' => 'index',
));

/***********************LogController***********************/
$router->add($config->application->backendUri . '/log', array(
    'module' => 'backend_admin',
    'controller' => 'log',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/log/:action', array(
    'module' => 'backend_admin',
    'controller' => 'log',
    'action' => 1,
));
$router->add($config->application->backendUri . '/log/:action/:int', array(
    'module' => 'backend_admin',
    'controller' => 'log',
    'action'  => 1,
    'id' => 2
));

/***********************EmailSMSController***********************/
$router->add($config->application->backendUri . '/emailsms', array(
    'module' => 'backend_admin',
    'controller' => 'emailsms',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/emailsms/:action', array(
    'module' => 'backend_admin',
    'controller' => 'emailsms',
    'action' => 1,
));
$router->add($config->application->backendUri . '/emailsms/:action/:int', array(
    'module' => 'backend_admin',
    'controller' => 'emailsms',
    'action'  => 1,
    'id' => 2
));






/***********************DashboardController***********************/
$router->add($config->application->backendUri.'/', array(
    'module' => 'backend_admin',
    'controller' => 'dashboard',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/dashboard/', array(
    'module' => 'backend_admin',
    'controller' => 'dashboard',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/dashboard/:action/', array(
    'module' => 'backend_admin',
    'controller' => 'dashboard',
    'action' => 1,
));
$router->add($config->application->backendUri . '/dashboard/:action/:int/', array(
    'module' => 'backend_admin',
    'controller' => 'dashboard',
    'action'  => 1,
    'id' => 2
));

/***********************ClientController***********************/
$router->add($config->application->backendUri . '/client/', array(
    'module' => 'backend_admin',
    'controller' => 'client',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/client/:action/', array(
    'module' => 'backend_admin',
    'controller' => 'client',
    'action' => 1,
));
$router->add($config->application->backendUri . '/client/:action/:int/', array(
    'module' => 'backend_admin',
    'controller' => 'client',
    'action'  => 1,
    'id' => 2
));

/***********************PackageController***********************/
$router->add($config->application->backendUri . '/package/', array(
    'module' => 'backend_admin',
    'controller' => 'package',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/package/:action/', array(
    'module' => 'backend_admin',
    'controller' => 'package',
    'action' => 1,
));
$router->add($config->application->backendUri . '/package/:action/:int/', array(
    'module' => 'backend_admin',
    'controller' => 'package',
    'action'  => 1,
    'id' => 2
));

/***********************MailRemindController***********************/
$router->add($config->application->backendUri . '/mail/', array(
    'module' => 'backend_admin',
    'controller' => 'mailremind',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/mail/:action/', array(
    'module' => 'backend_admin',
    'controller' => 'mailremind',
    'action' => 1,
));
$router->add($config->application->backendUri . '/mail/:action/:int/', array(
    'module' => 'backend_admin',
    'controller' => 'mailremind',
    'action' => 1,
    'id' => 2,
));

/***********************SupportController***********************/
$router->add($config->application->backendUri . '/support/', array(
    'module' => 'backend_admin',
    'controller' => 'support',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/support/:action/', array(
    'module' => 'backend_admin',
    'controller' => 'support',
    'action' => 1,
));
$router->add($config->application->backendUri . '/support/:action/:int/', array(
    'module' => 'backend_admin',
    'controller' => 'support',
    'action' => 1,
    'id' => 2,
));

/***********************DepartmentController***********************/
$router->add($config->application->backendUri . '/department/', array(
    'module' => 'backend_admin',
    'controller' => 'department',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/department/:action/', array(
    'module' => 'backend_admin',
    'controller' => 'department',
    'action' => 1,
));
$router->add($config->application->backendUri . '/department/:action/:int/', array(
    'module' => 'backend_admin',
    'controller' => 'department',
    'action' => 1,
    'id' => 2,
));

/***********************DepartmentController***********************/
$router->add($config->application->backendUri . '/method/', array(
    'module' => 'backend_admin',
    'controller' => 'method',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/method/:action/', array(
    'module' => 'backend_admin',
    'controller' => 'method',
    'action' => 1,
));
$router->add($config->application->backendUri . '/method/:action/:int/', array(
    'module' => 'backend_admin',
    'controller' => 'method',
    'action' => 1,
    'id' => 2,
));

/***********************DepartmentController***********************/
$router->add($config->application->backendUri . '/permission/', array(
    'module' => 'backend_admin',
    'controller' => 'permission',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/permission/:action/', array(
    'module' => 'backend_admin',
    'controller' => 'permission',
    'action' => 1,
));
$router->add($config->application->backendUri . '/permission/:action/:int/', array(
    'module' => 'backend_admin',
    'controller' => 'permission',
    'action' => 1,
    'id' => 2,
));

/***********************SupportController***********************/
$router->add($config->application->backendUri . '/setting/', array(
    'module' => 'backend_admin',
    'controller' => 'setting',
    'action' => 'index',
));
$router->add($config->application->backendUri . '/setting/:action/', array(
    'module' => 'backend_admin',
    'controller' => 'setting',
    'action' => 1,
));
$router->add($config->application->backendUri . '/setting/:action/:int/', array(
    'module' => 'backend_admin',
    'controller' => 'setting',
    'action' => 1,
    'id' => 2,
));

/***********************HelpController***********************/
$router->add($config->application->backendUri . '/help/', array(
    'module' => 'backend_admin',
    'controller' => 'help',
    'action' => 'index',
));

/***********************AboutController***********************/
$router->add($config->application->backendUri . '/about/', array(
    'module' => 'backend_admin',
    'controller' => 'about',
    'action' => 'index',
));

/***********************PolicyController***********************/
$router->add($config->application->backendUri . '/policy/', array(
    'module' => 'backend_admin',
    'controller' => 'policy',
    'action' => 'index',
));

/***********************FaqController***********************/
$router->add($config->application->backendUri . '/faq/', array(
    'module' => 'backend_admin',
    'controller' => 'faq',
    'action' => 'index',
));

/***********************LogController***********************/
$router->add($config->application->backendUri . '/log/', array(
    'module' => 'backend_admin',
    'controller' => 'log',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/log/:action/', array(
    'module' => 'backend_admin',
    'controller' => 'log',
    'action' => 1,
));
$router->add($config->application->backendUri . '/log/:action/:int/', array(
    'module' => 'backend_admin',
    'controller' => 'log',
    'action'  => 1,
    'id' => 2
));

/***********************EmailSMSController***********************/
$router->add($config->application->backendUri . '/emailsms/', array(
    'module' => 'backend_admin',
    'controller' => 'emailsms',
    'action' => 'index',
));

$router->add($config->application->backendUri . '/emailsms/:action/', array(
    'module' => 'backend_admin',
    'controller' => 'emailsms',
    'action' => 1,
));
$router->add($config->application->backendUri . '/emailsms/:action/:int/', array(
    'module' => 'backend_admin',
    'controller' => 'emailsms',
    'action'  => 1,
    'id' => 2
));



