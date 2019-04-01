<?php
$router = new Phalcon\Mvc\Router();

$router->setDefaultModule("frontend_homepage");
$router->notFound(array(
    'module' => 'frontend_homepage',
    "controller" => "index",
    "action" => "index"
));
/*---------------------------------include_routes_backend-----------------*/
include APP_DIR . '/websites/frontend/modules/pages/routes.php';
include APP_DIR . '/websites/frontend/modules/homepage/routes.php';
include APP_DIR . '/websites/frontend/modules/dept/routes.php';


include APP_DIR . '/websites/backend/modules/account/routes.php';
include APP_DIR . '/websites/backend/modules/posts/routes.php';
include APP_DIR . '/websites/backend/modules/dashboard/routes.php';
include APP_DIR . '/websites/backend/modules/users/routes.php';
return $router;