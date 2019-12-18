<?php
$router = new Phalcon\Mvc\Router();

$router->setDefaultModule("frontend_dept");
$router->notFound(array(
    'module' => 'frontend_dept',
    "controller" => "index",
    "action" => "index"
));
/*---------------------------------include_routes_frontend-----------------*/
include APP_DIR . '/websites/frontend/modules/dept/routes.php';
include APP_DIR . '/websites/frontend/modules/api/routes.php';

/*---------------------------------include_routes_backend-----------------*/
include APP_DIR . '/websites/backend/modules/account/routes.php';
include APP_DIR . '/websites/backend/modules/posts/routes.php';
include APP_DIR . '/websites/backend/modules/users/routes.php';
include APP_DIR . '/websites/backend/modules/setting/routes.php';
return $router;