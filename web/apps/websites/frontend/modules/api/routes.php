<?php

$router->add($config->application->frontendUri.'/api-posts/getdataposts', array(
    'module' => 'frontend_api',
    'controller' => 'posts',
    'action' => 'getdataposts'
));