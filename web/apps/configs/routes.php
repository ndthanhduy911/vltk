<?php
$router = new Phalcon\Mvc\Router();

$router->setDefaultModule("frontend_physics");
$router->notFound(array(
    'module' => 'frontend_physics',
    "controller" => "index",
    "action" => "index"
));
/*---------------------------------include_routes_backend-----------------*/
include APP_DIR . '/websites/frontend/modules/physics/routes.php';
include APP_DIR . '/websites/backend/modules/account/routes.php';
include APP_DIR . '/websites/backend/modules/users/routes.php';
return $router;