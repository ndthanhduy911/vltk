<?php
use Models\Departments;
$depts = Departments::find(['status = 1 AND id != 1']);
foreach ($depts as $key => $dept) {
    $router->add($config->application->frontendUri."/$dept->slug", array(
        'module' => 'frontend_dept',
        'controller' => 'dept',
        'action' => 'index'
    ));

    $router->add($config->application->frontendUri."/$dept->slug/{page:[a-z\-]+}", array(
        'module' => 'frontend_dept',
        'controller' => 'page',
        'action' => 'index',
        'page' => 1,
    ));

    $router->add($config->application->frontendUri."/$dept->slug/news/{post:[a-z\-]+}", array(
        'module' => 'frontend_dept',
        'controller' => 'post',
        'action' => 'index',
        'post' => 1,
    ));

    $router->add($config->application->frontendUri."/$dept->slug/category/{cat:[a-z\-]+}", array(
        'module' => 'frontend_dept',
        'controller' => 'categories',
        'action' => 'index',
        'cat' => 1,
    ));
}

// /***********************DeptController***********************/
// $router->add($config->application->frontendUri."/dept/{dept:[a-z\-]+}", array(
//     'module' => 'frontend_dept',
//     'controller' => 'dept',
//     'action' => 'index',
//     'dept' => 1,
// ));

// $router->add($config->application->frontendUri."/dept/{dept:[a-z\-]+}/", array(
//     'module' => 'frontend_dept',
//     'controller' => 'dept',
//     'action' => 'index',
//     'dept' => 1,
// ));

// $router->add($config->application->frontendUri."/dept/{dept:[a-z\-]+}/{pages:[a-z\-]+}", array(
//     'module' => 'frontend_dept',
//     'controller' => 'dept',
//     'action' => 'index',
//     'dept' => 1,
//     'pages' => 2
// ));

// $router->add($config->application->frontendUri."/dept/{dept:[a-z\-]+}/{pages:[a-z\-]+}/", array(
//     'module' => 'frontend_dept',
//     'controller' => 'dept',
//     'action' => 'index',
//     'dept' => 1,
//     'pages' => 2
// ));
