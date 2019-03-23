<?php
/**
 * Register application modules
 */

$application->registerModules(array(
    'backend_account' => array(
        'className' => 'Backend\Modules\Account\Module',
        'path' => APP_DIR . '/websites/backend/modules/account/module.php'
    ),
    'backend_dashboard' => array(
        'className' => 'Backend\Modules\Dashboard\Module',
        'path' => APP_DIR . '/websites/backend/modules/dashboard/module.php'
    ),
    'backend_users' => array(
        'className' => 'Backend\Modules\Users\Module',
        'path' => APP_DIR . '/websites/backend/modules/users/module.php'
    ),
    'backend_setting' => array(
        'className' => 'Backend\Modules\Setting\Module',
        'path' => APP_DIR . '/websites/backend/modules/setting/module.php'
    ),

    'frontend_homepage' => array(
        'className' => 'Frontend\Modules\HomePage\Module',
        'path' => APP_DIR . '/websites/frontend/modules/homepage/module.php'
    ),

    'frontend_pages' => array(
        'className' => 'Frontend\Modules\Pages\Module',
        'path' => APP_DIR . '/websites/frontend/modules/pages/module.php'
    ),
));