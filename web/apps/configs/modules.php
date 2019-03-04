<?php
/**
 * Register application modules
 */

$application->registerModules(array(
    'backend_admin' => array(
        'className' => 'Backend\Modules\Dashboard\Module',
        'path' => APP_DIR . '/websites/backend/modules/dashboard/module.php'
    ),
    'backend_user' => array(
        'className' => 'Backend\Modules\User\Module',
        'path' => APP_DIR . '/websites/backend/modules/user/module.php'
    ),
    'frontend_physics' => array(
        'className' => 'Frontend\Modules\Physics\Module',
        'path' => APP_DIR . '/websites/frontend/modules/physics/module.php'
    ),
));