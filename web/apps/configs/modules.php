<?php
/**
 * Register application modules
 */

$application->registerModules(array(
    'backend_account' => array(
        'className' => 'Backend\Modules\Account\Module',
        'path' => APP_DIR . '/websites/backend/modules/account/module.php'
    ),
    'backend_admins' => array(
        'className' => 'Backend\Modules\Admins\Module',
        'path' => APP_DIR . '/websites/backend/modules/admins/module.php'
    ),
    'backend_users' => array(
        'className' => 'Backend\Modules\Users\Module',
        'path' => APP_DIR . '/websites/backend/modules/users/module.php'
    ),
    'backend_setting' => array(
        'className' => 'Backend\Modules\Setting\Module',
        'path' => APP_DIR . '/websites/backend/modules/setting/module.php'
    ),

    'frontend_api' => array(
        'className' => 'Frontend\Modules\Api\Module',
        'path' => APP_DIR . '/websites/frontend/modules/api/module.php'
    ),

    'frontend_dept' => array(
        'className' => 'Frontend\Modules\Dept\Module',
        'path' => APP_DIR . '/websites/frontend/modules/dept/module.php'
    ),
));