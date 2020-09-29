<?php
if (!defined('DEBUG')) define('DEBUG', true);

return new \Phalcon\Config(array(
    'database' => DB,
    'application' => array(
        'modelsDir' => LIB_DIR . '/models/',
        'cacheDir' => BASE_DIR . '/cache/',
        'baseUri' => WEB_URI,
        'baseUrl' => WEB_URL,
        'backendUri' => WEB_ADMIN_URI,
        'backendUrl' => WEB_ADMIN_URL,
        'frontendUrl' => WEB_URL,
        'frontendUri' => WEB_URI,
        'publicUrl' => WEB_URL,
        'cryptSalt' => 'eEAfR|_&G&f,+vU]:jFr!!A&+71w1Ms9~8_4L!<@[N@DyaIP_2My|:+.u>/6m,$D',
        'backendTheme' => 'default',
        'frontendTheme' => 'default',
    )
));