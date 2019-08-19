<?php
/**
 * Register application modules
 */

$application->registerModules(array(
    'backend_account' => array(
        'className' => 'Backend\Modules\Account\Module',
        'path' => APP_DIR . '/websites/backend/modules/account/module.php'
    ),
    'backend_posts' => array(
        'className' => 'Backend\Modules\Posts\Module',
        'path' => APP_DIR . '/websites/backend/modules/posts/module.php'
    ),
    'backend_pages' => array(
        'className' => 'Backend\Modules\Pages\Module',
        'path' => APP_DIR . '/websites/backend/modules/pages/module.php'
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

    'frontend_faculty' => array(
        'className' => 'Frontend\Modules\Faculty\Module',
        'path' => APP_DIR . '/websites/frontend/modules/faculty/module.php'
    ),

    'frontend_pages' => array(
        'className' => 'Frontend\Modules\Pages\Module',
        'path' => APP_DIR . '/websites/frontend/modules/pages/module.php'
    ),

    'frontend_dept' => array(
        'className' => 'Frontend\Modules\Dept\Module',
        'path' => APP_DIR . '/websites/frontend/modules/dept/module.php'
    ),
));