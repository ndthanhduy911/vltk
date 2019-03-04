<?php
$loader = new \Phalcon\Loader();

/**
 * We're a registering a set of directories taken from the configuration file
 */

$loader->registerNamespaces(array(
    'Library' => LIB_DIR . '/',
    'Base\Forms' => LIB_DIR . '/forms/',
    'Models' => LIB_DIR . '/models',
));

// Register some classes
$loader->registerClasses(
    array(
        "BackendController"         => LIB_DIR . '/controllers/BackendController.php',
        "FrontendController"         => LIB_DIR . '/controllers/FrontendController.php',
        "NewsBaseController"         => LIB_DIR . '/controllers/NewsBaseController.php',
    )
);

$loader->registerDirs(
    array(
        LIB_DIR . '/',
    ));

$loader->register();